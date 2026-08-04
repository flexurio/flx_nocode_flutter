import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';

void main() {
  group('ComponentTextField - Symbol Configuration Tests', () {
    test('parses isSymbol: true correctly from camelCase JSON', () {
      const jsonString = '''
      {
        "id": "current_situation_overview",
        "type": "text_field",
        "label": "Gambaran Umum Situasi Saat Ini",
        "maxLength": 1000,
        "maxLines": 5,
        "isSymbol": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'current_situation_overview');
      expect(component.label, 'Gambaran Umum Situasi Saat Ini');
      expect(component.isSymbol, isTrue);
    });

    test('parses is_symbol: true correctly from snake_case JSON', () {
      const jsonString = '''
      {
        "id": "proposed_changes_overview",
        "type": "text_field",
        "label": "Gambaran Umum Perubahan Yang Diusulkan",
        "is_symbol": true
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'proposed_changes_overview');
      expect(component.isSymbol, isTrue);
    });

    test('defaults isSymbol to false when omitted from JSON', () {
      const jsonString = '''
      {
        "id": "plain_text_field",
        "type": "text_field",
        "label": "Plain Field"
      }
      ''';

      final decoded = jsonDecode(jsonString) as Map<String, dynamic>;
      final component = ComponentTextField.fromMap(decoded);

      expect(component.id, 'plain_text_field');
      expect(component.isSymbol, isFalse);
    });

    test('serializes isSymbol toMap correctly', () {
      final componentWithSymbol = ComponentTextField(
        id: 'reason_for_change',
        label: 'Alasan Perubahan',
        isSymbol: true,
      );

      final mapWithSymbol = componentWithSymbol.toMap();
      expect(mapWithSymbol['isSymbol'], isTrue);

      final componentNoSymbol = ComponentTextField(
        id: 'plain_field',
        label: 'Plain Field',
        isSymbol: false,
      );

      final mapNoSymbol = componentNoSymbol.toMap();
      expect(mapNoSymbol.containsKey('isSymbol'), isFalse);
    });

    test('ComponentTextField.empty creates instance with isSymbol = false', () {
      final emptyComponent = ComponentTextField.empty('test_id');

      expect(emptyComponent.id, 'test_id');
      expect(emptyComponent.isSymbol, isFalse);
    });
  });

  group('Symbol Insertion Logic Tests', () {
    test('inserts symbol at empty text controller', () {
      final controller = TextEditingController(text: '');
      const symbolToInsert = 'Ω';

      final text = controller.text;
      final selection = controller.selection;
      int start = selection.start;
      int end = selection.end;
      if (start < 0 || start > text.length) {
        start = text.length;
        end = text.length;
      }

      final newText = text.replaceRange(start, end, symbolToInsert);
      controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: start + symbolToInsert.length),
      );

      expect(controller.text, 'Ω');
      expect(controller.selection.baseOffset, 1);
    });

    test('inserts symbol at specific cursor position', () {
      final controller = TextEditingController(text: 'Hello World');
      controller.selection = const TextSelection.collapsed(offset: 5);
      const symbolToInsert = '±';

      final text = controller.text;
      final selection = controller.selection;
      int start = selection.start;
      int end = selection.end;

      final newText = text.replaceRange(start, end, symbolToInsert);
      controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: start + symbolToInsert.length),
      );

      expect(controller.text, 'Hello± World');
      expect(controller.selection.baseOffset, 6);
    });

    test('replaces selected text range with symbol', () {
      final controller = TextEditingController(text: 'Temperature 100C');
      // Select "100" (index 12 to 15)
      controller.selection = const TextSelection(baseOffset: 12, extentOffset: 15);
      const symbolToInsert = '℃';

      final text = controller.text;
      final selection = controller.selection;
      int start = selection.start;
      int end = selection.end;

      final newText = text.replaceRange(start, end, symbolToInsert);
      controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: start + symbolToInsert.length),
      );

      expect(controller.text, 'Temperature ℃C');
      expect(controller.selection.baseOffset, 13);
    });
  });
}
