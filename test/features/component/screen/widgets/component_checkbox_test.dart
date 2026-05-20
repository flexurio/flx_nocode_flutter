import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_checkbox.dart';

void main() {
  group('ComponentCheckbox', () {
    testWidgets('should render correctly and handle state changes', (tester) async {
      final component = ComponentCheckbox(
        id: 'test_checkbox',
        label: 'Accept terms',
        value: false,
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {'test_checkbox': controller}
            }),
          ),
        ),
      );

      expect(find.text('Accept terms'), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsOneWidget);

      final checkbox = tester.widget<CheckboxListTile>(find.byType(CheckboxListTile));
      expect(checkbox.value, isFalse);

      // Tap to check
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      expect(controller.text, '1');
      
      // Tap to uncheck
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      expect(controller.text, '0');
    });

    testWidgets('should respect initial value from controller', (tester) async {
      final component = ComponentCheckbox(
        id: 'test_checkbox',
        label: 'Accept terms',
        value: false,
      );

      final controller = TextEditingController(text: '1');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {'test_checkbox': controller}
            }),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final checkbox = tester.widget<CheckboxListTile>(find.byType(CheckboxListTile));
      expect(checkbox.value, isTrue);
    });

    testWidgets('should render mock widget', (tester) async {
      final componentChecked = ComponentCheckbox(
        id: 'checked',
        label: 'Checked',
        value: true,
      );
      
      final componentUnchecked = ComponentCheckbox(
        id: 'unchecked',
        label: 'Unchecked',
        value: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              componentChecked.toMockWidget(),
              componentUnchecked.toMockWidget(),
            ],
          ),
        ),
      );

      expect(find.text('Checked'), findsOneWidget);
      expect(find.text('Unchecked'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
