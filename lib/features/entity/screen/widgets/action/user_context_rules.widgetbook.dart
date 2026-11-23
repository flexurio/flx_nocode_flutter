import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

/// Interactive JSON-based Widgetbook showcase for Dynamic JWT User Context
/// (`user.*` claims, `user.roles`) and Segregation of Duties (SoD) / ABAC rules.
class UserContextRulesShowcase extends StatefulWidget {
  const UserContextRulesShowcase({
    super.key,
    required this.entityJson,
    required this.initialJwtClaimsJson,
    required this.sampleRows,
  });

  final String entityJson;
  final String initialJwtClaimsJson;
  final List<Map<String, dynamic>> sampleRows;

  @override
  State<UserContextRulesShowcase> createState() =>
      _UserContextRulesShowcaseState();
}

class _UserContextRulesShowcaseState extends State<UserContextRulesShowcase> {
  late String _activePersonaKey;
  late String _customJwtJson;
  int _selectedRowIndex = 0;

  static const Map<String, Map<String, dynamic>> _presetPersonas = {
    'qa_manager_budi': {
      'label': 'QA Manager (NIP: EMP-QA-001 — Budi)',
      'claims': {
        'id': 101,
        'nm': 'Apt. Budi Santoso, S.Farm',
        'nip': 'EMP-QA-001',
        'cs': 'EMP-QA-001',
        'rl': 'plant_qa_manager,plant_auditor',
        'department_id': 'QA',
        'site_id': 'SITE-CKR',
      },
    },
    'qa_officer_siti': {
      'label': 'QA Officer / Penyusun (NIP: EMP-QA-002 — Siti)',
      'claims': {
        'id': 102,
        'nm': 'Siti Rahmawati, S.Si',
        'nip': 'EMP-QA-002',
        'cs': 'EMP-QA-002',
        'rl': 'plant_qa_officer',
        'department_id': 'QA',
        'site_id': 'SITE-CKR',
      },
    },
    'pic_prod_hendra': {
      'label': 'PIC Produksi (NIP: EMP-PROD-004 — Hendra)',
      'claims': {
        'id': 103,
        'nm': 'Ir. Hendra Wijaya',
        'nip': 'EMP-PROD-004',
        'cs': '{"nip":"EMP-PROD-004","shift":"A","line":"LINE-01"}',
        'rl': ['plant_pic', 'plant_production_spv'],
        'department_id': 'PROD',
        'site_id': 'SITE-CKR',
      },
    },
  };

  @override
  void initState() {
    super.initState();
    _activePersonaKey = 'qa_manager_budi';
    _customJwtJson = widget.initialJwtClaimsJson;
    _applyClaimsFromJson(_customJwtJson);
  }

