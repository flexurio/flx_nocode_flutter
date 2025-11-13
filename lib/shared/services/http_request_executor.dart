import 'package:dio/dio.dart';

typedef Json = Map<String, dynamic>;

class HttpRequestConfig {
  final String method;
  final String url;
  final Map<String, String> headers;
  final Object? body;
  final bool asFormData;

  const HttpRequestConfig({
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    this.asFormData = false,
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

/// Tanggung jawab: HANYA handle request HTTP (Dio, logging, parsing error).
class HttpRequestExecutor {
  HttpRequestExecutor({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<HttpRequestResult> execute(HttpRequestConfig config) async {
    final options = Options(
      method: config.method,
      headers: config.headers,
    );

    _logHttpRequest(
      method: config.method,
      url: config.url,
      headers: config.headers,
      body: config.body,
      asFormData: config.asFormData,
    );

    try {
      final Response<Object?> response = await _dio.request<Object?>(
        config.url,
        data: config.body,
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
  void _logHttpRequest({
    required String method,
    required String url,
    required Map<String, String> headers,
    required Object? body,
    required bool asFormData,
  }) {
    print('================ HTTP REQUEST ================');
    print('→ Method     : $method');
    print('→ URL        : $url');
    print('→ Headers    : $headers');
    print('→ Body       : ${body ?? '{}'}');
    print('→ AsFormData : $asFormData');
    print('==============================================');
  }

  void _logHttpResponse({
    required int? statusCode,
    required Object? data,
  }) {
    print('================ HTTP RESPONSE ===============');
    print('← Status : $statusCode');
    print('← Data   : $data');
    print('==============================================');
  }

  void _logHttpError({
    required String type,
    required String message,
    required Object? response,
  }) {
    print('================ HTTP ERROR ==================');
    print('❌ Type     : $type');
    print('❌ Message  : $message');
    print('❌ Response : $response');
    print('==============================================');
  }

  void _logUnexpectedError(Object error) {
    print('================ UNEXPECTED ERROR ============');
    print('❌ $error');
    print('==============================================');
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
    if (responseData is Map<Object?, Object?>) {
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
