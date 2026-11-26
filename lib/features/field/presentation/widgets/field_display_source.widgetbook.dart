import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

/// Interactive Widgetbook showcase for testing foreign-key `display_source`
/// resolution across Table cells, Detail views, and simulated XLSX/Print exports.
class FieldDisplaySourceShowcase extends StatefulWidget {
  const FieldDisplaySourceShowcase({
    super.key,
    required this.entityJson,
    required this.sampleRows,
  });

  final String entityJson;
  final List<Map<String, dynamic>> sampleRows;

  @override
  State<FieldDisplaySourceShowcase> createState() =>
      _FieldDisplaySourceShowcaseState();
}

class _FieldDisplaySourceShowcaseState extends State<FieldDisplaySourceShowcase> {
  int _selectedRowIndex = 0;
  bool _mockNetworkLag = false;

  @override
  void initState() {
    super.initState();
    _setupMockBackend();
  }

  void _setupMockBackend() {
    ReferenceLabelCache.instance.customFetcher = ({
      required String path,
      required String batchParam,
      required List<String> ids,
      String? url,
    }) async {
      if (_mockNetworkLag) {
        await Future.delayed(const Duration(milliseconds: 300));
      }

      final cleanPath = path.replaceAll('/', '').trim();

      if (cleanPath.contains('plant_capa_categories')) {
        const categories = {
          '1': {
            'id': 1,
            'code': 'CAT-DEV-MAYOR',
            'name': 'Penyimpangan Kritis & Mayor',
          },
          '2': {
            'id': 2,
            'code': 'CAT-AUD-INT',
            'name': 'Temuan Audit Internal',
          },
          '3': {
            'id': 3,
            'code': 'CAT-KEL-PEL',
            'name': 'Keluhan Pelanggan / Recall',
          },
        };
        return ids
            .where((id) => categories.containsKey(id))
            .map((id) => Map<String, dynamic>.from(categories[id]!))
            .toList();
      }

      if (cleanPath.contains('plant_sites')) {
        const sites = {
          '1': {
            'id': 1,
            'code': 'SITE-CKR',
            'name': 'Pabrik Cikarang - Plant CPOB',
          },
          '2': {
            'id': 2,
            'code': 'SITE-JKT',
            'name': 'Gudang Distribusi Jakarta',
          },
        };
        return ids
            .where((id) => sites.containsKey(id))
            .map((id) => Map<String, dynamic>.from(sites[id]!))
            .toList();
      }

      if (cleanPath.contains('users')) {
        const users = {
          'SPV-QC-01': {
            'nip': 'SPV-QC-01',
            'name': 'Budi Santoso (QC Supervisor)',
          },
          'MGR-QA-02': {
            'nip': 'MGR-QA-02',
            'name': 'Dewi Lestari (QA Manager)',
          },
          'AUD-QA-01': {
            'nip': 'AUD-QA-01',
            'name': 'Ahmad Fauzi (Lead Auditor)',
          },
        };
        return ids
            .where((id) => users.containsKey(id))
            .map((id) => Map<String, dynamic>.from(users[id]!))
            .toList();
      }

      return const [];
    };
  }

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

