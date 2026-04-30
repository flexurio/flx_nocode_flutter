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

  group('JsonPdfGenerator Integration Tests', () {
    test('Should generate Canvas layout', () async {
      final json = {
        'layout_type': 'canvas',
        'pages': [
          {
            'components': [
              {'type': 'text', 'value': 'Page 1', 'x': 10, 'y': 10}
            ]
          }
        ]
      };

      final bytes = await JsonPdfGenerator.generate(json);
      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
    });

    test('Should generate Document layout with headers and footers', () async {
      final json = {
        'layout_type': 'document',
        'header': [
          {'type': 'text', 'value': 'Global Header', 'x': 0, 'y': 0}
        ],
        'content': [
          {'type': 'text', 'value': 'Body Content'}
        ],
        'footer': [
          {'type': 'text', 'value': 'Global Footer', 'x': 0, 'y': 0}
        ]
      };

      final bytes = await JsonPdfGenerator.generate(json);
      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
    });

    test('Should throw exception when Canvas layout has no pages', () async {
      final json = {'layout_type': 'canvas', 'pages': []};

      expect(
        () => JsonPdfGenerator.generate(json),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('PDF document has no pages'),
        )),
      );
    });

    test('Should resolve http_data and use it in interpolation', () async {
      final mockExecutor = MockHttpRequestExecutor();

      final json = {
        'layout_type': 'document',
        'content': [
          {'type': 'text', 'value': 'User: {{name}}'}
        ],
        'http_data': {
          'method': 'GET',
          'url': 'api/me',
        }
      };

      when(() => mockExecutor.execute(any()))
          .thenAnswer((_) async => HttpRequestResult.success(
                statusCode: 200,
                data: {'name': 'Charlie'},
              ));

      final bytes =
          await JsonPdfGenerator.generate(json, executor: mockExecutor);
      expect(bytes, isA<Uint8List>());
      expect(bytes.length, greaterThan(0));
      verify(() => mockExecutor.execute(any())).called(1);
    });
  });
}
