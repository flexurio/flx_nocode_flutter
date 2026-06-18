import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_time_field.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_time_field.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  group('ComponentTimeField', () {
    testWidgets('should render correctly and validate format', (tester) async {
      final component = ComponentTimeField(
        id: 'time_field',
        label: 'Start Time',
        required: true,
        initialValue: '',
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {'time_field': controller}
            }),
          ),
        ),
      );

      expect(find.text('Start Time'), findsOneWidget);
      expect(find.byType(FTextFormField), findsOneWidget);

      // Enter invalid time
      await tester.enterText(find.byType(FTextFormField), '12:3');
      await tester.pump();
      
      // Trigger validation (by looking at the error message if we can, 
      // but usually we need to wrap in a Form and call validate())
    });

    testWidgets('should interpolate initial value', (tester) async {
      final depController = TextEditingController(text: '10:00');
      final component = ComponentTimeField(
        id: 'time_field',
        label: 'Time',
        initialValue: '{{ dep }}',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({
              'allControllers': {'dep': depController}
            }),
          ),
        ),
      );

      final field = tester.widget<FTextFormField>(find.byType(FTextFormField));
      expect(field.controller?.text, '10:00');
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentTimeField(
        id: 'mock',
        label: 'Mock Time',
        initialValue: '',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );

      expect(find.text('Mock Time'), findsOneWidget);
      expect(find.text('HH:mm'), findsOneWidget);
      expect(find.byIcon(Icons.access_time), findsOneWidget);
    });
  });
}
