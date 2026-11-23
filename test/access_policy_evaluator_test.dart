import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/core/access/access_control.widgetbook.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_view/widget/delete_button.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_create_button_old.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

class _MockDioAdapter implements HttpClientAdapter {
  _MockDioAdapter(this._handler);

  final ResponseBody Function(RequestOptions options) _handler;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return _handler(options);
  }
}

void main() {
  setUp(() {
    UserRepositoryAppNocode.instance.unset();
  });

  tearDown(() {
    UserRepositoryAppNocode.instance.unset();
  });

  group('AccessControlConfig & Configuration.fromJson', () {
    test('defaults to secure-by-default (bypassAllPermissions = false)', () {
      final config = Configuration.fromJson({
        'backend_host': 'https://api.plant-cpob.local',
        'app_name': 'Plant CPOB',
        'logo_url': 'https://example.com/logo.png',
        'logo_named_url': 'https://example.com/logo_named.png',
        'company': {
          'id': 'c1',
          'name': 'Plant',
          'phone': '021',
          'website': 'https://plant.local',
          'address': 'Cikarang',
        },
        'theme': {'color': '#1976D2', 'color_soft': '#E3F2FD'},
        'menu_group': [],
      });

      expect(config.accessControl.bypassAllPermissions, isFalse);
      expect(config.accessControl.autoCheckEntityRead, isTrue);
      expect(config.accessControl.defaultAllowWhenUnrestricted, isTrue);
      expect(config.accessControl.capabilitiesEndpoint, isNull);
    });

    test('parses explicit access_control block and legacy bypass fallback', () {
      final config = Configuration.fromJson({
        'backend_host': 'https://api.plant-cpob.local',
        'app_name': 'Plant CPOB',
        'logo_url': 'https://example.com/logo.png',
        'logo_named_url': 'https://example.com/logo_named.png',
        'company': {
          'id': 'c1',
          'name': 'Plant',
          'phone': '021',
          'website': 'https://plant.local',
          'address': 'Cikarang',
        },
        'theme': {'color': '#1976D2', 'color_soft': '#E3F2FD'},
        'menu_group': [],
        'access_control': {
          'bypass_all_permissions': false,
          'capabilities_endpoint': '{{backend_host}}/auth/capabilities',
          'auto_check_entity_read': true,
        },
      });

      expect(config.accessControl.bypassAllPermissions, isFalse);
      expect(
        config.accessControl.capabilitiesEndpoint,
        '{{backend_host}}/auth/capabilities',
      );
      expect(config.accessControl.autoCheckEntityRead, isTrue);
    });
  });

  group('Layer 1: Server-Driven Capabilities (Single Source of Truth)', () {
    test('normalizes flat lists, comma strings, structured maps, and envelopes', () {
      expect(
        AccessPolicyEvaluator.normalizeCapabilities(
          ['capas:read', 'capas_create'],
        ),
        containsAll(['capas:read', 'capas_create']),
      );

      expect(
        AccessPolicyEvaluator.normalizeCapabilities('capas:read, capas:approve'),
        containsAll(['capas:read', 'capas:approve']),
      );

      expect(
        AccessPolicyEvaluator.normalizeCapabilities({
          'data': {
            'capabilities': {
              'capas': ['read', 'create'],
              'capa_categories': {'read': true, 'delete': false},
            },
          },
        }),
        containsAll(['capas:read', 'capas:create', 'capa_categories:read']),
      );
    });

    test('matches canonical : vs _ separators and wildcards (* and entity:*)', () {
      final repo = UserRepositoryAppNocode();
      repo.setUserFromClaims(
        {'id': 1, 'nm': 'QA', 'rl': 'plant_qa_manager'},
        capabilities: ['capas:read', 'deviations_*'],
      );
      final evaluator = AccessPolicyEvaluator(
        userRepository: repo,
        config: const AccessControlConfig(),
      );

      expect(evaluator.hasCapability('capas:read'), isTrue);
      expect(evaluator.hasCapability('capas_read'), isTrue);
      expect(evaluator.hasEntityCapability('capas', 'read'), isTrue);
      expect(evaluator.hasEntityCapability('capas', 'delete'), isFalse);
      expect(evaluator.hasEntityCapability('deviations', 'approve'), isTrue);

      repo.setCapabilities(['*']);
      expect(evaluator.hasEntityCapability('anything', 'delete'), isTrue);
    });

    test('auto-extracts capabilities embedded directly in JWT claims', () {
      final repo = UserRepositoryAppNocode();
      repo.setUserFromClaims({
        'id': 10,
        'nm': 'Siti',
        'rl': 'plant_qa_officer',
        'capabilities': ['capas:read', 'capas:create'],
      });

      expect(repo.hasCapabilitiesLoaded, isTrue);
      expect(repo.effectiveCapabilities, containsAll(['capas:read', 'capas:create']));
      expect(repo.userContext['capabilities'], containsAll(['capas:read', 'capas:create']));
    });

    test('automatically filters MenuSub by <entity>:read without roles in config & prunes empty parents', () {
      final repo = UserRepositoryAppNocode();
      repo.setUserFromClaims(
        {'id': 2, 'nm': 'QA Officer', 'rl': 'plant_qa_officer'},
        capabilities: {
          'capas': ['read', 'create'],
        },
      );

      final groups = [
        MenuGroup(
          label: 'Quality Assurance',
          menu: [
            Menu(
              label: 'CAPA',
              icon: 'list',
              menuSub: [
                MenuSub(label: 'Daftar CAPA', entity: 'capas'),
                MenuSub(label: 'Master Kategori CAPA', entity: 'capa_categories'),
              ],
            ),
            Menu(
              label: 'Penyimpangan',
              icon: 'warning',
              menuSub: [
                MenuSub(label: 'Daftar Penyimpangan', entity: 'deviations'),
              ],
            ),
          ],
        ),
        MenuGroup(
          label: 'Admin',
          menu: [
            Menu(
              label: 'User Management',
              icon: 'users',
              menuSub: [
                MenuSub(label: 'Users', entity: 'flx_users'),
              ],
            ),
          ],
        ),
      ];

      final evaluator = AccessPolicyEvaluator(
        userRepository: repo,
        config: const AccessControlConfig(autoCheckEntityRead: true),
      );
      final visible = evaluator.filterMenuGroups(groups);

      expect(visible, hasLength(1));
      expect(visible.first.label, 'Quality Assurance');
      expect(visible.first.menu, hasLength(1));
      expect(visible.first.menu.first.label, 'CAPA');
      expect(visible.first.menu.first.menuSub, hasLength(1));
      expect(visible.first.menu.first.menuSub.first.entity, 'capas');
    });

    test('explicit empty backend capability list denies access (fail-closed)', () {
      final repo = UserRepositoryAppNocode();
      repo.setUserFromClaims({'id': 9, 'nm': 'Guest', 'rl': 'guest'});
      repo.setCapabilities(const <String>[]);

      expect(repo.hasCapabilitiesLoaded, isTrue);

      final evaluator = AccessPolicyEvaluator(
        userRepository: repo,
        config: const AccessControlConfig(autoCheckEntityRead: true),
      );
      final groups = [
        MenuGroup(
          label: 'QA',
          menu: [
            Menu(
              label: 'CAPA',
              icon: 'list',
              menuSub: [MenuSub(label: 'CAPA', entity: 'capas')],
            ),
          ],
        ),
      ];

      expect(evaluator.filterMenuGroups(groups), isEmpty);
    });
  });

  group('Layer 2: Declarative Hierarchical Rule (ABAC / RBAC) & Actions', () {
    test('enforces hierarchical MenuGroup -> Menu -> MenuSub rules', () {
      UserRepositoryAppNocode.instance.setUserFromClaims({
        'id': 102,
        'nm': 'Siti',
        'nip': 'EMP-QA-002',
        'rl': 'plant_qa_officer',
        'site_id': 'SITE-BDG',
      });

      final groups = [
        MenuGroup.fromJson({
          'label': 'QA',
          'rule': {
            'all': [
              {'field': 'user.site_id', 'op': '=', 'value': 'SITE-CKR'},
            ],
          },
          'menu': [
            {
              'label': 'CAPA',
              'icon': 'list',
              'menu_sub': [
                {'label': 'CAPA', 'entity': 'capas'},
              ],
            },
          ],
        }),
        MenuGroup.fromJson({
          'label': 'Operations',
          'menu': [
            {
              'label': 'General',
              'icon': 'list',
              'menu_sub': [
                {
                  'label': 'Dashboard QA',
                  'entity': 'qa_dashboard',
                  'rule': {
                    'all': [
                      {
                        'field': 'user.roles',
                        'op': 'contains',
                        'value': 'plant_qa_officer',
                      },
                    ],
                  },
                },
                {
                  'label': 'Manager Only',
                  'entity': 'qa_mgr',
                  'rule': {
                    'all': [
                      {
                        'field': 'user.roles',
                        'op': 'contains',
                        'value': 'plant_qa_manager',
                      },
                    ],
                  },
                },
              ],
            },
          ],
        }),
      ];

      final evaluator = AccessPolicyEvaluator(
        userRepository: UserRepositoryAppNocode.instance,
        config: const AccessControlConfig(),
      );
      final filtered = evaluator.filterMenuGroups(groups);

      expect(filtered, hasLength(1));
      expect(filtered.first.label, 'Operations');
      expect(filtered.first.menu.first.menuSub.map((e) => e.entity), [
        'qa_dashboard',
      ]);
    });

    test('ActionD evaluates both explicit permissions (Layer 1) and SoD rule (Layer 2)', () {
      UserRepositoryAppNocode.instance.setUserFromClaims(
        {
          'id': 101,
          'nm': 'Budi',
          'nip': 'EMP-QA-001',
          'rl': 'plant_qa_manager',
        },
        capabilities: ['capas:read', 'capas:approve'],
      );

      final approveAction = ActionD.fromJson({
        'id': 'approve_capa',
        'type': 'http',
        'name': 'Approve',
        'permissions': ['capas:approve'],
        'rule': {
          'all': [
            {'field': 'status', 'op': '=', 'value': 'EVALUATION_APPROVAL'},
            {'field': 'prepared_by', 'op': '!=', 'value': '{{ user.nip }}'},
          ],
        },
      });

      final unrestrictedAction = ActionD.fromJson({
        'id': 'view_detail',
        'type': 'http',
        'name': 'Detail',
      });

      final entity = EntityCustom.empty().copyWith(
        id: 'capas',
        label: 'CAPA',
      );

      // Valid approver (different NIP from prepared_by) -> visible
      expect(
        approveAction.isVisibleFor(
          {'status': 'EVALUATION_APPROVAL', 'prepared_by': 'EMP-QA-002'},
          entity: entity,
          bypassPermission: false,
        ),
        isTrue,
      );

      // SoD violation (prepared_by == user.nip) -> hidden even with bypassPermission: true
      expect(
        approveAction.isVisibleFor(
          {'status': 'EVALUATION_APPROVAL', 'prepared_by': 'EMP-QA-001'},
          entity: entity,
          bypassPermission: true,
        ),
        isFalse,
      );

      // Action without explicit permission remains visible when bypassPermission: false
      expect(
        unrestrictedAction.isVisibleFor(
          {'status': 'DRAFT'},
          entity: entity,
          bypassPermission: false,
        ),
        isTrue,
      );
    });
  });

  group('CapabilitiesService.syncFromBackend', () {
    test('fetches capabilities from backend endpoint with Bearer token and resolves {{backend_host}}', () async {
      Configuration.instance = Configuration.empty().copyWith(
        backendHost: 'https://api.plant.local',
      );
      final repo = UserRepositoryAppNocode();
      repo.setUserFromClaims(
        {'id': 101, 'nm': 'Budi', 'rl': 'plant_qa_manager'},
        accessToken: 'jwt-test-token',
      );

      String? capturedAuth;
      String? capturedUrl;
      final dio = Dio()
        ..httpClientAdapter = _MockDioAdapter((options) {
          capturedAuth = options.headers['Authorization']?.toString();
          capturedUrl = options.uri.toString();
          return ResponseBody.fromString(
            jsonEncode({
              'data': {
                'capabilities': {
                  'capas': ['read', 'create', 'approve'],
                },
              },
            }),
            200,
            headers: {
              Headers.contentTypeHeader: ['application/json'],
            },
          );
        });

      final result = await CapabilitiesService.instance.syncFromBackend(
        config: const AccessControlConfig(
          capabilitiesEndpoint: '{{backend_host}}/auth/capabilities',
        ),
        userRepository: repo,
        dio: dio,
      );

      expect(capturedUrl, 'https://api.plant.local/auth/capabilities');
      expect(capturedAuth, 'Bearer jwt-test-token');
      expect(result, containsAll(['capas:read', 'capas:create', 'capas:approve']));
      expect(repo.hasCapabilitiesLoaded, isTrue);
      expect(repo.effectiveCapabilities, contains('capas:approve'));
    });
  });

  group('Widget tests: Built-in buttons & Widgetbook Showcase', () {
    testWidgets('EntityDeleteButton & EntityCreateButtonOld gate synchronously via capabilities', (tester) async {
      final entity = EntityCustom.empty().copyWith(
        id: 'capas',
        label: 'CAPA',
      );
      final form = LayoutForm(id: 'create', label: 'Create', components: const []);

      // User has ONLY capas:read (no create/delete)
      UserRepositoryAppNocode.instance.setUserFromClaims(
        {'id': 103, 'nm': 'PIC', 'rl': 'plant_pic'},
        capabilities: ['capas:read'],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                EntityDeleteButton.prepare(
                  entity: entity,
                  data: const {},
                  onSuccess: () {},
                  bypassPermission: false,
                ),
                EntityCreateButtonOld(
                  entity: entity,
                  onSuccess: () {},
                  embedded: false,
                  filters: const {},
                  bypassPermission: false,
                  layoutForm: form,
                  parentData: const [],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(ElevatedButton), findsNothing);

      // Grant capas:create & capas:delete -> buttons appear synchronously!
      UserRepositoryAppNocode.instance.setCapabilities([
        'capas:read',
        'capas:create',
        'capas:delete',
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                EntityDeleteButton.prepare(
                  entity: entity,
                  data: const {},
                  onSuccess: () {},
                  bypassPermission: false,
                ),
                EntityCreateButtonOld(
                  entity: entity,
                  onSuccess: () {},
                  embedded: false,
                  filters: const {},
                  bypassPermission: false,
                  layoutForm: form,
                  parentData: const [],
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('AccessControlShowcase updates filtered menus & actions on persona switch', (tester) async {
      tester.view.physicalSize = const Size(1280, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      const menuJson = '''
[
  {
    "label": "Quality Assurance",
    "menu": [
      {
        "label": "CAPA & Deviation",
        "icon": "list",
        "menu_sub": [
          { "label": "CAPA", "entity": "capas" },
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
      const actionsJson = '''
[
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
  }
]
''';

      await tester.pumpWidget(
        const MaterialApp(
          home: AccessControlShowcase(
            menuConfigJson: menuJson,
            actionsJson: actionsJson,
          ),
        ),
      );

      // Default persona: QA Manager -> sees CAPA, Master Kategori CAPA, Log Audit CPOB, and Approve VISIBLE
      expect(find.text('CAPA (capas)'), findsOneWidget);
      expect(find.text('Master Kategori CAPA (capa_categories)'), findsOneWidget);
      expect(find.text('Log Audit CPOB (audit_logs)'), findsOneWidget);
      expect(find.text('VISIBLE'), findsOneWidget);

      // Switch to PIC Produksi -> only CAPA (capas) visible; Audit & Master Kategori pruned; Approve HIDDEN
      await tester.tap(find.text('PIC Produksi (SITE-CKR — Hendra)'));
      await tester.pumpAndSettle();

      expect(find.text('CAPA (capas)'), findsOneWidget);
      expect(find.text('Master Kategori CAPA (capa_categories)'), findsNothing);
      expect(find.text('Log Audit CPOB (audit_logs)'), findsNothing);
      expect(find.text('HIDDEN'), findsOneWidget);
    });
  });
}
