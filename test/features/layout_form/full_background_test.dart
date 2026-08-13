import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  group('Popup Modal Tests', () {
    test('ActionD parses popup correctly without full_background parameter', () {
      final jsonPopup = {
        'id': 'test_action',
        'type': 'open_page',
        'name': 'Test',
        'layout_form_id': 'form_1',
        'popup': true,
      };

      final action = ActionD.fromJson(jsonPopup);

      expect(action.popup, isTrue);
      expect(action.toJson().containsKey('full_background'), isFalse);
    });

    test('LayoutForm parses popup correctly without full_background parameter', () {
      final mapPopup = {
        'id': 'form_1',
        'label': 'Form 1',
        'popup': true,
      };

      final form = LayoutForm.fromMap(mapPopup);

      expect(form.popup, isTrue);
      expect(form.toMap().containsKey('full_background'), isFalse);
    });
  });
}
