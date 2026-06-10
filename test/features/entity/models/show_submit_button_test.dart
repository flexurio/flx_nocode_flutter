import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/submit_workflow/submit_workflow.dart';

void main() {
  group('show_submit_button Tests', () {
    test('ActionD.fromJson should parse show_submit_button', () {
      final json = {
        'id': 'view_detail',
        'type': 'open_page',
        'name': 'View Detail',
        'layout_form_id': 'detail_page',
        'show_submit_button': false,
      };

      final action = ActionD.fromJson(json);

      expect(action.showSubmitButton, isFalse);
    });

    test('ActionD.fromJson should handle missing show_submit_button as null', () {
      final json = {
        'id': 'view_detail',
        'type': 'open_page',
        'name': 'View Detail',
        'layout_form_id': 'detail_page',
      };

      final action = ActionD.fromJson(json);

      expect(action.showSubmitButton, isNull);
    });

    test('SubmitWorkflow.fromMap should parse show_submit_button', () {
      final map = {
        'type': 'workflow',
        'show_submit_button': false,
        'actions': [],
      };

      final workflow = SubmitWorkflow.fromMap(map);

      expect(workflow.showSubmitButton, isFalse);
    });

    test('LayoutForm.showSubmitButton should use SubmitWorkflow value', () {
      final map = {
        'id': 'test_form',
        'label': 'Test',
        'submit_workflow': {
          'type': 'workflow',
          'show_submit_button': false,
          'actions': [],
        },
      };

      final layout = LayoutForm.fromMap(map);

      expect(layout.showSubmitButton, isFalse);
    });

    test('LayoutForm.showSubmitButton should default to true if missing', () {
      final map = {
        'id': 'test_form',
        'label': 'Test',
        'submit_workflow': {
          'type': 'workflow',
          'actions': [],
        },
      };

      final layout = LayoutForm.fromMap(map);

      expect(layout.showSubmitButton, isTrue);
    });
  });
}
