import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/inline_filter.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';
import 'package:flx_nocode_flutter/features/print/domain/json_pdf_generator.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/util/general_xlsx.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_drop_down.dart';

void main() {
  group('FieldValueLabelResolver — unit tests', () {
    test('resolves exact match, case-insensitive match, and unknown fallback', () {
      const labels = {
        'DRAFT': 'Draf',
        'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
        'CLOSED': 'Ditutup',
      };

      expect(
        FieldValueLabelResolver.resolveLabel('DRAFT', valueLabels: labels),
        'Draf',
      );
      expect(
        FieldValueLabelResolver.resolveLabel(
          'evaluation_approval',
          valueLabels: labels,
        ),
        'Evaluasi & Persetujuan',
      );
      expect(
        FieldValueLabelResolver.resolveLabel('UNKNOWN_CODE', valueLabels: labels),
        'UNKNOWN_CODE',
      );
      expect(
        FieldValueLabelResolver.resolveLabel(null, valueLabels: labels),
        '',
      );
    });

    test('extracts and respects static options_source values(...) for read display', () {
      const optionsSource =
          "values('DRAFT':'Draf','EVALUATION_APPROVAL':'Evaluasi & Persetujuan','CLOSED':'Ditutup')";

      expect(
        FieldValueLabelResolver.extractStaticOptions(optionsSource),
        {
          'DRAFT': 'Draf',
          'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
          'CLOSED': 'Ditutup',
        },
      );
      expect(
        FieldValueLabelResolver.resolveLabel(
          'EVALUATION_APPROVAL',
          optionsSource: optionsSource,
        ),
        'Evaluasi & Persetujuan',
      );
      // backend.* options_source should not produce static labels
      expect(
        FieldValueLabelResolver.extractStaticOptions(
          'backend.statuses({code}:{name})',
        ),
        isEmpty,
      );
    });

    test('value_labels overrides static options_source when both exist', () {
      const optionsSource = "values('DRAFT':'Draft EN','CLOSED':'Closed EN')";
      const valueLabels = {'DRAFT': 'Draf ID'};

      expect(
        FieldValueLabelResolver.resolveLabel(
          'DRAFT',
          valueLabels: valueLabels,
          optionsSource: optionsSource,
        ),
        'Draf ID',
      );
      expect(
        FieldValueLabelResolver.resolveLabel(
          'CLOSED',
          valueLabels: valueLabels,
          optionsSource: optionsSource,
        ),
        'Closed EN',
      );
    });

    test('resolveChipColor matches raw code with exact-match priority over substring', () {
      const colors = {
        'APPROVAL': '#2E7D32',
        'EVALUATION_APPROVAL': '#F57C00',
        'DRAFT': '#9E9E9E',
      };

      // Exact match wins even though APPROVAL appears before EVALUATION_APPROVAL
      expect(
        FieldValueLabelResolver.resolveChipColor('EVALUATION_APPROVAL', colors),
        const Color(0xFFF57C00),
      );
      expect(
        FieldValueLabelResolver.resolveChipColor('APPROVAL', colors),
        const Color(0xFF2E7D32),
      );
      // Substring fallback still works for legacy configs
      expect(
        FieldValueLabelResolver.resolveChipColor('FINAL_APPROVAL', colors),
        const Color(0xFF2E7D32),
      );
    });

    test('extractSimpleFieldReference parses common template syntaxes', () {
      expect(
        FieldValueLabelResolver.extractSimpleFieldReference(r'${current.status}'),
        'status',
      );
      expect(
        FieldValueLabelResolver.extractSimpleFieldReference('{{status}}'),
        'status',
      );
      expect(
        FieldValueLabelResolver.extractSimpleFieldReference('{{current.status}}'),
        'status',
      );
      expect(
        FieldValueLabelResolver.extractSimpleFieldReference('Status: {{status}}'),
        isNull,
      );
    });
  });

  group('Model JSON parsing', () {
    test('EntityField parses value_labels and backward-compatible chip_labels alias', () {
      final fromValueLabels = EntityField.fromJson({
        'reference': 'status',
        'label': 'Status',
        'type': 'text',
        'is_chip': true,
        'value_labels': {'DRAFT': 'Draf', 'CLOSED': 'Ditutup'},
        'chip_colors': {'DRAFT': '#9E9E9E', 'CLOSED': '#2E7D32'},
      });

      expect(fromValueLabels.valueLabels, {'DRAFT': 'Draf', 'CLOSED': 'Ditutup'});
      expect(fromValueLabels.resolveDisplayLabel('DRAFT'), 'Draf');
      expect(fromValueLabels.toJson()['value_labels'], {
        'DRAFT': 'Draf',
        'CLOSED': 'Ditutup',
      });

      final fromChipLabelsAlias = EntityField.fromJson({
        'reference': 'status',
        'label': 'Status',
        'type': 'text',
        'is_chip': true,
        'chip_labels': {
          'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
        },
      });

      expect(
        fromChipLabelsAlias.resolveDisplayLabel('EVALUATION_APPROVAL'),
        'Evaluasi & Persetujuan',
      );
    });

    test('ComponentFieldDisplay parses field_ref, value_labels, and chip_labels alias', () {
      final comp = ComponentFieldDisplay.fromMap({
        'id': 'status_view',
        'type': 'field_display',
        'label': 'Status',
        'value': r'${current.status}',
        'field_ref': 'status',
        'is_chip': true,
        'chip_labels': {'DRAFT': 'Draf Lokal'},
      });

      expect(comp.fieldRef, 'status');
      expect(comp.valueLabels, {'DRAFT': 'Draf Lokal'});
      expect(comp.toMap()['field_ref'], 'status');
      expect(comp.toMap()['value_labels'], {'DRAFT': 'Draf Lokal'});
    });
  });

  group('Export XLSX & PDF row formatting', () {
    final fields = [
      EntityField.fromJson({
        'reference': 'deviation_no',
        'label': 'No. Deviasi',
        'type': 'text',
      }),
      EntityField.fromJson({
        'reference': 'status',
        'label': 'Status',
        'type': 'text',
        'is_chip': true,
        'value_labels': {
          'DRAFT': 'Draf',
          'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
          'CLOSED': 'Ditutup',
        },
      }),
      EntityField.fromJson({
        'reference': 'severity',
        'label': 'Tingkat Keparahan',
        'type': 'select',
        'options_source': "values('MAJOR':'Mayor','MINOR':'Minor')",
      }),
    ];

    test('generalXlsxNoCode writes resolved display labels to spreadsheet cells', () {
      final rows = [
        {
          'deviation_no': 'DEV-001',
          'status': 'EVALUATION_APPROVAL',
          'severity': 'MAJOR',
        },
        {
          'deviation_no': 'DEV-002',
          'status': 'CLOSED',
          'severity': 'MINOR',
        },
      ];

      final bytes = generalXlsxNoCode(
        null,
        rows,
        ['deviation_no', 'status', 'severity'],
        entityFields: fields,
      );

      final excel = Excel.decodeBytes(Uint8List.fromList(bytes));
      final sheet = excel['Sheet1'];
      expect(sheet.rows.length, 3); // header + 2 data rows
      expect(sheet.rows[1][0]?.value.toString(), 'DEV-001');
      expect(sheet.rows[1][1]?.value.toString(), 'Evaluasi & Persetujuan');
      expect(sheet.rows[1][2]?.value.toString(), 'Mayor');
      expect(sheet.rows[2][1]?.value.toString(), 'Ditutup');
      expect(sheet.rows[2][2]?.value.toString(), 'Minor');
    });

    test('formatRowsForExport formats without mutating original rows', () {
      final original = [
        {'deviation_no': 'DEV-001', 'status': 'DRAFT'},
      ];

      final formatted = FieldValueLabelResolver.formatRowsForExport(
        original,
        ['deviation_no', 'status'],
        fields,
      );

      expect(formatted[0]['status'], 'Draf');
      expect(original[0]['status'], 'DRAFT'); // original untouched
    });
  });

  group('Print (layout_print) non-destructive enrichment', () {
    final fields = [
      EntityField.fromJson({
        'reference': 'status',
        'label': 'Status',
        'type': 'text',
        'value_labels': {
          'DRAFT': 'Draf',
          'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
          'CLOSED': 'Ditutup',
        },
      }),
    ];

    test('enrichPrintContext preserves raw code and adds <ref>_label recursively', () {
      final input = {
        'code': 'DEV-001',
        'status': 'EVALUATION_APPROVAL',
        'data': [
          {'code': 'DEV-001', 'status': 'DRAFT'},
          {'code': 'DEV-002', 'status': 'CLOSED'},
        ],
      };

      final enriched = FieldValueLabelResolver.enrichPrintContext(input, fields);

      // Raw code preserved for conditions / queries
      expect(enriched['status'], 'EVALUATION_APPROVAL');
      // Human label injected
      expect(enriched['status_label'], 'Evaluasi & Persetujuan');
      // Nested table rows enriched
      final rows = enriched['data'] as List;
      expect(rows[0]['status'], 'DRAFT');
      expect(rows[0]['status_label'], 'Draf');
      expect(rows[1]['status_label'], 'Ditutup');
    });

    test('JsonPdfGenerator.generate succeeds with entityFields and {{status_label}}', () async {
      final printJson = <String, dynamic>{
        'layout_type': 'document',
        'page_size': 'A4',
        'unit': 'mm',
        'margin': 15,
        'content': [
          {'type': 'text', 'value': 'Status: {{status_label}} ({{status}})'},
        ],
      };

      final pdfBytes = await JsonPdfGenerator.generate(
        printJson,
        data: {'status': 'EVALUATION_APPROVAL'},
        entityFields: fields,
      );

      expect(pdfBytes, isNotEmpty);
      // PDF magic header %PDF
      expect(String.fromCharCodes(pdfBytes.take(4)), '%PDF');
    });
  });

  group('Widget tests — Table, Detail, and Filter', () {
    EntityCustom buildEntity() {
      return EntityCustom.fromJson({
        'id': 'deviations',
        'label': 'Deviasi CPOB',
        'description': 'Laporan Deviasi CPOB',
        'backend': {'others': []},
        'layout_table': {},
        'fields': [
          {
            'reference': 'status',
            'label': 'Status',
            'type': 'text',
            'is_chip': true,
            'value_labels': {
              'DRAFT': 'Draf',
              'EVALUATION_APPROVAL': 'Evaluasi & Persetujuan',
              'CLOSED': 'Ditutup',
            },
            'chip_colors': {
              'DRAFT': '#9E9E9E',
              'EVALUATION_APPROVAL': '#F57C00',
              'CLOSED': '#2E7D32',
            },
          },
          {
            'reference': 'severity',
            'label': 'Keparahan',
            'type': 'text',
            'value_labels': {
              'MAJOR': 'Mayor',
              'MINOR': 'Minor',
            },
          },
          {
            'reference': 'category',
            'label': 'Kategori',
            'type': 'select',
            'options_source': "values('PROD':'Produksi','QA':'Penjaminan Mutu')",
          },
        ],
      });
    }

    testWidgets('EntityFieldDisplay renders translated label and resolves chip color from raw code', (tester) async {
      final entity = buildEntity();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                EntityFieldDisplay.build(entity, 'status', 'EVALUATION_APPROVAL'),
                EntityFieldDisplay.build(entity, 'severity', 'MAJOR'),
                EntityFieldDisplay.build(entity, 'category', 'QA'),
              ],
            ),
          ),
        ),
      );

      // Chip text shows Indonesian label, NOT raw code
      expect(find.text('Evaluasi & Persetujuan'), findsOneWidget);
      expect(find.text('EVALUATION_APPROVAL'), findsNothing);

      // Chip text color matches #F57C00 resolved from raw code EVALUATION_APPROVAL
      final statusText = tester.widget<Text>(find.text('Evaluasi & Persetujuan'));
      expect(statusText.style?.color, const Color(0xFFF57C00));

      // Non-chip field with value_labels
      expect(find.text('Mayor'), findsOneWidget);

      // Field with static options_source respected in read-only table cell
      expect(find.text('Penjaminan Mutu'), findsOneWidget);
    });

    testWidgets('ComponentFieldDisplay inherits value_labels & chip_colors via field_ref and auto-inference', (tester) async {
      final entity = buildEntity();
      final layout = LayoutForm.fromMap({
        'id': 'detail_view',
        'label': 'Detail',
        'components': [
          {
            'id': 'status_explicit_ref',
            'type': 'field_display',
            'label': 'Status (field_ref)',
            'value': '{{current.status}}',
            'field_ref': 'status',
            'is_chip': true,
          },
          {
            'id': 'status_auto_inferred',
            'type': 'field_display',
            'label': 'Status (auto)',
            'value': '{{current.status}}',
            'is_chip': true,
          },
          {
            'id': 'status_override',
            'type': 'field_display',
            'label': 'Status (override)',
            'value': '{{current.status}}',
            'field_ref': 'status',
            'is_chip': true,
            'value_labels': {'CLOSED': 'Selesai Total'},
          },
        ],
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: layout.toWidget(
                {'status': 'CLOSED'},
                entityFields: entity.fields,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ditutup'), findsNWidgets(2));
      expect(find.text('Selesai Total'), findsOneWidget);
      expect(find.text('CLOSED'), findsNothing);

      // Color inherited from entity.fields chip_colors['CLOSED'] (#2E7D32)
      final chipText = tester.widget<Text>(find.text('Ditutup').first);
      expect(chipText.style?.color, const Color(0xFF2E7D32));
    });

    testWidgets('InlineFilter renders dropdown for field with value_labels and emits raw code', (tester) async {
      final entity = buildEntity();
      final statusField = entity.fields.first;
      String? emittedCode;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineFilter(
              field: statusField,
              config: const {'reference': 'status'},
              parentData: const [],
              onChanged: (val) => emittedCode = val,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should render dropdown (not plain TextField) even though field.type == 'text'
      expect(find.byType(FDropDownSearchEntity), findsOneWidget);

      // Open dropdown and verify Indonesian labels are shown
      await tester.tap(find.byType(FDropDownSearchEntity));
      await tester.pumpAndSettle();

      expect(find.text('Evaluasi & Persetujuan'), findsOneWidget);
      expect(find.text('Draf'), findsOneWidget);

      // Select label -> emits raw status code
      await tester.tap(find.text('Evaluasi & Persetujuan').last);
      await tester.pumpAndSettle();

      expect(emittedCode, 'EVALUATION_APPROVAL');
    });
  });
}
