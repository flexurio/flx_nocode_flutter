import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_interpolation_utils.dart';

void main() {
  group('PdfInterpolationUtils Tests', () {
    test('Should interpolate simple strings', () {
      final data = {'name': 'John'};
      expect(PdfInterpolationUtils.interpolate('Hello {{name}}', data), 'Hello John');
    });

    test('Should handle nested data access', () {
      final data = {
        'user': {'profile': {'name': 'Alice'}}
      };
      expect(PdfInterpolationUtils.interpolate('User: {{user.profile.name}}', data), 'User: Alice');
    });

    test('Should preserve placeholders when keys are missing', () {
      final data = {'a': 1};
      expect(PdfInterpolationUtils.interpolate('Val: {{b}}', data), 'Val: {{b}}');
    });

    test('Should return raw object for full-match interpolation in interpolateJson', () {
      final data = {
        'items': [1, 2, 3]
      };
      final result = PdfInterpolationUtils.interpolateJson('{{items}}', data);
      expect(result, isA<List>());
      expect(result, equals([1, 2, 3]));
    });

    test('Should recursively interpolate Maps and Lists', () {
      final data = {'val': 10};
      final template = {
        'a': 'Value {{val}}',
        'b': ['Item {{val}}'],
        'c': {'nested': '{{val}}'}
      };
      
      final result = PdfInterpolationUtils.interpolateJson(template, data);
      expect(result['a'], 'Value 10');
      expect(result['b'][0], 'Item 10');
      expect(result['c']['nested'], '10');
    });
  });
}
