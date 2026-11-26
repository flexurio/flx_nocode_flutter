import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

/// Interactive JSON-based Widgetbook showcase for the 2-Layer Single-Source-of-Truth
/// Access Control Engine (`AccessPolicyEvaluator`).
///
/// Demonstrates:
/// - **Layer 1 (Server-Driven Capabilities)**: Backend `rules.json` capabilities
///   automatically gate `menu_sub` (`<entity>:read`) and `actions[].permissions`
///   without hardcoding role arrays in `configuration.json`.
/// - **Layer 2 (Declarative Hierarchical `Rule` / ABAC)**: `menu_group` -> `menu`
///   -> `menu_sub` inheritance, empty parent pruning, and SoD/ABAC action rules.
class AccessControlShowcase extends StatefulWidget {
  const AccessControlShowcase({
    super.key,
    required this.menuConfigJson,
    required this.actionsJson,
    this.bypassAllPermissions = false,
  });

  final String menuConfigJson;
  final String actionsJson;
  final bool bypassAllPermissions;

  @override
  State<AccessControlShowcase> createState() => _AccessControlShowcaseState();
}

class _AccessControlShowcaseState extends State<AccessControlShowcase> {
  String _activePersonaKey = 'qa_manager';
  bool _enableServerCapabilities = true;

  static const Map<String, Map<String, dynamic>> _personas = {
    'qa_manager': {
      'label': 'QA Manager (SITE-CKR — Budi)',
      'claims': {
        'id': 101,
        'nm': 'Apt. Budi Santoso, S.Farm',
        'nip': 'EMP-QA-001',
        'cs': 'EMP-QA-001',
        'rl': 'plant_qa_manager,plant_auditor',
        'department_id': 'QA',
        'site_id': 'SITE-CKR',
      },
      'capabilities': {
        'capas': ['read', 'create', 'approve', 'delete'],
        'capa_categories': ['read', 'create', 'update'],
        'deviations': ['read', 'approve'],
        'audit_logs': ['read'],
      },
    },
    'qa_officer': {
      'label': 'QA Officer / Penyusun (SITE-CKR — Siti)',
      'claims': {
        'id': 102,
        'nm': 'Siti Rahmawati, S.Si',
        'nip': 'EMP-QA-002',
        'cs': 'EMP-QA-002',
        'rl': 'plant_qa_officer',
        'department_id': 'QA',
        'site_id': 'SITE-CKR',
      },
      'capabilities': {
        'capas': ['read', 'create'],
        'deviations': ['read', 'create'],
      },
    },
    'prod_pic': {
      'label': 'PIC Produksi (SITE-CKR — Hendra)',
      'claims': {
        'id': 103,
        'nm': 'Ir. Hendra Wijaya',
        'nip': 'EMP-PROD-004',
        'cs': 'EMP-PROD-004',
        'rl': ['plant_pic'],
        'department_id': 'PROD',
        'site_id': 'SITE-CKR',
      },
      'capabilities': {
        'capas': ['read'],
      },
    },
    'site_b_auditor': {
      'label': 'Auditor Plant B (SITE-BDG — Rina)',
      'claims': {
        'id': 104,
        'nm': 'Rina Kartika',
        'nip': 'EMP-AUD-009',
        'cs': 'EMP-AUD-009',
        'rl': 'plant_auditor',
        'department_id': 'AUDIT',
        'site_id': 'SITE-BDG',
      },
      'capabilities': {
        'capas': ['read'],
        'audit_logs': ['read'],
      },
    },
    'super_admin': {
      'label': 'Super Admin (Wildcard *)',
      'claims': {
        'id': 1,
        'nm': 'System Administrator',
        'nip': 'ADM-001',
        'cs': 'ADM-001',
        'rl': 'super_admin',
        'department_id': 'IT',
        'site_id': 'SITE-CKR',
      },
      'capabilities': ['*'],
    },
  };

  static const Map<String, dynamic> _sampleCapaRow = {
    'id': 'CAPA-2026-0042',
    'status': 'EVALUATION_APPROVAL',
    'prepared_by': 'EMP-QA-002',
    'pic_nip': 'EMP-PROD-004',
  };

  @override
  void initState() {
    super.initState();
    _applyPersona();
  }

