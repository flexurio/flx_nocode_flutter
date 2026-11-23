import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/user_context_rules.widgetbook.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

class _NoopHttpExecutor implements HttpExecutor {
  const _NoopHttpExecutor();

  @override
  Future<HttpResult> execute(HttpData request) async {
    return const HttpResult(status: 200, data: {});
  }
}

String _buildTestJwt(Map<String, dynamic> payload) {
  final headerB64 =
      base64Url.encode(utf8.encode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'})));
  final payloadB64 = base64Url.encode(utf8.encode(jsonEncode(payload)));
  return '$headerB64.$payloadB64.signature';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Configuration.instance = Configuration.empty().copyWith(
      backendHost: 'http://localhost:8080',
    );
    UserRepositoryAppNocode.instance = UserRepositoryAppNocode();
  });

  group('UserAppNocode & UserRepositoryAppNocode dynamic JWT claims', () {
    test('preserves all dynamic JWT claims and normalizes comma-separated rl', () {
      final token = _buildTestJwt({
        'id': '101',
        'nm': 'Apt. Budi Santoso',
        'rl': 'plant_qa_manager,plant_auditor/127,*/127',
        'cs': 'EMP-QA-001',
        'nip': 'EMP-QA-001',
        'department_id': 'QA',
        'site_id': 'SITE-CKR',
        'email': 'budi@metiska.co.id',
      });

      UserRepositoryAppNocode.instance.setUserFromJwt(token, const []);
      final user = UserRepositoryAppNocode.instance.userApp!;

      expect(user.id, 101);
      expect(user.rawId, '101');
      expect(user.name, 'Apt. Budi Santoso');
      expect(user.roles, ['plant_qa_manager', 'plant_auditor']);
      expect(user.hasRole('plant_qa_manager'), isTrue);
      expect(user.hasRole('plant_auditor'), isTrue);
      expect(user.hasRole('plant_pic'), isFalse);
      expect(user['nip'], 'EMP-QA-001');
      expect(user['department_id'], 'QA');
      expect(user['site_id'], 'SITE-CKR');
      expect(user['email'], 'budi@metiska.co.id');
    });

    test('supports array roles and unpacks JSON-encoded cs claim dynamically', () {
      final user = UserAppNocode.fromJson({
        'id': 'USR-EXT-99',
        'name': 'Ir. Hendra Wijaya',
        'roles': ['plant_pic', 'plant_production_spv'],
        'cs': '{"nip":"EMP-PROD-004","shift":"A","plant_code":"MF"}',
      });

      expect(user.rawId, 'USR-EXT-99');
      expect(user.roles, ['plant_pic', 'plant_production_spv']);
      expect(user['nip'], 'EMP-PROD-004');
      expect(user['shift'], 'A');
      expect(user['plant_code'], 'MF');
    });

    test('falls back to cs for user.nip when nip claim is not explicitly set', () {
      final user = UserAppNocode.fromJson({
        'id': 55,
        'nm': 'Siti Rahmawati',
        'cs': 'EMP-QA-002',
        'rl': 'plant_qa_officer',
      });

      expect(user['cs'], 'EMP-QA-002');
      expect(user['custom'], 'EMP-QA-002');
      expect(user['nip'], 'EMP-QA-002');
    });
  });

  group('JS Interpolation & URL Interpolation with Dynamic User Claims', () {
    setUp(() {
      UserRepositoryAppNocode.instance.setUserFromClaims(
        {
          'id': 101,
          'nm': 'Apt. Budi Santoso',
          'nip': 'EMP-QA-001',
          'cs': 'EMP-QA-001',
          'rl': 'plant_qa_manager,plant_auditor',
          'department_id': 'QA',
          'site_id': 'SITE-CKR',
        },
        accessToken: 'jwt_tok_123',
      );
    });

    test('interpolates {{ user.<claim> }} via fast shortcut evaluator', () {
      expect('{{ user.id }}'.interpolateJavascript(), '101');
      expect('{{ user.name }}'.interpolateJavascript(), 'Apt. Budi Santoso');
      expect('{{ user.nip }}'.interpolateJavascript(), 'EMP-QA-001');
      expect('{{ user.cs }}'.interpolateJavascript(), 'EMP-QA-001');
      expect('{{ user.department_id }}'.interpolateJavascript(), 'QA');
      expect('{{ user.site_id }}'.interpolateJavascript(), 'SITE-CKR');
      expect('{{ jwt.department_id }}'.interpolateJavascript(), 'QA');
      expect(
        '[[ user.roles ]]'.interpolateJavascript(),
        '["plant_qa_manager","plant_auditor"]',
      );
    });

    test('evaluates boolean expressions and collection helpers with user.*', () {
      final data = {
        'status': 'EVALUATION_APPROVAL',
        'prepared_by': 'EMP-QA-002',
      };

      expect(
        '{{ data.prepared_by != user.nip }}'.evaluateVisibility(data),
        isTrue,
      );
      expect(
        "{{ contains(user.roles, 'plant_qa_manager') }}"
            .evaluateVisibility(data),
        isTrue,
      );
      expect(
        "{{ contains(user.roles, 'plant_pic') }}".evaluateVisibility(data),
        isFalse,
      );
    });

    test('replaces single-brace {user.<claim>} in URL templates', () {
      final url =
          '{backend_host}/plant_capas?pic_nip.eq={user.nip}&dept.eq={user.department_id}'
              .replaceStringWithValues({});
      expect(
        url,
        'http://localhost:8080/plant_capas?pic_nip.eq=EMP-QA-001&dept.eq=QA',
      );
    });

    test('exposes user.<claim> and user.roles in FormSubmitWorkflow Expr', () {
      final ctx = WorkflowContext(
        form: const {'note': 'OK'},
        record: const {'id': 'CAPA/2026/11/001'},
        data: const {'id': 'CAPA/2026/11/001', 'prepared_by': 'EMP-QA-002'},
        auth: const AuthContext(permissions: ['plant_capas_approve']),
        httpExecutor: const _NoopHttpExecutor(),
      );

      expect(Expr.eval('{{ user.nip }}', ctx), 'EMP-QA-001');
      expect(Expr.eval('{{ user.department_id }}', ctx), 'QA');
      expect(
        Expr.eval('{{ user.roles }}', ctx),
        ['plant_qa_manager', 'plant_auditor'],
      );
      expect(
        Expr.evalCondition(
          "{{ data.prepared_by != user.nip && contains(user.roles, 'plant_qa_manager') }}",
          ctx,
        ),
        isTrue,
      );
    });
  });

  group('Declarative Rule Engine with Dynamic User Context (SoD & ABAC)', () {
    setUp(() {
      UserRepositoryAppNocode.instance.setUserFromClaims({
        'id': 101,
        'nm': 'Apt. Budi Santoso',
        'nip': 'EMP-QA-001',
        'cs': 'EMP-QA-001',
        'rl': 'plant_qa_manager,plant_auditor',
        'department_id': 'QA',
      });
    });

    test('evaluates declarative SoD and role rules natively without JS functions', () {
      final rule = Rule.fromMap({
        'all': [
          {'field': 'status', 'op': '=', 'value': 'EVALUATION_APPROVAL'},
          {'field': 'prepared_by', 'op': '!=', 'value': '{{ user.nip }}'},
          {'field': 'user.roles', 'op': 'contains', 'value': 'plant_qa_manager'},
        ],
      });

      // Case 1: Prepared by another user (EMP-QA-002) -> Allowed
      expect(
        rule.evaluate({
          'status': 'EVALUATION_APPROVAL',
          'prepared_by': 'EMP-QA-002',
        }),
        isTrue,
      );

      // Case 2: Prepared by the same user (EMP-QA-001) -> Blocked by SoD
      expect(
        rule.evaluate({
          'status': 'EVALUATION_APPROVAL',
          'prepared_by': 'EMP-QA-001',
        }),
        isFalse,
      );

      // Case 3: User does not have required role -> Blocked
      UserRepositoryAppNocode.instance.setUserFromClaims({
        'id': 103,
        'nm': 'Ir. Hendra Wijaya',
        'nip': 'EMP-PROD-004',
        'rl': 'plant_pic',
      });
      expect(
        rule.evaluate({
          'status': 'EVALUATION_APPROVAL',
          'prepared_by': 'EMP-QA-002',
        }),
        isFalse,
      );
    });

    test('supports {{ user.roles }} template syntax with contains and in operators', () {
      final ruleContains = Rule.fromMap({
        'all': [
          {
            'field': '{{ user.roles }}',
            'op': 'contains',
            'value': 'plant_auditor',
          },
          {
            'field': '{{ user.department_id }}',
            'op': 'in',
            'value': ['QA', 'QC'],
          },
        ],
      });

      expect(ruleContains.evaluate(const {}), isTrue);
    });

    test('also remains backward-compatible with JS boolean expressions in Rule', () {
      final jsRule = Rule.fromMap({
        'all': [
          {
            'field': "{{ data.status == 'EVALUATION_APPROVAL' }}",
            'op': '=',
            'value': true,
          },
          {
            'field': '{{ data.prepared_by != user.nip }}',
            'op': '=',
            'value': true,
          },
          {
            'field': "{{ contains(user.roles, 'plant_qa_manager') }}",
            'op': '=',
            'value': true,
          },
        ],
      });

      expect(
        jsRule.evaluate({
          'status': 'EVALUATION_APPROVAL',
          'prepared_by': 'EMP-QA-002',
        }),
        isTrue,
      );
      expect(
        jsRule.evaluate({
          'status': 'EVALUATION_APPROVAL',
          'prepared_by': 'EMP-QA-001',
        }),
        isFalse,
      );
    });
  });

  group('UserContextRulesShowcase Widgetbook test', () {
    testWidgets('renders JSON-based showcase and switches JWT personas interactively',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => UserContextRulesShowcase(
              entityJson: jsonEncode({
                'id': 'capa_demo',
                'label': 'CAPA Demo',
                'description': 'Test',
                'backend': {'others': []},
                'layout_table': {},
                'fields': [
                  {'reference': 'code', 'label': 'Code', 'type': 'text'},
                  {'reference': 'status', 'label': 'Status', 'type': 'text'},
                  {
                    'reference': 'prepared_by',
                    'label': 'Prepared By',
                    'type': 'text',
                  },
                ],
                'actions': [
                  {
                    'id': 'approve',
                    'name': 'Approve CAPA',
                    'type': 'show_confirmation_dialog',
                    'rule': {
                      'all': [
                        {
                          'field': 'status',
                          'op': '=',
                          'value': 'EVALUATION_APPROVAL',
                        },
                        {
                          'field': 'prepared_by',
                          'op': '!=',
                          'value': '{{ user.nip }}',
                        },
                        {
                          'field': 'user.roles',
                          'op': 'contains',
                          'value': 'plant_qa_manager',
                        },
                      ],
                    },
                  },
                ],
                'layout_form': [],
              }),
              initialJwtClaimsJson: jsonEncode({
                'id': 101,
                'nm': 'Apt. Budi Santoso, S.Farm',
                'nip': 'EMP-QA-001',
                'rl': 'plant_qa_manager',
              }),
              sampleRows: const [
                {
                  'code': 'CAPA-001',
                  'status': 'EVALUATION_APPROVAL',
                  'prepared_by': 'EMP-QA-002',
                  'pic_nip': 'EMP-PROD-004',
                  'department_id': 'QA',
                },
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Initially logged in as QA Manager (EMP-QA-001), viewing CAPA-001 prepared by EMP-QA-002 -> VISIBLE
      expect(find.text('VISIBLE'), findsOneWidget);

      // Tap persona chip for QA Officer Siti (EMP-QA-002, who prepared CAPA-001)
      await tester.tap(
        find.text('QA Officer / Penyusun (NIP: EMP-QA-002 — Siti)'),
      );
      await tester.pumpAndSettle();

      // Action should now be HIDDEN due to SoD & role check
      expect(find.text('HIDDEN'), findsOneWidget);
    });
  });
}
