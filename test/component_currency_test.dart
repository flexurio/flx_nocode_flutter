import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_number_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';

void main() {
  group('ComponentTextField - Currency & Separator Configuration Tests', () {
    test('parses isCurrency: true correctly from camelCase JSON', () {
      const jsonString = '''
      {
        "id": "submission_total",
        "type": "text_field",
        "label": "Submission Total",
        "isCurrency": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'submission_total');
      expect(component.isCurrency, isTrue);
    });

    test('parses is_currency: true correctly from snake_case JSON', () {
      const jsonString = '''
      {
        "id": "submission_total",
        "type": "text_field",
        "label": "Submission Total",
        "is_currency": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'submission_total');
      expect(component.isCurrency, isTrue);
    });

    test('parses separator: true correctly from JSON', () {
      const jsonString = '''
      {
        "id": "submission_total",
        "type": "text_field",
        "label": "Submission Total",
        "separator": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'submission_total');
      expect(component.isCurrency, isTrue);
    });

    test('serializes isCurrency toMap correctly', () {
      final componentWithCurrency = ComponentTextField(
        id: 'submission_total',
        label: 'Submission Total',
        isCurrency: true,
      );

      final map = componentWithCurrency.toMap();
      expect(map['isCurrency'], isTrue);

      final componentNoCurrency = ComponentTextField(
        id: 'plain_field',
        label: 'Plain Field',
        isCurrency: false,
      );

      final mapNoCurrency = componentNoCurrency.toMap();
      expect(mapNoCurrency.containsKey('isCurrency'), isFalse);
    });
  });

  group('ComponentNumberField - Currency & Separator Configuration Tests', () {
    test('parses is_currency: true correctly from JSON', () {
      const jsonString = '''
      {
        "id": "submission_total",
        "type": "number_field",
        "label": "Submission Total",
        "is_currency": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentNumberField.fromMap(decoded);

      expect(component.id, 'submission_total');
      expect(component.isCurrency, isTrue);
    });

    test('serializes isCurrency toMap correctly', () {
      final component = ComponentNumberField(
        id: 'submission_total',
        label: 'Submission Total',
        initialValue: '',
        isCurrency: true,
      );

      final map = component.toMap();
      expect(map['isCurrency'], isTrue);
    });
  });

  group('CreatePageControllerUtils - extractCurrentData Currency unformatting', () {
    test('extracts isCurrency field without thousand separators', () {
      final textComponent = ComponentTextField(
        id: 'submission_total',
        label: 'Submission Total',
        isCurrency: true,
      );

      final numberComponent = ComponentNumberField(
        id: 'budget_amount',
        label: 'Budget Amount',
        initialValue: '',
        isCurrency: true,
      );

      final regularComponent = ComponentTextField(
        id: 'remark',
        label: 'Remark',
      );

      final controllers = {
        'submission_total': TextEditingController(text: '10,000,000'),
        'budget_amount': TextEditingController(text: '250,000,000'),
        'remark': TextEditingController(text: 'Note, with comma.'),
      };

      final data = CreatePageControllerUtils.extractCurrentData(
        components: [textComponent, numberComponent, regularComponent],
        fields: [],
        controllers: controllers,
      );

      expect(data['submission_total'], '10000000');
      expect(data['budget_amount'], '250000000');
      expect(data['remark'], 'Note, with comma.');
    });
  });
}
