import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/json_pdf_generator.dart';
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

  group('JsonPdfGenerator Tests', () {
    test('Should generate a valid PDF with simple canvas layout', () async {
      final json = {
        'layout_type': 'canvas',
        'page_size': 'A4',
        'pages': [
          {
            'components': [
              {'type': 'text', 'value': 'Hello World', 'x': 10, 'y': 10}
            ]
          }
        ]
      };

      final bytes = await JsonPdfGenerator.generate(json);

      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
    });

    test('Should throw exception when no pages are defined', () async {
      final json = {
        'layout_type': 'canvas',
        'page_size': 'A4',
        'pages': []
      };

      expect(
        () => JsonPdfGenerator.generate(json),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('PDF document has no pages'),
        )),
      );
    });

    test('Should handle complex interpolation and Map type mismatches', () async {
      // This test specifically targets the fix where Map<dynamic, dynamic> 
      // might be returned from interpolation and needs to be handled.
      final json = {
        'layout_type': 'canvas',
        'page_size': 'A4',
        'pages': [
          {
            'components': [
              {'type': 'text', 'value': 'User: {{user.name}}', 'x': 10, 'y': 10}
            ]
          }
        ]
      };

      final data = {
        'user': {'name': 'John Doe'}
      };

      final bytes = await JsonPdfGenerator.generate(json, data: data);

      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
    });

    test('Should successfully fetch http_data and use it in interpolation', () async {
      final mockExecutor = MockHttpRequestExecutor();
      
      final json = {
        'layout_type': 'canvas',
        'page_size': 'A4',
        'pages': [
          {
            'components': [
              {
                'type': 'table',
                'x': 10, 'y': 20,
                'http_data': {
                  'method': 'GET',
                  'url': 'https://api.example.com/users',
                },
                'columns': [
                  {'header': 'Name', 'key': 'name'}
                ],
                'data': '{{data}}'
              }
            ]
          }
        ]
      };

      when(() => mockExecutor.execute(any())).thenAnswer((_) async => 
        HttpRequestResult.success(
          statusCode: 200,
          data: [
            {'name': 'Alice'},
            {'name': 'Bob'},
          ],
        )
      );

      final bytes = await JsonPdfGenerator.generate(
        json, 
        executor: mockExecutor
      );

      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
      
      verify(() => mockExecutor.execute(any())).called(1);
    });

    test('Should handle malformed pages list after interpolation', () async {
      final json = {
        'layout_type': 'canvas',
        'page_size': 'A4',
        'pages': '{{some_missing_variable}}'
      };

      // Since pages is expected to be a list, if interpolation returns a string, 
      // it should fail gracefully with our new check.
      expect(
        () => JsonPdfGenerator.generate(json),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('PDF document has no pages'),
        )),
      );
    });
  });
}
