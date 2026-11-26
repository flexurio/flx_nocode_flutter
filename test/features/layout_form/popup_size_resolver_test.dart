import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/popup_size_resolver.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flutter_test/flutter_test.dart';

LayoutForm _makeForm({
  Object? width,
  List<Map<String, dynamic>> components = const [],
  List<Map<String, dynamic>> multiForms = const [],
}) {
  return LayoutForm.fromMap({
    'id': 'test_popup',
    'label': 'Test Popup',
    'popup': true,
    if (width != null) 'width': width,
    'components': components,
    if (multiForms.isNotEmpty) 'multi_forms': multiForms,
  });
}

List<Map<String, dynamic>> _fieldArrayColumns(int count) {
  return List.generate(
    count,
    (i) => {
      'header': 'Col ${i + 1}',
      'body': 'col_${i + 1}',
      'component': {'type': 'text_field'},
    },
  );
}

void main() {
  group('PopupSizeResolver', () {
    test('infers sm (440) for simple 1-column form with <= 4 fields', () {
      final form = _makeForm(
        components: [
          {'id': 'a', 'type': 'text_field', 'label': 'A'},
          {'id': 'b', 'type': 'text_field', 'label': 'B'},
        ],
      );

      expect(
        PopupSizeResolver.resolve(layoutForm: form, viewportWidth: 1440),
        PopupSizeResolver.sm,
      );
    });

    test('infers md (560) for > 4 fields or 2-child row', () {
      final manyFields = _makeForm(
        components: List.generate(
          5,
          (i) => {'id': 'f$i', 'type': 'text_field', 'label': 'F$i'},
        ),
      );
      final twoColRow = _makeForm(
        components: [
          {
            'id': 'row_1',
            'type': 'row',
            'children': [
              {'id': 'a', 'type': 'text_field', 'label': 'A'},
              {'id': 'b', 'type': 'text_field', 'label': 'B'},
            ],
          },
        ],
      );

      expect(
        PopupSizeResolver.resolve(layoutForm: manyFields, viewportWidth: 1440),
        PopupSizeResolver.md,
      );
      expect(
        PopupSizeResolver.resolve(layoutForm: twoColRow, viewportWidth: 1440),
        PopupSizeResolver.md,
      );
    });

    test('infers lg/xl/xxl based on field_array column count', () {
      final form3Cols = _makeForm(
        components: [
          {
            'id': 'items',
            'type': 'field_array',
            'columns': _fieldArrayColumns(3),
          },
        ],
      );
      final form5Cols = _makeForm(
        components: [
          {
            'id': 'items',
            'type': 'field_array',
            'columns': _fieldArrayColumns(5),
          },
        ],
      );
      final form6Cols = _makeForm(
        components: [
          {
            'id': 'items',
            'type': 'field_array',
            'columns': _fieldArrayColumns(6),
          },
        ],
      );

      expect(
        PopupSizeResolver.resolve(layoutForm: form3Cols, viewportWidth: 1440),
        PopupSizeResolver.lg,
      );
      expect(
        PopupSizeResolver.resolve(layoutForm: form5Cols, viewportWidth: 1440),
        PopupSizeResolver.xl,
      );
      expect(
        PopupSizeResolver.resolve(layoutForm: form6Cols, viewportWidth: 1440),
        PopupSizeResolver.xxl,
      );
    });

    test('infers at least lg for multi_forms wizard', () {
      final wizard = _makeForm(
        multiForms: [
          {
            'id': 'step_1',
            'label': 'Step 1',
            'components': [
              {'id': 'a', 'type': 'text_field', 'label': 'A'},
            ],
          },
        ],
      );

      expect(
        PopupSizeResolver.resolve(layoutForm: wizard, viewportWidth: 1440),
        PopupSizeResolver.lg,
      );
    });

    test('resolves semantic tokens, percentage, and numeric width', () {
      final form = _makeForm();

      expect(
        PopupSizeResolver.resolve(
          layoutForm: form,
          viewportWidth: 1440,
          actionWidth: 'xl',
        ),
        PopupSizeResolver.xl,
      );
      expect(
        PopupSizeResolver.resolve(
          layoutForm: form,
          viewportWidth: 1000,
          actionWidth: '80%',
        ),
        800.0,
      );
      expect(
        PopupSizeResolver.resolve(
          layoutForm: form,
          viewportWidth: 1440,
          actionWidth: 680,
        ),
        680.0,
      );
      expect(
        PopupSizeResolver.resolve(
          layoutForm: form,
          viewportWidth: 1000,
          actionWidth: 'full',
        ),
        920.0,
      );
    });

    test('respects priority: actionWidth > formWidth > auto inference', () {
      final formWithWidth = _makeForm(width: 'lg');

      expect(
        PopupSizeResolver.resolve(
          layoutForm: formWithWidth,
          viewportWidth: 1440,
        ),
        PopupSizeResolver.lg,
      );
      expect(
        PopupSizeResolver.resolve(
          layoutForm: formWithWidth,
          viewportWidth: 1440,
          actionWidth: 500,
        ),
        500.0,
      );
      expect(
        PopupSizeResolver.resolve(
          layoutForm: formWithWidth,
          viewportWidth: 1440,
          actionWidth: 'auto',
        ),
        PopupSizeResolver.lg,
      );
    });

    test('clamps to viewport on mobile and narrow desktop screens', () {
      final form = _makeForm(width: 'xxl');

      expect(
        PopupSizeResolver.resolve(layoutForm: form, viewportWidth: 390),
        358.0,
      );
      expect(
        PopupSizeResolver.resolve(layoutForm: form, viewportWidth: 1000),
        920.0,
      );
    });
  });

  group('ActionD & LayoutForm width parsing', () {
    test('ActionD parses numeric and string width presets', () {
      final numericAction = ActionD.fromJson({
        'id': 'a1',
        'name': 'Open',
        'type': 'show_dialog',
        'layout_form_id': 'f1',
        'width': 640,
      });
      final presetAction = ActionD.fromJson({
        'id': 'a2',
        'name': 'Open XL',
        'type': 'show_dialog',
        'layout_form_id': 'f1',
        'width': 'xl',
      });

      expect(numericAction.width, 640.0);
      expect(numericAction.widthPreset, isNull);
      expect(numericAction.effectiveWidth, 640.0);

      expect(presetAction.width, isNull);
      expect(presetAction.widthPreset, 'xl');
      expect(presetAction.effectiveWidth, 'xl');
      expect(presetAction.toJson()['width'], 'xl');
    });

    test('LayoutForm round-trips width in toMap and copyWith', () {
      final form = _makeForm(width: 'lg');
      expect(form.width, 'lg');
      expect(form.toMap()['width'], 'lg');
      expect(form.copyWith(width: 720).width, 720);
    });
  });
}