  @override
  void didUpdateWidget(covariant UserContextRulesShowcase oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialJwtClaimsJson != widget.initialJwtClaimsJson) {
      _customJwtJson = widget.initialJwtClaimsJson;
      _applyClaimsFromJson(_customJwtJson);
    }
  }

  void _selectPreset(String key) {
    final preset = _presetPersonas[key];
    if (preset == null) return;
    final encoded =
        const JsonEncoder.withIndent('  ').convert(preset['claims']);
    setState(() {
      _activePersonaKey = key;
      _customJwtJson = encoded;
      _applyClaimsFromJson(encoded);
    });
  }

  String? _applyClaimsFromJson(String rawJson) {
    try {
      final decoded = jsonDecode(rawJson) as Map<String, dynamic>;
      UserRepositoryAppNocode.instance.setUserFromClaims(
        decoded,
        accessToken: 'demo_jwt_token',
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final jwtError = _applyClaimsFromJson(_customJwtJson);
    EntityCustom? entity;
    String? entityError;
    try {
      final decoded = jsonDecode(widget.entityJson) as Map<String, dynamic>;
      entity = EntityCustom.fromJson(decoded);
    } catch (e) {
      entityError = e.toString();
    }

    if (entityError != null || entity == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Entity JSON Parse Error:\n$entityError',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    final selectedRow = widget.sampleRows.isNotEmpty
        ? widget.sampleRows[
            _selectedRowIndex.clamp(0, widget.sampleRows.length - 1)]
        : <String, dynamic>{};

    final userCtx = UserRepositoryAppNocode.instance.userContext;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor =
        isDark ? Colors.white.withValues(alpha: 0.12) : Colors.grey.shade300;

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
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'FF-02 Best Practice: Dynamic JWT User Context & ABAC / SoD Rules',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Persona Switcher & Live JWT Context
            buildSection(
              title: '1. Simulasi Login JWT Claims (Dynamic user.* Context)',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih akun simulasi untuk menguji bagaimana klaim JWT diekspos secara dinamis ke `user.*` dan mengubah visibilitas tombol aksi (SoD & Role):',
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: _presetPersonas.entries.map((entry) {
                      final isSelected = _activePersonaKey == entry.key;
                      return ChoiceChip(
                        label: Text(
                          entry.value['label'] as String,
                          style: TextStyle(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.textTheme.bodyMedium?.color,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor:
                            theme.colorScheme.primary.withValues(alpha: 0.14),
                        checkmarkColor: theme.colorScheme.primary,
                        side: BorderSide(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : borderColor,
                        ),
                        onSelected: (_) => _selectPreset(entry.key),
                      );
                    }).toList(),
                  ),
                  if (jwtError != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      'JWT Claims JSON Error: $jwtError',
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black.withValues(alpha: 0.25)
                          : Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resolved Variable Interpolation:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '• {{ user.id }} = "${'{{ user.id }}'.interpolateJavascript()}"   '
                          '| {{ user.name }} = "${'{{ user.name }}'.interpolateJavascript()}"\n'
                          '• {{ user.nip }} = "${'{{ user.nip }}'.interpolateJavascript()}"   '
                          '| {{ user.department_id }} = "${'{{ user.department_id }}'.interpolateJavascript()}"   '
                          '| {{ user.site_id }} = "${'{{ user.site_id }}'.interpolateJavascript()}"\n'
                          '• [[ user.roles ]] = ${'[[ user.roles ]]'.interpolateJavascript()}   '
                          '| userContext["roles"] = ${userCtx['roles']}',
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 2. Document Table Selection
            buildSection(
              title: '2. Pilih Baris Dokumen CAPA (Uji Segregation of Duties)',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  showCheckboxColumn: false,
                  columns: const [
                    DataColumn(label: Text('No. CAPA')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Penyusun (prepared_by)')),
                    DataColumn(label: Text('PIC (pic_nip)')),
                    DataColumn(label: Text('Departemen')),
                    DataColumn(label: Text('Aksi yang Tampil (Live Rule)')),
                  ],
                  rows: List.generate(widget.sampleRows.length, (i) {
                    final row = widget.sampleRows[i];
                    final visibleActions = entity!.actions
                        .where((a) => a.isVisibleFor(row))
                        .toList();

                    return DataRow(
                      selected: i == _selectedRowIndex,
                      onSelectChanged: (_) =>
                          setState(() => _selectedRowIndex = i),
                      cells: [
                        DataCell(Text(
                          row['code']?.toString() ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text(row['status']?.toString() ?? '')),
                        DataCell(Text(row['prepared_by']?.toString() ?? '')),
                        DataCell(Text(row['pic_nip']?.toString() ?? '')),
                        DataCell(Text(row['department_id']?.toString() ?? '')),
                        DataCell(
                          Wrap(
                            spacing: 6,
                            children: visibleActions.isEmpty
                                ? [
                                    const Text(
                                      '(Tidak ada aksi untuk user ini)',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ]
                                : visibleActions
                                    .map(
                                      (a) => Chip(
                                        visualDensity: VisualDensity.compact,
                                        backgroundColor: Colors.green
                                            .withValues(alpha: 0.15),
                                        label: Text(
                                          a.name,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Detailed Rule Evaluation Inspector for Selected Row
            buildSection(
              title:
                  '3. Evaluasi Rule Aksi pada Baris Terpilih (${selectedRow['code']})',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final ActionD action in entity.actions)
                    _buildActionRuleCard(action, selectedRow, borderColor),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 4. Layout Form View with Dynamic User Interpolation
            buildSection(
              title:
                  '4. Detail View / Form Component Interpolation (layout_form)',
              child: entity.layoutForm.view?.toWidget(
                    selectedRow,
                    entityFields: entity.fields,
                  ) ??
                  const Text('No layout_form.view configured'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRuleCard(
    ActionD action,
    Map<String, dynamic> row,
    Color borderColor,
  ) {
    final isVisible = action.isVisibleFor(row);
    final conditions = action.rule?.all ?? const [];

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isVisible
              ? Colors.green.withValues(alpha: 0.5)
              : borderColor,
        ),
        color: isVisible
            ? Colors.green.withValues(alpha: 0.06)
            : Colors.grey.withValues(alpha: 0.04),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isVisible ? Icons.check_circle : Icons.cancel_outlined,
                color: isVisible ? Colors.green : Colors.redAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${action.name} (id: "${action.id}")',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isVisible ? Colors.green : Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isVisible ? 'VISIBLE' : 'HIDDEN',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (conditions.isNotEmpty) ...[
            const SizedBox(height: 8),
            for (final c in conditions)
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 2),
                child: Row(
                  children: [
                    Icon(
                      c.evaluate(row) ? Icons.check : Icons.close,
                      size: 14,
                      color: c.evaluate(row) ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '${c.field}  ${c.op}  ${jsonEncode(c.value)}',
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
        ],
      ),
    );
  }
}

const String _defaultJwtClaimsJson = '''
{
  "id": 101,
  "nm": "Apt. Budi Santoso, S.Farm",
  "nip": "EMP-QA-001",
  "cs": "EMP-QA-001",
  "rl": "plant_qa_manager,plant_auditor",
  "department_id": "QA",
  "site_id": "SITE-CKR"
}
''';

const String _defaultUserContextEntityJson = '''
{
  "id": "plant_capas_sod_demo",
  "label": "CAPA — Segregation of Duties & Dynamic User Claims",
  "description": "Demo best practice dynamic user.* claims & declarative Rule evaluation",
  "backend": { "others": [] },
  "layout_table": {},
  "fields": [
    { "reference": "code", "label": "No. CAPA", "type": "text" },
    { "reference": "status", "label": "Status", "type": "text" },
    { "reference": "prepared_by", "label": "Penyusun (NIP)", "type": "text" },
    { "reference": "pic_nip", "label": "PIC (NIP)", "type": "text" },
    { "reference": "department_id", "label": "Departemen", "type": "text" }
  ],
  "actions": [
    {
      "id": "evaluasi_setujui",
      "name": "Evaluasi & Setujui (SoD: Penyetuju != Penyusun & Role QA Manager)",
      "type": "show_confirmation_dialog",
      "confirm_message": "Setujui CAPA {{ data.code }} sebagai {{ user.name }} ({{ user.nip }})?",
      "rule": {
        "all": [
          { "field": "status", "op": "=", "value": "EVALUATION_APPROVAL" },
          { "field": "prepared_by", "op": "!=", "value": "{{ user.nip }}" },
          { "field": "user.roles", "op": "contains", "value": "plant_qa_manager" }
        ]
      }
    },
    {
      "id": "ajukan_rencana_pic",
      "name": "Ajukan Rencana Tindakan (Hanya PIC Terkait)",
      "type": "show_confirmation_dialog",
      "confirm_message": "Ajukan rencana tindakan oleh PIC {{ user.nip }}?",
      "rule": {
        "all": [
          { "field": "status", "op": "=", "value": "ACTION_PLANNING" },
          { "field": "pic_nip", "op": "=", "value": "{{ user.nip }}" },
          { "field": "user.roles", "op": "contains", "value": "plant_pic" }
        ]
      }
    },
    {
      "id": "revisi_draf_penyusun",
      "name": "Ubah Draf (Hanya Penyusun Dokumen)",
      "type": "show_confirmation_dialog",
      "confirm_message": "Ubah draf CAPA milik {{ user.nip }}?",
      "rule": {
        "all": [
          { "field": "status", "op": "=", "value": "DRAFT" },
          { "field": "prepared_by", "op": "=", "value": "{{ user.nip }}" }
        ]
      }
    }
  ],
  "layout_form": [
    {
      "id": "view",
      "label": "Detail CAPA & Konteks User Aktif",
      "type": "view",
      "components": [
        {
          "id": "v_doc",
          "type": "field_display",
          "label": "Dokumen CAPA",
          "value": "{{ current.code }} (Status: {{ current.status }})"
        },
        {
          "id": "v_prep",
          "type": "field_display",
          "label": "Disusun Oleh vs Login Saat Ini",
          "value": "Penyusun: {{ current.prepared_by }} | Login: {{ user.name }} (NIP: {{ user.nip }}, Dept: {{ user.department_id }})"
        },
        {
          "id": "v_sod",
          "type": "field_display",
          "label": "Status Segregation of Duties (SoD)",
          "value": "{{ current.prepared_by != user.nip ? 'LOLOS SoD (Penyetuju berbeda dari Penyusun)' : 'DITOLAK SoD (Tidak boleh menyetujui dokumen sendiri)' }}"
        }
      ]
    }
  ]
}
''';

const List<Map<String, dynamic>> _sampleSodRows = [
  {
    'code': 'CAPA/2026/11/001',
    'status': 'EVALUATION_APPROVAL',
    'prepared_by': 'EMP-QA-002',
    'pic_nip': 'EMP-PROD-004',
    'department_id': 'QA',
  },
  {
    'code': 'CAPA/2026/11/002',
    'status': 'EVALUATION_APPROVAL',
    'prepared_by': 'EMP-QA-001',
    'pic_nip': 'EMP-PROD-004',
    'department_id': 'QA',
  },
  {
    'code': 'CAPA/2026/11/003',
    'status': 'ACTION_PLANNING',
    'prepared_by': 'EMP-QA-002',
    'pic_nip': 'EMP-PROD-004',
    'department_id': 'PROD',
  },
  {
    'code': 'CAPA/2026/11/004',
    'status': 'DRAFT',
    'prepared_by': 'EMP-QA-002',
    'pic_nip': 'EMP-PROD-004',
    'department_id': 'QA',
  },
];

@UseCase(name: 'From JSON Config (Dynamic JWT Claims & SoD)', type: UserContextRulesShowcase)
Widget buildUserContextRulesFromJsonUseCase(BuildContext context) {
  final entityJson = context.knobs.string(
    label: 'Entity JSON Config',
    initialValue: _defaultUserContextEntityJson,
  );
  final jwtJson = context.knobs.string(
    label: 'Initial JWT Payload JSON',
    initialValue: _defaultJwtClaimsJson,
  );

  return UserContextRulesShowcase(
    entityJson: entityJson,
    initialJwtClaimsJson: jwtJson,
    sampleRows: _sampleSodRows,
  );
}
