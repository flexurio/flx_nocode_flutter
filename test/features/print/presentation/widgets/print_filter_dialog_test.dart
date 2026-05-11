import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/print_filter_dialog.dart';

void main() {
  // Use a trivial dummy wrapper widget to run the static dialog opener
  Widget buildTestApp(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: child,
          ),
        ),
      ),
    );
  }

  group('PrintFilterDialog Tests', () {
    testWidgets('renders correctly and harvests textual input', (tester) async {
      final fields = <Component>[
        Component.fromMap({
          'id': 'dept_id',
          'type': 'text_field',
          'label': 'Dept ID',
          'required': true,
        }),
        Component.fromMap({
          'id': 'reviewer',
          'type': 'text_field',
          'label': 'Reviewer',
          'required': false,
        }),
      ];

      Map<String, String>? result;

      await tester.pumpWidget(
        buildTestApp(
          ElevatedButton(
            child: const Text('Show Dialog'),
            onPressed: () async {
              final res = await PrintFilterDialog.show(
                tester.element(find.byType(ElevatedButton)),
                printName: 'Personnel Report',
                fields: fields,
                initialData: {'reviewer': 'Admin'},
              );
              result = res;
            },
          ),
        ),
      );

      // Open the dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // 1. Check visual rendering
      expect(find.text('Personnel Report'), findsOneWidget);
      expect(find.text('Dept ID'), findsOneWidget);
      expect(find.text('Reviewer'), findsOneWidget);

      // 2. Verify initial data load
      expect(find.text('Admin'), findsOneWidget);

      // 3. Enter new input
      // 3. Enter new input using concrete TextField finder
      final textField = find.byType(TextField).first;
      await tester.enterText(textField, 'D001');
      await tester.pump();

      // 4. Tap Confirm / Print Action
      // The action button uses Button.action which usually looks for standard labels or semantic tags
      final printBtn = find.byType(Button).last; 
      await tester.tap(printBtn);
      await tester.pumpAndSettle();

      // 5. Validate results popped out correctly
      expect(result, isNotNull);
      expect(result!['dept_id'], equals('D001'));
      expect(result!['reviewer'], equals('Admin'));
    });

    testWidgets('supports action cancellation returns null', (tester) async {
      final fields = <Component>[
        Component.fromMap({
          'id': 'f1',
          'type': 'text_field',
          'label': 'Field 1',
        }),
      ];

      Map<String, String>? result = {'pre': 'set'}; // setup check

      await tester.pumpWidget(
        buildTestApp(
          ElevatedButton(
            child: const Text('Open'),
            onPressed: () async {
              result = await PrintFilterDialog.show(
                tester.element(find.byType(ElevatedButton)),
                printName: 'Cancel Test',
                fields: fields,
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      // Tap cancel button (first button in actions row usually)
      final cancelBtn = find.byType(Button).first;
      await tester.tap(cancelBtn);
      await tester.pumpAndSettle();

      expect(result, isNull);
    });
  });
}
