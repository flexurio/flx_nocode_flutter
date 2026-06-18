import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';

class MockHttpClientAdapter implements HttpClientAdapter {
  RequestOptions? lastRequestOptions;
  Object? lastRequestBody;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    lastRequestOptions = options;
    lastRequestBody = options.data;

    final responseData = jsonEncode({'status': 'success', 'method': options.method});
    return ResponseBody.fromString(
      responseData,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('HttpRequestExecutor - PATCH Method Tests', () {
    late Dio dio;
    late MockHttpClientAdapter mockAdapter;
    late HttpRequestExecutor executor;

    setUp(() {
      dio = Dio();
      mockAdapter = MockHttpClientAdapter();
      dio.httpClientAdapter = mockAdapter;
      executor = HttpRequestExecutor(dio: dio);
    });

    test('should execute PATCH request with body correctly', () async {
      final config = HttpRequestConfig(
        method: 'PATCH',
        url: 'https://api.example.com/items/1',
        headers: {'Authorization': 'Bearer token_123'},
        body: {'name': 'New Name', 'value': 42},
      );

      final result = await executor.execute(config);

      expect(result.isSuccess, isTrue);
      expect(result.statusCode, 200);
      
      final Map<String, dynamic> responseData = result.data as Map<String, dynamic>;
      expect(responseData['status'], 'success');
      expect(responseData['method'], 'PATCH');

      // Verify that the actual HTTP request details passed to the adapter were correct
      final lastOptions = mockAdapter.lastRequestOptions;
      expect(lastOptions, isNotNull);
      expect(lastOptions!.method, 'PATCH');
      expect(lastOptions.headers['Authorization'], 'Bearer token_123');
      
      // Verify body
      expect(mockAdapter.lastRequestBody, isNotNull);
      final bodyMap = mockAdapter.lastRequestBody as Map<String, dynamic>;
      expect(bodyMap['name'], 'New Name');
      expect(bodyMap['value'], 42);
    });
  });
}
