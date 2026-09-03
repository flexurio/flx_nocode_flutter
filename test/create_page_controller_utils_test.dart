import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

    test('prepareInitialData interpolates values from parent and parentData', () {
      final components = [
        ComponentTextField(
          id: 'detail_id',
          label: 'Detail ID',
          initialValue: '{{parent.id}}',
        ),
        ComponentTextField(
          id: 'header_code',
          label: 'Header Code',
          initialValue: '{{parentData[0].header_code}}',
        ),
      ];

      final parentData = [
        {'header_code': 'HDR-2026', 'title': 'Root Header'},
        {'id': 160, 'name': 'Sub Detail'},
      ];

      final result = CreatePageControllerUtils.prepareInitialData(
        initialDataInput: const {},
        components: components,
        parentData: parentData,
      );

      expect(result['detail_id'], '160');
      expect(result['header_code'], 'HDR-2026');
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

    group('extractCurrentData', () {
      test('extracts current controller texts for components and pure fields', () {
        final components = [
          ComponentTextField(
            id: 'realization_value',
            label: 'Realization Value',
            isCurrency: true,
          ),
          ComponentTextField(
            id: 'realization_customer_id',
            label: 'Realization Customer ID',
          ),
        ];

        final fields = <EntityField>[
          EntityField(
            reference: 'realization_value',
            label: 'Realization Value',
            type: 'text',
          ),
          EntityField(
            reference: 'realization_customer_id',
            label: 'Realization Customer ID',
            type: 'text',
          ),
          EntityField(
            reference: 'transaction_detail_sub_id',
            label: 'Sub ID',
            type: 'text',
          ),
        ];

        final controllers = <String, TextEditingController>{
          'realization_value': TextEditingController(text: 'Rp 2.000.000'),
          'realization_customer_id': TextEditingController(text: '23060014'),
          'transaction_detail_sub_id': TextEditingController(text: '29'),
        };

        final data = CreatePageControllerUtils.extractCurrentData(
          components: components,
          fields: fields,
          controllers: controllers,
        );

        expect(data['realization_value'], '2000000');
        expect(data['realization_customer_id'], '23060014');
        expect(data['transaction_detail_sub_id'], '29');
      });
    });
  });
}
