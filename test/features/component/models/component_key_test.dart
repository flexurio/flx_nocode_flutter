import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';

void main() {
  group('Component Key Parsing and Serialization Tests', () {
    test('Component.fromMap should parse key property from map', () {
      final map = {
        'id': 'table1',
        'type': 'table',
        'key': '{{ now() }}',
        'http': {
          'method': 'GET',
          'url': 'https://api.example.com/data',
          'headers': {},
          'body': {}
        },
        'columns': []
      };

      final comp = Component.fromMap(map);
      expect(comp.key, '{{ now() }}');
    });

    test('Component.toMap should serialize key property to map', () {
      final comp = Component(
        id: 'field1',
        type: 'text_field',
        key: 'field_key_123',
      );

      final map = comp.toMap();
      expect(map['key'], 'field_key_123');
    });
  });
}
