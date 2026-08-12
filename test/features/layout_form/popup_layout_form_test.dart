import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  group('Nocode Popup & Submit Button Tests', () {
    test('LayoutForm parses popup: true and submit_button: false from JSON', () {
      final json = {
        'id': 'dummy_popup_detail',
        'label': 'Lihat Detail Dummy',
        'popup': true,
        'submit_button': false,
        'components': [
          {'id': 'name', 'type': 'field_display', 'label': 'Nama', 'value': 'Test'}
        ],
      };

      final form = LayoutForm.fromMap(json);

      expect(form.id, equals('dummy_popup_detail'));
      expect(form.popup, isTrue);
      expect(form.submitButton, isFalse);
      expect(form.showSubmitButton, isFalse);
    });

    test('ActionD parses popup: true and submit_button: false from JSON', () {
      final json = {
        'id': 'view_popup_detail',
        'type': 'open_page',
        'name': 'Lihat Detail (Popup)',
        'layout_form_id': 'dummy_popup_detail',
        'popup': true,
        'submit_button': false,
      };

      final action = ActionD.fromJson(json);

      expect(action.id, equals('view_popup_detail'));
      expect(action.popup, isTrue);
      expect(action.showSubmitButton, isFalse);
    });

    testWidgets('CardForm renders close button X and hides bottom actions when empty',
        (WidgetTester tester) async {
      bool closed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardForm(
              popup: true,
              showCloseButton: true,
              title: 'Dummy Popup Test',
              icon: Icons.edit_note,
              actions: const [], // submit_button: false leads to empty actions
              onClose: () {
                closed = true;
              },
              child: const Text('Content Dummy Popup'),
            ),
          ),
        ),
      );

      // Verify Title & Content
      expect(find.text('Dummy Popup Test'), findsOneWidget);
      expect(find.text('Content Dummy Popup'), findsOneWidget);

      // Verify Close Button X icon is visible
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Verify Cancel and Submit buttons are NOT rendered when actions is empty
      expect(find.text('cancel'), findsNothing);
      expect(find.text('submit'), findsNothing);

      // Tap Close Button X
      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(closed, isTrue);
    });

    testWidgets('CardForm renders submit/cancel actions when provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CardForm(
              popup: true,
              showCloseButton: true,
              title: 'Dummy Popup Test With Actions',
              icon: Icons.edit_note,
              actions: [
                ElevatedButton(onPressed: () {}, child: const Text('Cancel Action')),
                ElevatedButton(onPressed: () {}, child: const Text('Submit Action')),
              ],
              child: const Text('Content Dummy Popup'),
            ),
          ),
        ),
      );

      expect(find.text('Cancel Action'), findsOneWidget);
      expect(find.text('Submit Action'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });
}
