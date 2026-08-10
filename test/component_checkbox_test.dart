import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_checkbox.dart';

void main() {
  group('ComponentCheckbox Tests', () {
    test('ComponentCheckbox.fromMap parses true/1 values correctly', () {
      final map1 = {
        'id': 'user_active',
        'label': 'Customer Active',
        'value': true,
        'initialValue': '{{data.user_active}}',
      };
      final cb1 = ComponentCheckbox.fromMap(map1);
      expect(cb1.id, 'user_active');
      expect(cb1.label, 'Customer Active');
      expect(cb1.value, isTrue);
      expect(cb1.initialValue, '{{data.user_active}}');

      final map2 = {
        'id': 'is_admin',
        'label': 'Is Admin',
        'value': '1',
      };
      final cb2 = ComponentCheckbox.fromMap(map2);
      expect(cb2.value, isTrue);

      final map3 = {
        'id': 'is_active',
        'label': 'Is Active',
        'value': '0',
      };
      final cb3 = ComponentCheckbox.fromMap(map3);
      expect(cb3.value, isFalse);
    });

    testWidgets('ComponentCheckbox widget renders label and leading checkbox correctly', (tester) async {
      final controller = TextEditingController(text: '1');
      final checkboxComp = ComponentCheckbox(
        id: 'user_active',
        label: 'Customer Active',
        value: true,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: checkboxComp.toWidget({
              'controller': controller,
            }),
          ),
        ),
      );

      expect(find.text('Customer Active'), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsOneWidget);

      final checkboxWidget = tester.widget<CheckboxListTile>(find.byType(CheckboxListTile));
      expect(checkboxWidget.value, isTrue);

      // Tap checkbox label to toggle off
      await tester.tap(find.text('Customer Active'));
      await tester.pumpAndSettle();

      expect(controller.text, '0');
    });
  });
}
