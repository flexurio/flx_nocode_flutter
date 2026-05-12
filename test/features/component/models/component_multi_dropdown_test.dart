import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_multi_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

void main() {
  group('ComponentMultiDropdown Model Tests', () {
    test('ComponentMultiDropdown.fromMap parses basic properties correctly', () {
      final map = {
        'id': 'test_dropdown',
        'type': 'dropdown_multi_value',
        'label': 'Test Multi Dropdown',
        'options': ['A', 'B', 'C'],
        'initialValues': ['A', 'C'],
        'required': true,
      };

      final component = ComponentMultiDropdown.fromMap(map);

      expect(component.id, 'test_dropdown');
      expect(component.label, 'Test Multi Dropdown');
      expect(component.options, ['A', 'B', 'C']);
      expect(component.initialValues, ['A', 'C']);
      expect(component.required, true);
    });

    test('ComponentMultiDropdown.fromMap handles initialValue as comma-separated string', () {
      final map = {
        'id': 'test_dropdown',
        'type': 'dropdown_multi_value',
        'initialValue': 'A, B, C',
      };

      final component = ComponentMultiDropdown.fromMap(map);

      expect(component.initialValues, ['A', 'B', 'C']);
    });

    test('ComponentMultiDropdown.fromMap handles httpData correctly', () {
      final map = {
        'id': 'test_dropdown',
        'type': 'dropdown_multi_value',
        'httpData': {
          'url': 'https://api.example.com/data',
          'method': 'GET',
        },
      };

      final component = ComponentMultiDropdown.fromMap(map);

      expect(component.httpData, isNotNull);
      expect(component.httpData!.url, 'https://api.example.com/data');
      expect(component.httpData!.method, 'GET');
    });

    test('ComponentMultiDropdown.toMap includes initialValues', () {
      final component = ComponentMultiDropdown(
        id: 'test_dropdown',
        label: 'Test',
        options: ['A'],
        initialValues: ['A'],
      );

      final map = component.toMap();

      expect(map['initialValues'], ['A']);
      expect(map['id'], 'test_dropdown');
      expect(map['type'], 'dropdown_multi_value');
    });

    test('ComponentMultiDropdown.empty creates a valid instance', () {
      final component = ComponentMultiDropdown.empty('empty_id');

      expect(component.id, 'empty_id');
      expect(component.label, 'Multi Dropdown');
      expect(component.options, isNotEmpty);
      expect(component.initialValues, isEmpty);
      expect(component.widthMode, ComponentSizeMode.fill);
    });
  });
}
