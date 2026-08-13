import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  group('Full Background Parsing Tests', () {
    test('ActionD parses full_background correctly', () {
      final jsonFalse = {
        'id': 'test_action',
        'type': 'open_page',
        'name': 'Test',
        'layout_form_id': 'form_1',
        'popup': true,
      };

      final jsonTrue = {
        'id': 'test_action',
        'type': 'open_page',
        'name': 'Test',
        'layout_form_id': 'form_1',
        'popup': true,
        'full_background': true,
      };

      final actionDefault = ActionD.fromJson(jsonFalse);
      final actionFull = ActionD.fromJson(jsonTrue);

      expect(actionDefault.fullBackground, isFalse);
      expect(actionFull.fullBackground, isTrue);
      expect(actionFull.toJson()['full_background'], isTrue);
    });

    test('LayoutForm parses full_background correctly', () {
      final mapFalse = {
        'id': 'form_1',
        'label': 'Form 1',
        'popup': true,
      };

      final mapTrue = {
        'id': 'form_1',
        'label': 'Form 1',
        'popup': true,
        'full_background': true,
      };

      final formDefault = LayoutForm.fromMap(mapFalse);
      final formFull = LayoutForm.fromMap(mapTrue);

      expect(formDefault.fullBackground, isFalse);
      expect(formFull.fullBackground, isTrue);
      expect(formFull.toMap()['full_background'], isTrue);
    });
  });
}
