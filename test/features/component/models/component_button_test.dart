import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

void main() {
  group('ComponentButton Model Tests', () {
    test('fromMap should handle snake_case on_click', () {
      final map = {
        'id': 'btn1',
        'type': 'button',
        'text': 'Save',
        'color': '#FF0000',
        'on_click': {
          'id': 'act1',
          'type': 'refresh',
          'name': 'Refresh'
        }
      };

      final btn = ComponentButton.fromMap(map);
      expect(btn.onClick, isNotNull);
      expect(btn.onClick!.id, 'act1');
      expect(btn.onClick!.type, ActionType.refresh);
    });

    test('fromMap should handle camelCase onClick (backward compatibility)', () {
      final map = {
        'id': 'btn1',
        'type': 'button',
        'text': 'Save',
        'color': '#FF0000',
        'onClick': {
          'id': 'act1',
          'type': 'refresh',
          'name': 'Refresh'
        }
      };

      final btn = ComponentButton.fromMap(map);
      expect(btn.onClick, isNotNull);
      expect(btn.onClick!.id, 'act1');
    });

    test('toMap should use snake_case on_click', () {
      final btn = ComponentButton(
        id: 'btn1',
        text: 'Save',
        color: '#FF0000',
        onClick: ActionD(
          id: 'act1',
          type: ActionType.refresh,
          name: 'Refresh',
          isMultiple: false,
          onSuccess: 'toast',
          onFailure: 'toast',
        ),
      );

      final map = btn.toMap();
      expect(map.containsKey('on_click'), isTrue);
      expect(map.containsKey('onClick'), isFalse);
      expect(map['on_click']['id'], 'act1');
    });
  });
}
