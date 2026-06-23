import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

class StudioNetworkLogInterceptor extends Interceptor {
  final _uuid = const Uuid();
  final _requestTimes = <String, DateTime>{};
  
  static const _requestIdHeader = 'x-studio-request-id';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestId = _uuid.v4();
    options.headers[_requestIdHeader] = requestId;
    final startTime = DateTime.now();
    _requestTimes[requestId] = startTime;

    final reqHeaders = options.headers.map((k, v) => MapEntry(k, v.toString()));

    _sendStudioLog({
      'type': 'request',
      'id': requestId,
      'method': options.method,
      'url': options.uri.toString(),
      'headers': reqHeaders,
      'body': options.data,
      'timestamp': startTime.toIso8601String(),
    });

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestId = response.requestOptions.headers[_requestIdHeader]?.toString();
    if (requestId != null) {
      final startTime = _requestTimes.remove(requestId);
      final duration = startTime != null ? DateTime.now().difference(startTime) : Duration.zero;

      final resHeaders = <String, dynamic>{};
      response.headers.forEach((name, values) {
        resHeaders[name] = values.length == 1 ? values.first : values;
      });

      _sendStudioLog({
        'type': 'response',
        'id': requestId,
        'statusCode': response.statusCode,
        'headers': resHeaders,
        'body': response.data,
        'durationMs': duration.inMilliseconds,
      });
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final requestId = err.requestOptions.headers[_requestIdHeader]?.toString();
    if (requestId != null) {
      final startTime = _requestTimes.remove(requestId);
      final duration = startTime != null ? DateTime.now().difference(startTime) : Duration.zero;

      final resHeaders = <String, dynamic>{};
      err.response?.headers.forEach((name, values) {
        resHeaders[name] = values.length == 1 ? values.first : values;
      });

      _sendStudioLog({
        'type': 'error',
        'id': requestId,
        'statusCode': err.response?.statusCode,
        'headers': resHeaders.isEmpty ? null : resHeaders,
        'body': err.response?.data,
        'error': err.toString(),
        'durationMs': duration.inMilliseconds,
      });
    }

    super.onError(err, handler);
  }

  void _sendStudioLog(Map<String, dynamic> payload) {
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