    final selectedRow = widget.sampleRows.isNotEmpty
        ? widget.sampleRows[_selectedRowIndex.clamp(0, widget.sampleRows.length - 1)]
        : <String, dynamic>{};

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('FF-07: Foreign-Key display_source Showcase'),
        actions: [
          Row(
            children: [
              const Text('Simulate 300ms Lag:', style: TextStyle(fontSize: 12)),
              Switch(
                value: _mockNetworkLag,
                onChanged: (val) {
                  setState(() => _mockNetworkLag = val);
                },
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                icon: const Icon(Icons.refresh, size: 16),
                label: const Text('Clear Cache'),
                onPressed: () {
                  setState(() {
                    ReferenceLabelCache.instance.clear();
                  });
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanationBanner(),
            const SizedBox(height: 24),
            _buildTableSection(entity),
            const SizedBox(height: 32),
            _buildDetailSection(entity, selectedRow),
            const SizedBox(height: 32),
            _buildExportSimulationSection(entity),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanationBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.hub_outlined, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Arsitektur display_source (KODE - NAMA Foreign Keys)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Foreign keys seperti `capa_category_id: 1`, `site_id: 1`, dan `pic_nip: SPV-QC-01` '
            'secara otomatis di-batch dan di-lookup ke endpoint masing-masing, menghasilkan label format '
            '"KODE - NAMA" secara konsisten pada Tabel, Detail, Export Excel, dan Print PDF.',
            style: TextStyle(fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildTableSection(EntityCustom entity) {
    return Card(
      elevation: 0,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.surface
          : Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Tampilan Tabel (EntityFieldDisplay dengan display_source)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 4),
            const Text(
              'Klik baris untuk melihat detailnya di bawah. Kolom ID menampilkan label resolusi "KODE - NAMA":',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                headingRowColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.06),
                ),
                columns: const [
                  DataColumn(label: Text('No. CAPA')),
                  DataColumn(label: Text('Kategori (display_source)')),
                  DataColumn(label: Text('Pabrik / Site (display_source)')),
                  DataColumn(label: Text('PIC (display_source)')),
                  DataColumn(label: Text('Status (value_labels)')),
                ],
                rows: widget.sampleRows.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final row = entry.value;
                  final isSelected = idx == _selectedRowIndex;

                  return DataRow(
                    selected: isSelected,
                    onSelectChanged: (_) {
                      setState(() => _selectedRowIndex = idx);
                    },
                    cells: [
                      DataCell(
                        Text(
                          row['code']?.toString() ?? '-',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      DataCell(
                        EntityFieldDisplay.build(
                          entity,
                          'capa_category_id',
                          row['capa_category_id'],
                        ),
                      ),
                      DataCell(
                        EntityFieldDisplay.build(
                          entity,
                          'site_id',
                          row['site_id'],
                        ),
                      ),
                      DataCell(
                        EntityFieldDisplay.build(
                          entity,
                          'pic_nip',
                          row['pic_nip'],
                        ),
                      ),
                      DataCell(
                        EntityFieldDisplay.build(
                          entity,
                          'status',
                          row['status'],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(EntityCustom entity, Map<String, dynamic> row) {
    return Card(
      elevation: 0,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.surface
          : Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2. Detail View (Baris Terpilih: ${row['code']})',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Raw ID kategori: ${row['capa_category_id']} | site: ${row['site_id']}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            entity.layoutForm.view?.toWidget(
                  row,
                  entityFields: entity.fields,
                ) ??
                const Text('Tidak ada layout_form.view terkonfigurasi.'),
          ],
        ),
      ),
    );
  }

  Widget _buildExportSimulationSection(EntityCustom entity) {
    final formattedRows = FieldValueLabelResolver.formatRowsForExport(
      widget.sampleRows,
      ['code', 'capa_category_id', 'site_id', 'pic_nip', 'status'],
      entity.fields,
    );

    return Card(
      elevation: 0,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.surface
          : Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '3. Simulasi XLSX / Print PDF (formatRowsForExport)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 4),
            const Text(
              'Data yang diekspor otomatis berisi label "KODE - NAMA" ter-resolve tanpa mengubah raw rows di state:',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: formattedRows.map((r) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '• ${r['code']}: Kategori="${r['capa_category_id']}", Site="${r['site_id']}", PIC="${r['pic_nip']}", Status="${r['status']}"',
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _defaultCPOBCapaEntityJson = '''
{
  "id": "plant_capas",
  "label": "CAPA CPOB",
  "description": "Dokumen CAPA CPOB",
  "backend": { "others": [] },
  "layout_table": {},
  "fields": [
    {
      "label": "No. CAPA",
      "reference": "code",
      "type": "text",
      "required": true
    },
    {
      "label": "Kategori CAPA",
      "reference": "capa_category_id",
      "type": "number",
      "display_source": {
        "path": "/plant_capa_categories",
        "key": "id",
        "label": "{{item.code}} - {{item.name}}",
        "cache_ttl_seconds": 300
      }
    },
    {
      "label": "Tempat Pembuatan",
      "reference": "site_id",
      "type": "number",
      "display_source": {
        "path": "/plant_sites",
        "key": "id",
        "label": "{{item.code}} - {{item.name}}"
      }
    },
    {
      "label": "PIC",
      "reference": "pic_nip",
      "type": "text",
      "display_source": {
        "path": "/users",
        "key": "nip",
        "batch_param": "nip.in",
        "label": "{{item.nip}} - {{item.name}}"
      }
    },
    {
      "label": "Status",
      "reference": "status",
      "type": "text",
      "is_chip": true,
      "value_labels": {
        "DRAFT": "Draf",
        "EVALUATION_APPROVAL": "Evaluasi & Persetujuan",
        "CLOSED": "Ditutup"
      },
      "chip_colors": {
        "DRAFT": "#1E88E5",
        "EVALUATION_APPROVAL": "#F57C00",
        "CLOSED": "#43A047"
      }
    }
  ],
  "layout_form": [
    {
      "id": "view",
      "label": "Detail CAPA",
      "type": "view",
      "components": [
        {
          "id": "v_code",
          "type": "field_display",
          "label": "Nomor CAPA",
          "value": "{{current.code}}"
        },
        {
          "id": "v_cat",
          "type": "field_display",
          "label": "Kategori CAPA (field_ref)",
          "value": "{{current.capa_category_id}}",
          "field_ref": "capa_category_id"
        },
        {
          "id": "v_site",
          "type": "field_display",
          "label": "Lokasi Site Pabrik",
          "value": "{{current.site_id}}",
          "field_ref": "site_id"
        },
        {
          "id": "v_pic",
          "type": "field_display",
          "label": "Penanggung Jawab (PIC)",
          "value": "{{current.pic_nip}}",
          "field_ref": "pic_nip"
        },
        {
          "id": "v_status",
          "type": "field_display",
          "label": "Status",
          "value": "{{current.status}}",
          "field_ref": "status",
          "is_chip": true
        }
      ]
    }
  ]
}
''';

const List<Map<String, dynamic>> _sampleCapaRows = [
  {
    'code': 'CAPA-2026-001',
    'capa_category_id': 1,
    'site_id': 1,
    'pic_nip': 'SPV-QC-01',
    'status': 'DRAFT',
  },
  {
    'code': 'CAPA-2026-002',
    'capa_category_id': 2,
    'site_id': 2,
    'pic_nip': 'MGR-QA-02',
    'status': 'EVALUATION_APPROVAL',
  },
  {
    'code': 'CAPA-2026-003',
    'capa_category_id': 3,
    'site_id': 1,
    'pic_nip': 'AUD-QA-01',
    'status': 'CLOSED',
  },
];

@UseCase(
  name: 'From JSON Config',
  type: FieldDisplaySourceShowcase,
  path: '[Data & Fields]',
)
Widget buildFieldDisplaySourceFromJsonUseCase(BuildContext context) {
  final rawJson = context.knobs.string(
    label: 'Entity JSON Config',
    initialValue: _defaultCPOBCapaEntityJson,
  );

  return FieldDisplaySourceShowcase(
    entityJson: rawJson,
    sampleRows: _sampleCapaRows,
  );
}
