import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/components/pdf_table_component.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  group('PdfTableComponent Tests', () {
    test('build should render dynamic rows when data is provided', () {
      final tableJson = {
        'type': 'table',
        'data': [
          {'name': 'Alice'},
          {'name': 'Bob'},
        ],
        'header': [
          { 'content': { 'type': 'text', 'value': 'Name' } }
        ],
        'body': [
          { 'content': { 'type': 'text', 'value': '{{data.name}}' } }
        ]
      };

      // Mock buildRawChild to track what's being built
      final builtTexts = <String>[];
      
      pw.Widget mockBuildRawChild(Map<String, dynamic> comp, String unit, Map<String, pw.ImageProvider> cache) {
        if (comp['type'] == 'text') {
          builtTexts.add(comp['value']?.toString() ?? '');
        }
        return pw.Text(comp['value']?.toString() ?? '');
      }

      final widget = PdfTableComponent.build(
        tableJson,
        'pt',
        {},
        mockBuildRawChild,
      );

      expect(widget, isA<pw.Table>());
      
      // Header row + 2 Data rows = 3 rows total in builtTexts
      // Wait, header is also built using mockBuildRawChild
      expect(builtTexts, contains('Name'));
      expect(builtTexts, contains('Alice'));
      expect(builtTexts, contains('Bob'));
      expect(builtTexts.length, 3);
    });

    test('build should render static rows when data is empty', () {
      final tableJson = {
        'type': 'table',
        'data': [],
        'body': [
          [
            { 'content': { 'type': 'text', 'value': 'Static Row' } }
          ]
        ]
      };

      final builtTexts = <String>[];
      pw.Widget mockBuildRawChild(Map<String, dynamic> comp, String unit, Map<String, pw.ImageProvider> cache) {
        if (comp['type'] == 'text') {
          builtTexts.add(comp['value']?.toString() ?? '');
        }
        return pw.Text(comp['value']?.toString() ?? '');
      }

      PdfTableComponent.build(
        tableJson,
        'pt',
        {},
        mockBuildRawChild,
      );

      expect(builtTexts, contains('Static Row'));
      expect(builtTexts.length, 1);
    });
  });
}
