// core/network/http_request_executor.dart

import 'package:dio/dio.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

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

  const HttpRequestConfig({
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    this.asFormData = false,
    this.mockEnabled = false,
    this.mockData,
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

  static const bool enableLog = false;

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
          dataBody = FormData.fromMap(config.body as Map<String, dynamic>);
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
    final processedHeaders = config.headers.map((k, v) {
      return MapEntry(k.interpolateJavascript(), v.interpolateJavascript());
    });

    final options = Options(
      method: methodUpper,
      headers: processedHeaders,
    );

    if (config.mockEnabled) {
      _logMockRequest(
        method: methodUpper,
        url: processedUrl,
        data: config.mockData,
      );
      return HttpRequestResult.success(
        statusCode: 200,
        data: config.mockData,
      );
    }

    _logHttpRequest(
      method: methodUpper,
      url: processedUrl,
      headers: processedHeaders,
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

      final int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        return HttpRequestResult.success(
          statusCode: response.statusCode,
          data: response.data,
        );
      } else {
        final String message = _extractErrorMessage(
          response.data,
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
      final String message = _extractErrorMessage(
        e.response?.data,
        fallback: e.message ?? 'Unknown error occurred',
      );
      return HttpRequestResult.failure(
        statusCode: e.response?.statusCode,
        message: 'HTTP Error: $message',
        raw: e.response?.data,
      );
    } catch (e) {
      _logUnexpectedError(e);
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
    String fallback = 'Request failed',
  }) {
    if (responseData == null) return fallback;

    if (responseData is String && responseData.trim().isNotEmpty) {
      return responseData;
    }

    if (responseData is Map) {
      final Object? messageField = responseData['message'] ??
          responseData['error'] ??
          responseData['detail'];

      if (messageField is String && messageField.trim().isNotEmpty) {
        return messageField;
      }

      final Object? errors = responseData['errors'];
      if (errors != null) return errors.toString();
    }

    return fallback;
  }
}