  void _applyPersona() {
    final persona = _personas[_activePersonaKey]!;
    final claims = Map<String, dynamic>.from(persona['claims'] as Map);
    UserRepositoryAppNocode.instance.setUserFromClaims(
      claims,
      capabilities: _enableServerCapabilities ? persona['capabilities'] : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    _applyPersona();

    final accessConfig = AccessControlConfig(
      bypassAllPermissions: widget.bypassAllPermissions,
      autoCheckEntityRead: true,
    );
    final evaluator = AccessPolicyEvaluator(
      userRepository: UserRepositoryAppNocode.instance,
      config: accessConfig,
    );

    List<MenuGroup> allGroups = const [];
    List<ActionD> allActions = const [];
    String? parseError;

    try {
      final decodedMenu = jsonDecode(widget.menuConfigJson) as List<dynamic>;
      allGroups = decodedMenu
          .map((e) => MenuGroup.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();

      final decodedActions = jsonDecode(widget.actionsJson) as List<dynamic>;
      allActions = decodedActions
          .map((e) => ActionD.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (e) {
      parseError = e.toString();
    }

    final filteredGroups = evaluator.filterMenuGroups(allGroups);
    final totalSubCount = allGroups.fold<int>(
      0,
      (sum, g) => sum + g.menu.fold<int>(0, (s, m) => s + m.menuSub.length),
    );
    final visibleSubCount = filteredGroups.fold<int>(
      0,
      (sum, g) => sum + g.menu.fold<int>(0, (s, m) => s + m.menuSub.length),
    );

    final dummyEntity = EntityCustom.empty().copyWith(
      id: 'capas',
      label: 'CAPA',
      bypassAllPermissions: false,
    );

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primaryColor = theme.colorScheme.primary;
    final cardColor = isDark ? const Color(0xFF1E1E24) : Colors.white;
    final borderColor =
        isDark ? Colors.white.withValues(alpha: 0.12) : Colors.grey.shade200;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF141418) : const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: cardColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: borderColor),
        ),
        title: const Text('Access Control (2-Layer Single Source of Truth)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPersonaSelector(
              cardColor: cardColor,
              borderColor: borderColor,
              primaryColor: primaryColor,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
            if (parseError != null)
              Card(
                color: Colors.red.shade50,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.red.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'JSON Parse Error: $parseError',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              )
            else ...[
              _buildActiveContextSummary(
                visibleSubCount: visibleSubCount,
                totalSubCount: totalSubCount,
                isDark: isDark,
                borderColor: borderColor,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _buildMenuTreeCard(
                      filteredGroups,
                      cardColor: cardColor,
                      borderColor: borderColor,
                      primaryColor: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: _buildActionsCard(
                      allActions: allActions,
                      entity: dummyEntity,
                      evaluator: evaluator,
                      cardColor: cardColor,
                      borderColor: borderColor,
                      isDark: isDark,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPersonaSelector({
    required Color cardColor,
    required Color borderColor,
    required Color primaryColor,
    required bool isDark,
  }) {
    return Card(
      color: cardColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active User Persona',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _personas.entries.map((entry) {
                final selected = entry.key == _activePersonaKey;
                return ChoiceChip(
                  label: Text(entry.value['label'] as String),
                  selected: selected,
                  selectedColor: primaryColor.withValues(alpha: 0.16),
                  backgroundColor: isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.grey.shade50,
                  side: BorderSide(
                    color: selected ? primaryColor : borderColor,
                  ),
                  checkmarkColor: primaryColor,
                  labelStyle: TextStyle(
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                    color: selected
                        ? (isDark ? Colors.white : primaryColor)
                        : null,
                  ),
                  onSelected: (_) {
                    setState(() {
                      _activePersonaKey = entry.key;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                'Layer 1: Server-Driven Capabilities Active (Single Source of Truth)',
              ),
              subtitle: const Text(
                'When ON, MenuSub automatically enforces <entity>:read from backend capabilities without hardcoding roles in configuration.json.',
              ),
              value: _enableServerCapabilities,
              onChanged: (v) {
                setState(() {
                  _enableServerCapabilities = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveContextSummary({
    required int visibleSubCount,
    required int totalSubCount,
    required bool isDark,
    required Color borderColor,
  }) {
    final repo = UserRepositoryAppNocode.instance;
    return Card(
      color: isDark ? const Color(0xFF1A222C) : const Color(0xFFF0F4F8),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            Text('Roles: ${repo.roles.join(", ")}'),
            Text('Site: ${repo.claims['site_id'] ?? '-'}'),
            Text('Dept: ${repo.claims['department_id'] ?? '-'}'),
            Text(
              'Capabilities (${repo.effectiveCapabilities.length}): '
              '${repo.effectiveCapabilities.isEmpty ? "none (Layer 2 only)" : repo.effectiveCapabilities.join(", ")}',
            ),
            Text(
              'Visible Menus: $visibleSubCount / $totalSubCount',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTreeCard(
    List<MenuGroup> filteredGroups, {
    required Color cardColor,
    required Color borderColor,
    required Color primaryColor,
  }) {
    return Card(
      color: cardColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filtered Sidebar Menu Tree',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const Divider(),
            if (filteredGroups.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'No accessible menus for this user.',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            else
              ...filteredGroups.map(
                (group) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.label.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ...group.menu.map(
                        (m) => Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.folder_open, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      m.label,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...m.menuSub.map(
                                (sub) => Padding(
                                  padding: const EdgeInsets.only(
                                    left: 22,
                                    top: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        size: 14,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          '${sub.label} (${sub.entity})',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsCard({
    required List<ActionD> allActions,
    required EntityCustom entity,
    required AccessPolicyEvaluator evaluator,
    required Color cardColor,
    required Color borderColor,
    required bool isDark,
  }) {
    return Card(
      color: cardColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Action & SoD Visibility (Row: CAPA-2026-0042)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              'status=EVALUATION_APPROVAL | prepared_by=EMP-QA-002 | pic_nip=EMP-PROD-004',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const Divider(),
            ...allActions.map((action) {
              final visible = action.isVisibleFor(
                _sampleCapaRow,
                entity: entity,
                bypassPermission: widget.bypassAllPermissions,
                evaluator: evaluator,
              );
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  visible ? Icons.visibility : Icons.visibility_off,
                  color: visible ? Colors.green : Colors.red.shade300,
                ),
                title: Text(action.name),
                subtitle: Text(
                  [
                    if (action.explicitPermissions.isNotEmpty)
                      'perms: ${action.explicitPermissions.join(", ")}',
                    if (action.rule != null) 'rule: active',
                  ].join(' | '),
                  style: const TextStyle(fontSize: 11),
                ),
                trailing: Chip(
                  label: Text(
                    visible ? 'VISIBLE' : 'HIDDEN',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: visible
                          ? (isDark ? Colors.green.shade200 : Colors.green.shade800)
                          : (isDark ? Colors.red.shade200 : Colors.red.shade800),
                    ),
                  ),
                  side: BorderSide.none,
                  backgroundColor: visible
                      ? (isDark
                          ? Colors.green.withValues(alpha: 0.2)
                          : Colors.green.shade50)
                      : (isDark
                          ? Colors.red.withValues(alpha: 0.2)
                          : Colors.red.shade50),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

const String _defaultMenuConfigJson = '''
[
  {
    "label": "Quality Assurance",
    "menu": [
      {
        "label": "CAPA & Deviation",
        "icon": "list",
        "menu_sub": [
          { "label": "CAPA", "entity": "capas" },
          { "label": "Penyimpangan", "entity": "deviations" }
        ]
      },
      {
        "label": "Master QA",
        "icon": "settings",
        "rule": {
          "all": [
            { "field": "user.site_id", "op": "=", "value": "SITE-CKR" }
          ]
        },
        "menu_sub": [
          { "label": "Master Kategori CAPA", "entity": "capa_categories" }
        ]
      }
    ]
  },
  {
    "label": "Compliance & Audit",
    "rule": {
      "any": [
        { "field": "user.roles", "op": "contains", "value": "plant_auditor" },
        { "field": "user.roles", "op": "contains", "value": "super_admin" }
      ]
    },
    "menu": [
      {
        "label": "Audit Trail",
        "icon": "shield",
        "menu_sub": [
          { "label": "Log Audit CPOB", "entity": "audit_logs" }
        ]
      }
    ]
  }
]
''';

const String _defaultActionsJson = '''
[
  {
    "id": "create_capa",
    "type": "open_page",
    "name": "Buat CAPA Baru",
    "layout_form_id": "create_form",
    "permissions": ["capas:create"]
  },
  {
    "id": "approve_capa",
    "type": "http",
    "name": "Approve Evaluasi (SoD)",
    "permissions": ["capas:approve"],
    "rule": {
      "all": [
        { "field": "status", "op": "=", "value": "EVALUATION_APPROVAL" },
        { "field": "prepared_by", "op": "!=", "value": "{{ user.nip }}" }
      ]
    }
  },
  {
    "id": "pic_update",
    "type": "http",
    "name": "Update Tindak Lanjut (PIC Only)",
    "rule": {
      "all": [
        { "field": "pic_nip", "op": "=", "value": "{{ user.nip }}" }
      ]
    }
  },
  {
    "id": "delete_capa",
    "type": "http",
    "name": "Hapus CAPA",
    "permissions": ["capas:delete"]
  }
]
''';

@UseCase(
  name: 'From JSON Config (2-Layer Capabilities & Hierarchical Rules)',
  type: AccessControlShowcase,
  path: '[Access & Rules]',
)
Widget accessControlShowcaseUseCase(BuildContext context) {
  final menuJson = context.knobs.string(
    label: 'menu_group JSON',
    initialValue: _defaultMenuConfigJson,
    maxLines: 12,
  );
  final actionsJson = context.knobs.string(
    label: 'actions JSON',
    initialValue: _defaultActionsJson,
    maxLines: 12,
  );
  final bypass = context.knobs.boolean(
    label: 'access_control.bypass_all_permissions',
    initialValue: false,
  );

  return AccessControlShowcase(
    menuConfigJson: menuJson,
    actionsJson: actionsJson,
    bypassAllPermissions: bypass,
  );
}
