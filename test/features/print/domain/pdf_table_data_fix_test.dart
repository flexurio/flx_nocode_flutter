import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_data_utils.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

void main() {
  setUpAll(() {
    registerFallbackValue(const HttpRequestConfig(
      method: 'GET',
      url: '',
      headers: {},
    ));
  });

  group('PdfDataUtils Table Data Fix Tests', () {
    test('fetchAllHttpData should inject list result into component data field', () async {
      final mockExecutor = MockHttpRequestExecutor();
      final contextData = <String, dynamic>{};
      
      final tableJson = {
        'type': 'table',
        'http_data': {
          'method': 'GET',
          'url': 'api/users',
        },
      };

      final responseData = [
        {'name': 'Alice'},
        {'name': 'Bob'},
      ];

      when(() => mockExecutor.execute(any())).thenAnswer((_) async {
        return HttpRequestResult.success(statusCode: 200, data: responseData);
      });

      await PdfDataUtils.fetchAllHttpData(tableJson, contextData, executor: mockExecutor);

      // Check if contextData was updated
      expect(contextData['data'], equals(responseData));
      
      // Check if tableJson itself was updated with 'data' field
      expect(tableJson['data'], isA<List>());
      expect((tableJson['data'] as List).length, 2);
      expect((tableJson['data'] as List)[0]['name'], 'Alice');
    });

    test('fetchAllHttpData should inject resData["data"] into component data field if result is a Map', () async {
      final mockExecutor = MockHttpRequestExecutor();
      final contextData = <String, dynamic>{};
      
      final tableJson = {
        'type': 'table',
        'http_data': {
          'method': 'GET',
          'url': 'api/users',
        },
      };

      final responseData = {
        'data': [
          {'name': 'Alice'},
          {'name': 'Bob'},
        ],
        'total': 2
      };

      when(() => mockExecutor.execute(any())).thenAnswer((_) async {
        return HttpRequestResult.success(statusCode: 200, data: responseData);
      });

      await PdfDataUtils.fetchAllHttpData(tableJson, contextData, executor: mockExecutor);

      // Check if tableJson itself was updated with 'data' field from response['data']
      expect(tableJson['data'], isA<List>());
      expect((tableJson['data'] as List).length, 2);
      expect((tableJson['data'] as List)[1]['name'], 'Bob');
    });
  });
}
