import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/widgets/entity_create_layouts.dart';

void main() {
  group('EntityCreatePanelLayout Tests', () {
    testWidgets('should show submit button when showSubmitButton is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EntityCreatePanelLayout(
            embedded: false,
            theme: ThemeData.light(),
            formKey: GlobalKey<FormState>(),
            form: const Text('Test Form'),
            submitButton: const Text('Submit Button'),
            showSubmitButton: true,
            coreEntity: const Entity(titleX: 'test', subtitleX: 'test', iconPath: ''),
            title: 'Test Title',
            action: DataAction.create,
          ),
        ),
      );

      expect(find.text('Submit Button'), findsOneWidget);
    });

    testWidgets('should hide submit button when showSubmitButton is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EntityCreatePanelLayout(
            embedded: false,
            theme: ThemeData.light(),
            formKey: GlobalKey<FormState>(),
            form: const Text('Test Form'),
            submitButton: const Text('Submit Button'),
            showSubmitButton: false,
            coreEntity: const Entity(titleX: 'test', subtitleX: 'test', iconPath: ''),
            title: 'Test Title',
            action: DataAction.create,
          ),
        ),
      );

      expect(find.text('Submit Button'), findsNothing);
    });
  });

  group('EntityCreateEmbeddedLayout Tests', () {
    testWidgets('should show submit button when showSubmitButton is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EntityCreateEmbeddedLayout(
            formKey: GlobalKey<FormState>(),
            form: const Text('Test Form'),
            submitButton: const Text('Submit Button'),
            showSubmitButton: true,
          ),
        ),
      );

      expect(find.text('Submit Button'), findsOneWidget);
    });

    testWidgets('should hide submit button when showSubmitButton is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EntityCreateEmbeddedLayout(
            formKey: GlobalKey<FormState>(),
            form: const Text('Test Form'),
            submitButton: const Text('Submit Button'),
            showSubmitButton: false,
          ),
        ),
      );

      expect(find.text('Submit Button'), findsNothing);
    });
  });
}
