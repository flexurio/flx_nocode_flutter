import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_array.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_array.dart';

@UseCase(name: 'Mock Design (Table)', type: ComponentFieldArray, path: '[Components]/Data')
Widget mockComponentFieldArrayDesign(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "sources",
    "type": "field_array",
    "label": "Sumber Deviasi",
    "presentation": "table",
    "constraints": {
      "min_rows": 1,
      "max_rows": 10
    },
    "row_actions": {
      "allow_add": true,
      "allow_delete": true,
      "add_label": "Tambah baris"
    },
    "columns": [
      {
        "header": "Jenis sumber",
        "body": "source_type",
        "width": 200,
        "component": {
          "type": "dropdown",
          "required": true,
          "options": ["Batch Record", "Inspeksi", "Keluhan"]
        }
      },
      {
        "header": "Nomor rekaman",
        "body": "source_record_no",
        "width": 220,
        "component": {
          "type": "text_field",
          "required": true
        }
      },
      {
        "header": "Tanggal diketahui",
        "body": "known_date",
        "width": 180,
        "component": {
          "type": "date_picker",
          "date_format": "yyyy-MM-dd"
        }
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentFieldArray.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: component.toMockWidget(),
  );
}

@UseCase(name: 'Editable Table + Validation (JSON)', type: ComponentFieldArray, path: '[Components]/Data')
Widget liveComponentFieldArrayTable(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "sources",
    "type": "field_array",
    "label": "Sumber Deviasi (Plant CPOB)",
    "presentation": "table",
    "constraints": {
      "min_rows": 1,
      "max_rows": 5,
      "unique_by": ["source_type", "source_record_no"]
    },
    "row_actions": {
      "allow_add": true,
      "allow_delete": true,
      "add_label": "Tambah baris",
      "empty_message": "Belum ada sumber deviasi. Klik Tambah baris."
    },
    "default_row": {
      "source_type": "",
      "source_record_no": "",
      "known_date": ""
    },
    "initial_value": [
      {
        "source_type": "Batch Record",
        "source_record_no": "BR-2026-001",
        "known_date": "2026-11-20"
      }
    ],
    "columns": [
      {
        "header": "Jenis sumber",
        "body": "source_type",
        "width": 210,
        "component": {
          "type": "dropdown",
          "required": true,
          "options": ["Batch Record", "Inspeksi", "Keluhan", "Audit Internal"]
        }
      },
      {
        "header": "Nomor rekaman",
        "body": "source_record_no",
        "width": 220,
        "component": {
          "type": "text_field",
          "required": true
        }
      },
      {
        "header": "Tanggal diketahui",
        "body": "known_date",
        "width": 190,
        "component": {
          "type": "date_picker",
          "date_format": "yyyy-MM-dd"
        }
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentFieldArray.fromMap(map);

  return _FieldArrayWidgetbookPlayground(component: component);
}

@UseCase(name: 'Card Presentation (JSON)', type: ComponentFieldArray, path: '[Components]/Data')
Widget liveComponentFieldArrayCards(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "items",
    "type": "field_array",
    "label": "Daftar Item Material",
    "presentation": "card",
    "constraints": {
      "min_rows": 1,
      "max_rows": 10
    },
    "row_actions": {
      "allow_add": true,
      "allow_delete": true,
      "add_label": "Tambah item"
    },
    "initial_value": [
      {
        "material_name": "Paracetamol 500mg",
        "qty": "100",
        "unit": "KG"
      }
    ],
    "fields": [
      {
        "header": "Nama Material",
        "body": "material_name",
        "component": {
          "type": "text_field",
          "required": true
        }
      },
      {
        "header": "Qty",
        "body": "qty",
        "component": {
          "type": "number_field",
          "required": true
        }
      },
      {
        "header": "Satuan",
        "body": "unit",
        "component": {
          "type": "dropdown",
          "required": true,
          "options": ["KG", "GRAM", "LITER", "PCS"]
        }
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentFieldArray.fromMap(map);

  return _FieldArrayWidgetbookPlayground(component: component);
}

@UseCase(name: 'Read-Only Summary Mode (JSON)', type: ComponentFieldArray, path: '[Components]/Data')
Widget readOnlyComponentFieldArray(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "sources_summary",
    "type": "field_array",
    "label": "Ringkasan Sumber Deviasi (Read-Only)",
    "presentation": "table",
    "read_only": true,
    "initial_value": [
      {
        "source_type": "Batch Record",
        "source_record_no": "BR-2026-001",
        "known_date": "2026-11-20"
      },
      {
        "source_type": "Inspeksi",
        "source_record_no": "INS-2026-014",
        "known_date": "2026-11-22"
      }
    ],
    "columns": [
      { "header": "Jenis sumber", "body": "source_type", "width": 180 },
      { "header": "Nomor rekaman", "body": "source_record_no", "width": 200 },
      { "header": "Tanggal diketahui", "body": "known_date", "width": 160 }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentFieldArray.fromMap(map);

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: component.toWidget({}),
  );
}

class _FieldArrayWidgetbookPlayground extends StatefulWidget {
  final ComponentFieldArray component;

  const _FieldArrayWidgetbookPlayground({required this.component});

  @override
  State<_FieldArrayWidgetbookPlayground> createState() =>
      _FieldArrayWidgetbookPlaygroundState();
}

class _FieldArrayWidgetbookPlaygroundState
    extends State<_FieldArrayWidgetbookPlayground> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _latestValue = const [];
  String? _validationStatus;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.component.toWidget({
              'onFieldArrayChanged': (List<Map<String, dynamic>> rows) {
                if (mounted) {
                  setState(() {
                    _latestValue = rows;
                  });
                }
              },
            }),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    final valid = _formKey.currentState?.validate() ?? false;
                    setState(() {
                      _validationStatus = valid
                          ? 'VALID (${_latestValue.length} rows ready as JSON array)'
                          : 'INVALID — check required cells or row constraints';
                    });
                  },
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: const Text('Validate Step / Submit'),
                ),
                if (_validationStatus != null) ...[
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      _validationStatus!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: _validationStatus!.startsWith('VALID')
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Native {{ form.<id> }} JSON Array Payload:',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SelectableText(
                    const JsonEncoder.withIndent('  ').convert(_latestValue),
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
