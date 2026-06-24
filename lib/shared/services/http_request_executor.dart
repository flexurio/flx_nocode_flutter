// core/network/http_request_executor.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/src/app/util/file_picker_upload_registry.dart';
import 'package:uuid/uuid.dart';
import 'package:flx_nocode_flutter/shared/services/network_logger.dart';

typedef Json = Map<String, dynamic>;

class HttpRequestConfig {
  final String method;
  final String url;
  final Map<String, String> headers;

  /// Bisa Map<String, dynamic> (JSON), FormData, String, dll.
  ///
  /// - Untuk GET/DELETE, kalau berupa Map<String, dynamic> akan
  ///   dikonversi menjadi queryParameters.
  /// - Untuk POST/PUT/PATCH, akan dikirim sebagai body.
  final Object? body;

  /// Jika true dan [body] berupa Map<String, dynamic>,
  /// akan dikonversi ke [FormData.fromMap].
  final bool asFormData;

  /// Whether to use mock data instead of calling the actual API.
  final bool mockEnabled;

  /// The data to return when [mockEnabled] is true.
  final Object? mockData;

  /// Optional JSON path to extract error message from response.
  final String? errorMessagePath;

  const HttpRequestConfig({
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    this.asFormData = false,
    this.mockEnabled = false,
    this.mockData,
    this.errorMessagePath,
  });
}

class HttpRequestResult {
  final bool isSuccess;
  final int? statusCode;
  final Object? data;
  final String? message;
  final Object? raw;

  const HttpRequestResult._({
    required this.isSuccess,
    this.statusCode,
    this.data,
    this.message,
    this.raw,
  });

  factory HttpRequestResult.success({
    required int? statusCode,
    required Object? data,
  }) {
    return HttpRequestResult._(
      isSuccess: true,
      statusCode: statusCode,
      data: data,
    );
  }

  factory HttpRequestResult.failure({
    required int? statusCode,
    required String message,
    Object? raw,
  }) {
    return HttpRequestResult._(
      isSuccess: false,
      statusCode: statusCode,
      message: message,
      raw: raw,
    );
  }
}

class HttpRequestExecutor {
  HttpRequestExecutor({Dio? dio}) : _dio = dio ?? Dio();

  static const bool enableLog = true;

  final Dio _dio;

