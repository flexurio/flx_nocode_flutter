import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_date_picker.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  group('ComponentDatePicker', () {
    testWidgets('should render correctly with label and initial value', (tester) async {
      final component = ComponentDatePicker(
        id: 'date_picker',
        label: 'Select Date',
        initialValue: '2023-10-01',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Select Date'), findsOneWidget);
      expect(find.byType(FieldDatePicker), findsOneWidget);
      
      final field = tester.widget<FieldDatePicker>(find.byType(FieldDatePicker));
      expect(field.controller.text, 'October 1, 2023');
    });

    testWidgets('should handle dependencies and reset value', (tester) async {
      final depController = TextEditingController(text: 'A');
      final targetController = TextEditingController(text: '2023-10-01');

      final component = ComponentDatePicker(
        id: 'target',
        label: 'Target Date',
        dependsOn: ['dep'],
        initialValue: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {
                'dep': depController,
                'target': targetController,
              }
            }),
          ),
        ),
      );

      expect(targetController.text, 'October 1, 2023');

      // Change dependency
      depController.text = 'B';
      await tester.pump();

      // Should be reset
      expect(targetController.text, '');
    });

    testWidgets('should interpolate min and max dates', (tester) async {
      final minController = TextEditingController(text: '2023-01-01');
      final maxController = TextEditingController(text: '2023-12-31');

      final component = ComponentDatePicker(
        id: 'date_picker',
        label: 'Date',
        minDate: '{{ min_val }}',
        maxDate: '{{ max_val }}',
        initialValue: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {
                'min_val': minController,
                'max_val': maxController,
              }
            }),
          ),
        ),
      );

      final field = tester.widget<FieldDatePicker>(find.byType(FieldDatePicker));
      expect(field.minDate, DateTime(2023, 1, 1));
      expect(field.maxDate, DateTime(2023, 12, 31));
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentDatePicker(
        id: 'mock',
        label: 'Mock Date',
        initialValue: '2023-10-01',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );

      expect(find.text('Mock Date'), findsOneWidget);
      expect(find.text('2023-10-01'), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });
  });
}
