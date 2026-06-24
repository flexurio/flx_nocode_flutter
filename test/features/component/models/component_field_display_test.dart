import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';

void main() {
  group('ComponentFieldDisplay Tests', () {
    test('fromMap parses valueType correctly with snake_case key', () {
      final map = {
        'id': 'test_field_display',
        'type': 'field_display',
        'label': 'Dibuat Oleh',
        'value': '{{data.created_by_id}}',
        'value_type': 'user_name',
      };

      final component = ComponentFieldDisplay.fromMap(map);

      expect(component.id, 'test_field_display');
      expect(component.label, 'Dibuat Oleh');
      expect(component.value, '{{data.created_by_id}}');
      expect(component.valueType, 'user_name');
    });

    test('fromMap parses valueType correctly with camelCase key', () {
      final map = {
        'id': 'test_field_display',
        'type': 'field_display',
        'label': 'Dibuat Oleh',
        'value': '{{data.created_by_id}}',
        'valueType': 'user_name_with_id',
      };

      final component = ComponentFieldDisplay.fromMap(map);

      expect(component.id, 'test_field_display');
      expect(component.valueType, 'user_name_with_id');
    });

    test('fromMap sets valueType to null if not provided', () {
      final map = {
        'id': 'test_field_display',
        'type': 'field_display',
        'label': 'Dibuat Oleh',
        'value': '{{data.created_by_id}}',
      };

      final component = ComponentFieldDisplay.fromMap(map);

      expect(component.valueType, isNull);
    });

    test('toMap serializes valueType property when present', () {
      final component = ComponentFieldDisplay(
        id: 'test_field_display',
        label: 'Dibuat Oleh',
        value: '{{data.created_by_id}}',
        valueType: 'user_name',
      );

      final map = component.toMap();

      expect(map['valueType'], 'user_name');
    });

    test('toMap does not serialize valueType property when null', () {
      final component = ComponentFieldDisplay(
        id: 'test_field_display',
        label: 'Dibuat Oleh',
        value: '{{data.created_by_id}}',
        valueType: null,
      );

      final map = component.toMap();

      expect(map.containsKey('valueType'), isFalse);
    });
  });
}