  Future<HttpRequestResult> execute(HttpRequestConfig config) async {
    final String methodUpper = config.method.toUpperCase();

    const methodsWithBody = {'POST', 'PUT', 'PATCH'};
    final bool hasBody = methodsWithBody.contains(methodUpper);

    Object? dataBody;
    Map<String, dynamic>? queryParameters;

    if (config.body != null) {
      if (hasBody) {
        if (config.asFormData && config.body is Map<String, dynamic>) {
          final formDataBody =
              await FilePickerUploadRegistry.prepareFormDataMap(
            config.body as Map<String, dynamic>,
          );
          dataBody = FormData.fromMap(formDataBody);
        } else {
          dataBody = config.body;
        }
      } else if (config.body is Map<String, dynamic>) {
        queryParameters = Map<String, dynamic>.from(
          config.body as Map<String, dynamic>,
        );
      } else {
        dataBody = config.body;
      }
    }

    final processedUrl = config.url.interpolateJavascript();

    // Sanitize headers: Remove forbidden browser headers that can cause CORS/Security errors
    final forbiddenHeaders = {
      'connection',
      'user-agent',
      'host',
      'origin',
      'referer',
      'sec-fetch-dest',
      'sec-fetch-mode',
      'sec-fetch-site',
      'sec-gpc',
      'sec-ch-ua',
      'sec-ch-ua-mobile',
      'sec-ch-ua-platform',
      'accept-encoding',
      'content-length',
    };

    final sanitizedHeaders = <String, String>{};
    config.headers.forEach((k, v) {
      if (!forbiddenHeaders.contains(k.toLowerCase())) {
        sanitizedHeaders[k.interpolateJavascript()] = v.interpolateJavascript();
      }
    });

    final options = Options(
      method: methodUpper,
      headers: sanitizedHeaders,
    );

    final String requestId = const Uuid().v4();
    final DateTime startTime = DateTime.now();

    // Send log request to Studio local server
    _sendStudioLog({
      'type': 'request',
      'id': requestId,
      'method': methodUpper,
      'url': processedUrl,
      'headers': sanitizedHeaders,
      'body': config.body,
      'timestamp': startTime.toIso8601String(),
    });

    // Log the request to NetworkLogger
    NetworkLogger.instance.logRequest(
      NetworkLogEntry(
        id: requestId,
        method: methodUpper,
        url: processedUrl,
        requestHeaders: sanitizedHeaders,
        requestBody: config.body,
        timestamp: startTime,
      ),
    );

    if (config.mockEnabled) {
      _logMockRequest(
        method: methodUpper,
        url: processedUrl,
        data: config.mockData,
      );
      final duration = DateTime.now().difference(startTime);
      _sendStudioLog({
        'type': 'response',
        'id': requestId,
        'statusCode': 200,
        'headers': {'Mocked': 'true'},
        'body': config.mockData,
        'durationMs': duration.inMilliseconds,
      });
      NetworkLogger.instance.updateResponse(
        requestId,
        responseStatus: 200,
        responseHeaders: {'Mocked': 'true'},
        responseBody: config.mockData,
        error: null,
        duration: duration,
      );
      return HttpRequestResult.success(
        statusCode: 200,
        data: config.mockData,
      );
    }

    _logHttpRequest(
      method: methodUpper,
      url: processedUrl,
      headers: sanitizedHeaders,
      body: config.body,
      asFormData: config.asFormData,
    );

    try {
      final Response<Object?> response = await _dio.request<Object?>(
        processedUrl,
        data: dataBody,
        queryParameters: queryParameters,
        options: options,
      );

      _logHttpResponse(
        statusCode: response.statusCode,
        data: response.data,
      );

      final duration = DateTime.now().difference(startTime);
      final responseHeadersMap = <String, dynamic>{};
      response.headers.forEach((name, values) {
        responseHeadersMap[name] = values.length == 1 ? values.first : values;
      });

      _sendStudioLog({
        'type': 'response',
        'id': requestId,
        'statusCode': response.statusCode,
        'headers': responseHeadersMap,
        'body': response.data,
        'durationMs': duration.inMilliseconds,
      });

      NetworkLogger.instance.updateResponse(
        requestId,
        responseStatus: response.statusCode,
        responseHeaders: responseHeadersMap,
        responseBody: response.data,
        error: null,
        duration: duration,
      );

      final int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        return HttpRequestResult.success(
          statusCode: response.statusCode,
          data: response.data,
        );
      } else {
        final String message = _extractErrorMessage(
          response.data,
          path: config.errorMessagePath,
          fallback:
              'Request failed: ${response.statusCode} - ${response.statusMessage}',
        );
        return HttpRequestResult.failure(
          statusCode: response.statusCode,
          message: message,
          raw: response.data,
        );
      }
    } on DioException catch (e) {
      _logHttpError(
        type: e.type.toString(),
        message: e.message ?? '-',
        response: e.response?.data,
      );
      final duration = DateTime.now().difference(startTime);
      final responseHeadersMap = <String, dynamic>{};
      e.response?.headers.forEach((name, values) {
        responseHeadersMap[name] = values.length == 1 ? values.first : values;
      });

      _sendStudioLog({
        'type': 'error',
        'id': requestId,
        'statusCode': e.response?.statusCode,
        'headers': responseHeadersMap.isEmpty ? null : responseHeadersMap,
        'body': e.response?.data,
        'error': e.toString(),
        'durationMs': duration.inMilliseconds,
      });

      NetworkLogger.instance.updateResponse(
        requestId,
        responseStatus: e.response?.statusCode,
        responseHeaders: responseHeadersMap.isEmpty ? null : responseHeadersMap,
        responseBody: e.response?.data,
        error: e.toString(),
        duration: duration,
      );
      final String message = _extractErrorMessage(
        e.response?.data,
        path: config.errorMessagePath,
        fallback:
            e.message ?? 'Network error or CORS policy blocked the request',
      );
      return HttpRequestResult.failure(
        statusCode: e.response?.statusCode,
        message: 'HTTP Error: $message',
        raw: e.response?.data,
      );
    } catch (e) {
      _logUnexpectedError(e);
      final duration = DateTime.now().difference(startTime);

      _sendStudioLog({
        'type': 'error',
        'id': requestId,
        'statusCode': null,
        'headers': null,
        'body': null,
        'error': e.toString(),
        'durationMs': duration.inMilliseconds,
      });

      NetworkLogger.instance.updateResponse(
        requestId,
        responseStatus: null,
        responseHeaders: null,
        responseBody: null,
        error: e.toString(),
        duration: duration,
      );
      return HttpRequestResult.failure(
        statusCode: null,
        message: 'Unexpected error: $e',
        raw: null,
      );
    }
  }

  // --------------------------- LOGGING -------------------------------------
  void _logMockRequest({
    required String method,
    required String url,
    required Object? data,
  }) {
    if (enableLog) {
      print('================ HTTP MOCK REQUEST ============');
      print('→ Method     : $method');
      print('→ URL        : $url');
      print('→ Mock Data  : $data');
      print('==============================');
    }
  }

  void _logHttpRequest({
    required String method,
    required String url,
    required Map<String, String> headers,
    required Object? body,
    required bool asFormData,
  }) {
    if (enableLog) {
      print('================ HTTP REQUEST ================');
      print('→ Method     : $method');
      print('→ URL        : $url');
      print('→ Headers    : $headers');
      print('→ Body       : ${body ?? '{}'}');
      print('→ AsFormData : $asFormData');
      print('==============================================');
    }
  }

  void _logHttpResponse({
    required int? statusCode,
    required Object? data,
  }) {
    if (enableLog) {
      print('================ HTTP RESPONSE ===============');
      print('← Status : $statusCode');
      print('← Data   : $data');
      print('==============================================');
    }
  }

  void _logHttpError({
    required String type,
    required String message,
    required Object? response,
  }) {
    if (enableLog) {
      print('================ HTTP ERROR ==================');
      print('❌ Type     : $type');
      print('❌ Message  : $message');
      print('❌ Response : $response');
      print('==============================================');
    }
  }

  void _logUnexpectedError(Object error) {
    if (enableLog) {
      print('================ UNEXPECTED ERROR ============');
      print('❌ $error');
      print('==============================================');
    }
  }

  // ------------------------ ERROR PARSER ------------------------------------
  String _extractErrorMessage(
    Object? responseData, {
    String? path,
    String fallback = 'Request failed',
  }) {
    if (responseData == null) return fallback;

    if (responseData is Map) {
      if (path != null && path.isNotEmpty) {
        final customMessage = _getValueFromPath(responseData, path);
        if (customMessage != null && customMessage.toString().isNotEmpty) {
          return customMessage.toString();
        }
      }

      final Object? messageField = responseData['message'] ??
          responseData['error'] ??
          responseData['detail'];

      if (messageField is String && messageField.trim().isNotEmpty) {
        return messageField;
      }

      final Object? errors = responseData['errors'];
      if (errors != null) return errors.toString();
    }

    if (responseData is String && responseData.trim().isNotEmpty) {
      return responseData;
    }

    return fallback;
  }

  Object? _getValueFromPath(Map data, String path) {
    final parts = path.split('.');
    dynamic current = data;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }

  void _sendStudioLog(Map<String, dynamic> payload) {
    if (kIsWeb) return;
    final studioPort = Platform.environment['STUDIO_PORT'];
    if (studioPort == null || studioPort.isEmpty) return;

    scheduleMicrotask(() async {
      try {
        final client = HttpClient();
        final uri = Uri.parse('http://127.0.0.1:$studioPort/network_log');
        final request = await client.postUrl(uri);
        request.headers.contentType = ContentType.json;
        request.write(jsonEncode(payload));
        final response = await request.close();
        await response.drain();
        client.close();
      } catch (_) {}
    });
  }
}
