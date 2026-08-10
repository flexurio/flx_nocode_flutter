import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';

void main() {
  group('CreatePageControllerUtils Tests', () {
    test('prepareInitialData preserves initial row values and interpolates JS expressions', () {
      final components = [
        ComponentTextField(
          id: 'name_project',
          label: 'Name Project',
          initialValue: '{{data.name_project}}',
        ),
        ComponentDatePicker(
          id: 'period_start',
          label: 'Period Start',
          initialValue: '{{data.period_start}}',
          dateFormat: 'yyyyMMdd',
        ),
        ComponentCheckbox(
          id: 'user_active',
          label: 'Customer Active',
          value: true,
          initialValue: '{{data.user_active}}',
        ),
        ComponentTextField(
          id: 'custom_field',
          label: 'Custom Field',
          initialValue: 'default_val',
        ),
      ];

      final initialInput = {
        'id': 101,
        'name_project': 'Persandi Bali 2025',
        'period_start': '20250401',
        'user_active': 1,
      };

      final result = CreatePageControllerUtils.prepareInitialData(
        initialDataInput: initialInput,
        components: components,
        parentData: const [],
      );

      expect(result['id'], 101);
      expect(result['name_project'], 'Persandi Bali 2025');
      expect(result['period_start'], '20250401');
      expect(result['user_active'], '1');
      expect(result['custom_field'], 'default_val');
    });

    group('formatDateTimeField', () {
      test('formats 8-digit YYYYMMDD date strings correctly', () {
        final formatted = CreatePageControllerUtils.formatDateTimeField(
          null,
          '20251231',
          customFormat: 'yyyyMMdd',
        );
        expect(formatted, '20251231');
      });

      test('converts standard ISO date to yyyyMMdd custom format', () {
        final formatted = CreatePageControllerUtils.formatDateTimeField(
          null,
          '2025-04-01 00:00:00',
          customFormat: 'yyyyMMdd',
        );
        expect(formatted, '20250401');
      });

      test('handles empty and invalid values gracefully', () {
        expect(CreatePageControllerUtils.formatDateTimeField(null, ''), '');
        expect(CreatePageControllerUtils.formatDateTimeField(null, 'invalid'), 'invalid');
      });
    });
  });
}
