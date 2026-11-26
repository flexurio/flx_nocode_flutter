import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/inline_filter.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

/// Host widget used for Widgetbook registration of `value_labels` / `chip_labels`.
class FieldValueLabelsShowcase extends StatefulWidget {
  const FieldValueLabelsShowcase({
    super.key,
    required this.entityJson,
    required this.sampleRows,
  });

  final String entityJson;
  final List<Map<String, dynamic>> sampleRows;

  @override
  State<FieldValueLabelsShowcase> createState() =>
      _FieldValueLabelsShowcaseState();
}

class _FieldValueLabelsShowcaseState extends State<FieldValueLabelsShowcase> {
  String? _selectedStatusFilter;
  int _selectedRowIndex = 0;

  @override
  Widget build(BuildContext context) {
    EntityCustom entity;
    try {
      final decoded = jsonDecode(widget.entityJson) as Map<String, dynamic>;
      entity = EntityCustom.fromJson(decoded);
    } catch (e) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'JSON Parse Error:\n$e',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final filteredRows = _selectedStatusFilter == null ||
            _selectedStatusFilter!.isEmpty
        ? widget.sampleRows
        : widget.sampleRows
            .where((r) => r['status']?.toString() == _selectedStatusFilter)
            .toList();

    final selectedRow = filteredRows.isNotEmpty
        ? filteredRows[_selectedRowIndex.clamp(0, filteredRows.length - 1)]
        : widget.sampleRows.first;

    final statusField = entity.fields.firstWhere(
      (f) => f.reference == 'status',
      orElse: () => entity.fields.first,
    );

    final exportFieldNames = entity.fields.map((f) => f.reference).toList();
    final formattedExportRows = FieldValueLabelResolver.formatRowsForExport(
      filteredRows,
      exportFieldNames,
      entity.fields,
    );
    final enrichedPrint = FieldValueLabelResolver.enrichPrintContext(
      selectedRow,
      entity.fields,
    );

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.grey.shade300;

    Widget buildSection({required String title, required Widget child}) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            child,
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${entity.label} — Value Labels (Single Source of Truth)',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),

          // 1. Inline Filter
          buildSection(
            title: '1. Filter Dropdown (tampilkan label, kirim kode API)',
            child: Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                InlineFilter(
                  field: statusField,
                  config: const {'reference': 'status', 'width': 260},
                  parentData: const [],
                  initialValue: _selectedStatusFilter,
                  onChanged: (code) {
                    setState(() {
                      _selectedStatusFilter = code;
                      _selectedRowIndex = 0;
                    });
                  },
                ),
                Chip(
                  backgroundColor: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.grey.shade100,
                  side: BorderSide(color: borderColor),
                  label: Text(
                    'Query API: status.eq=${_selectedStatusFilter ?? "(semua)"}',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 2. Table Preview
          buildSection(
            title:
                '2. Tabel (EntityFieldDisplay — chip, non-chip, & options_source)',
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final f in entity.fields)
                    DataColumn(label: Text(f.label)),
                ],
                rows: [
                  for (int i = 0; i < filteredRows.length; i++)
                    DataRow(
                      selected: i == _selectedRowIndex,
                      onSelectChanged: (_) =>
                          setState(() => _selectedRowIndex = i),
                      cells: [
                        for (final f in entity.fields)
                          DataCell(
                            EntityFieldDisplay.build(
                              entity,
                              f.reference,
                              filteredRows[i][f.reference],
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 3. Detail View (ComponentFieldDisplay)
          buildSection(
            title: '3. Detail View (field_display mewarisi via field_ref)',
            child: entity.layoutForm.view?.toWidget(
                  selectedRow,
                  entityFields: entity.fields,
                ) ??
                const Text('No layout_form.view configured'),
          ),
          const SizedBox(height: 12),

          // 4. Export & Print Preview
          buildSection(
            title: '4. Export & layout_print Payload Preview',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'layout_print: {{status}} = "${enrichedPrint['status']}" '
                  '| {{status_label}} = "${enrichedPrint['status_label']}"',
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.25)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Export XLSX/PDF rows:\n'
                    '${const JsonEncoder.withIndent('  ').convert(formattedExportRows)}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _defaultValueLabelsEntityJson = '''
{
  "id": "plant_cpob_deviations",
  "label": "Deviasi CPOB",
  "description": "Demo value_labels lintas tabel, detail, filter, export, dan print",
  "backend": { "others": [] },
  "layout_table": {},
  "fields": [
    {
      "reference": "deviation_no",
      "label": "No. Deviasi",
      "type": "text"
    },
    {
      "reference": "status",
      "label": "Status",
      "type": "text",
      "is_chip": true,
      "value_labels": {
        "DRAFT": "Draf",
        "EVALUATION_APPROVAL": "Evaluasi & Persetujuan",
        "CLOSED": "Ditutup"
      },
      "chip_colors": {
        "DRAFT": "#9E9E9E",
        "EVALUATION_APPROVAL": "#F57C00",
        "CLOSED": "#2E7D32"
      }
    },
    {
      "reference": "severity",
      "label": "Keparahan",
      "type": "text",
      "value_labels": {
        "CRITICAL": "Kritis",
        "MAJOR": "Mayor",
        "MINOR": "Minor"
      }
    },
    {
      "reference": "department",
      "label": "Departemen",
      "type": "select",
      "options_source": "values('PROD':'Produksi','QA':'Penjaminan Mutu','QC':'Pengawasan Mutu')"
    }
  ],
  "layout_form": [
    {
      "id": "view",
      "label": "Detail Deviasi",
      "type": "view",
      "components": [
        {
          "id": "v_no",
          "type": "field_display",
          "label": "No. Deviasi",
          "value": "{{current.deviation_no}}"
        },
        {
          "id": "v_status",
          "type": "field_display",
          "label": "Status (field_ref)",
          "value": "{{current.status}}",
          "field_ref": "status",
          "is_chip": true
        },
        {
          "id": "v_severity",
          "type": "field_display",
          "label": "Keparahan",
          "value": "{{current.severity}}",
          "field_ref": "severity"
        },
        {
          "id": "v_dept",
          "type": "field_display",
          "label": "Departemen (options_source)",
          "value": "{{current.department}}",
          "field_ref": "department"
        }
      ]
    }
  ]
}
''';

const List<Map<String, dynamic>> _sampleDeviationRows = [
  {
    'deviation_no': 'DEV-2026-001',
    'status': 'DRAFT',
    'severity': 'MINOR',
    'department': 'PROD',
  },
  {
    'deviation_no': 'DEV-2026-002',
    'status': 'EVALUATION_APPROVAL',
    'severity': 'MAJOR',
    'department': 'QA',
  },
  {
    'deviation_no': 'DEV-2026-003',
    'status': 'CLOSED',
    'severity': 'CRITICAL',
    'department': 'QC',
  },
];

@UseCase(
  name: 'From JSON Config',
  type: FieldValueLabelsShowcase,
  path: '[Data & Fields]',
)
Widget buildFieldValueLabelsFromJsonUseCase(BuildContext context) {
  final rawJson = context.knobs.string(
    label: 'Entity JSON Config',
    initialValue: _defaultValueLabelsEntityJson,
  );

  return FieldValueLabelsShowcase(
    entityJson: rawJson,
    sampleRows: _sampleDeviationRows,
  );
}
