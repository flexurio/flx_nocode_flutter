import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';

void main() {
  group('ComponentConditional Model Tests', () {
    test('ComponentConditional.fromMap parses condition and branches correctly', () {
      final map = {
        'id': 'test_cond',
        'type': 'conditional',
        'condition': '{{status}} == "active"',
        'then': {
          'id': 'success_text',
          'type': 'text',
          'value': 'Active!',
        },
        'else': {
          'id': 'fail_text',
          'type': 'text',
          'value': 'Inactive!',
        }
      };

      final component = ComponentConditional.fromMap(map);

      expect(component.id, 'test_cond');
      expect(component.condition, '{{status}} == "active"');
      expect(component.then, isA<ComponentText>());
      expect(component.otherwise, isA<ComponentText>());
      expect((component.then as ComponentText).value, 'Active!');
      expect((component.otherwise as ComponentText).value, 'Inactive!');
    });

    test('ComponentConditional.fromMap throws on missing condition', () {
      final map = {
        'id': 'test_cond',
        'type': 'conditional',
        'then': {'id': 't', 'type': 'text', 'value': 'v'},
      };

      expect(() => ComponentConditional.fromMap(map), throwsFormatException);
    });

    test('ComponentConditional.toMap includes branches', () {
      final component = ComponentConditional(
        id: 'test_cond',
        condition: '1 == 1',
        then: ComponentText(id: 't1', value: 'Yes'),
        otherwise: ComponentText(id: 't2', value: 'No'),
      );

      final map = component.toMap();

      expect(map['condition'], '1 == 1');
      expect(map['then']['id'], 't1');
      expect(map['else']['id'], 't2');
    });
  });
}
