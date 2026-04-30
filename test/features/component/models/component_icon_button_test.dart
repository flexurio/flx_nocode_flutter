import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_icon_button.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

void main() {
  group('ComponentIconButton Model Tests', () {
    test('fromMap should handle snake_case on_click', () {
      final map = {
        'id': 'ibtn1',
        'type': 'icon_button',
        'icon': 'add',
        'color': '#2196F3',
        'on_click': {
          'id': 'act1',
          'type': 'refresh',
          'name': 'Refresh'
        }
      };

      final btn = ComponentIconButton.fromMap(map);
      expect(btn.onClick, isNotNull);
      expect(btn.onClick!.id, 'act1');
    });

    test('fromMap should handle camelCase onClick (backward compatibility)', () {
      final map = {
        'id': 'ibtn1',
        'type': 'icon_button',
        'icon': 'add',
        'color': '#2196F3',
        'onClick': {
          'id': 'act1',
          'type': 'refresh',
          'name': 'Refresh'
        }
      };

      final btn = ComponentIconButton.fromMap(map);
      expect(btn.onClick, isNotNull);
      expect(btn.onClick!.id, 'act1');
    });

    test('toMap should use snake_case on_click', () {
      final btn = ComponentIconButton(
        id: 'ibtn1',
        icon: 'add',
        color: '#2196F3',
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
    });
  });
}
