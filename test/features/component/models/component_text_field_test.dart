import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';

void main() {
  group('ComponentTextField', () {
    test('ComponentTextField.empty creates a default text field', () {
      final component = ComponentTextField.empty('test_id');
      expect(component.id, 'test_id');
      expect(component.type, 'text_field');
      expect(component.label, 'Label');
      expect(component.maxLength, 50);
      expect(component.obscure, isFalse);
    });

    test('fromMap parses obscure property correctly', () {
      final map = {
        'id': 'pass_field',
        'label': 'Password',
        'obscure': true,
      };

      final component = ComponentTextField.fromMap(map);
      expect(component.id, 'pass_field');
      expect(component.label, 'Password');
      expect(component.obscure, isTrue);
    });

    test('fromMap defaults obscure to false if missing', () {
      final map = {
        'id': 'user_field',
        'label': 'Username',
      };

      final component = ComponentTextField.fromMap(map);
      expect(component.obscure, isFalse);
    });

    test('toMap includes obscure property', () {
      final component = ComponentTextField(
        id: 'secure_input',
        label: 'Secret',
        maxLength: 20,
        maxLines: 1,
        initialValue: '',
        enabled: true,
        obscure: true,
      );

      final map = component.toMap();
      expect(map['id'], 'secure_input');
      expect(map['obscure'], isTrue);
    });

    test('fromMap handles numeric enabled/disabled values', () {
      final map1 = {'id': 't1', 'label': 'L', 'enabled': '0'};
      final map2 = {'id': 't2', 'label': 'L', 'enabled': '1'};

      expect(ComponentTextField.fromMap(map1).enabled, isFalse);
      expect(ComponentTextField.fromMap(map2).enabled, isTrue);
    });
  });
}
