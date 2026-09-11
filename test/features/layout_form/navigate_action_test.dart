import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/submit_workflow/workflow_action.dart'
    as model;
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('NavigateAction Tests', () {
    test('NavigateAction.fromJson should parse entity_id and params', () {
      final json = {
        'type': 'navigate',
        'entity_id': 'lbb_expense_transaction_headers',
        'params': {
          'id': '{{ http.request.data.id }}',
          'period': '{{ form.period }}',
        },
      };

      final action = NavigateAction.fromJson(json);

      expect(action.entityId, 'lbb_expense_transaction_headers');
      expect(action.params['id'], '{{ http.request.data.id }}');
      expect(action.params['period'], '{{ form.period }}');
    });

    test('ActionD.fromJson should parse confirm_action correctly', () {
      final json = {
        'id': 'Create_Transaction',
        'type': 'open_page',
        'name': 'Transaction',
        'layout_form_id': 'create general',
        'on_success': 'show_success_dialog_with_data',
        'success_title': 'Success',
        'success_message': 'The transaction submission has been created!\nWith ID : {{data.id}}',
        'copy_label': 'Copy ID',
        'copy_value': '{{data.id}}',
        'confirm_action': {
          'type': 'navigate',
          'entity_id': 'lbb_expense_transaction_details',
          'params': {
            'lbb_expense_transaction_header_id': '{{data.id}}',
            'period': '{{ (data.period || "").replaceAll("/", "") }}',
          },
        },
      };

      final action = ActionD.fromJson(json);
      expect(action.confirmAction, isNotNull);
      expect(action.confirmAction?['type'], 'navigate');
      expect(action.confirmAction?['entity_id'],
          'lbb_expense_transaction_details');
      expect(action.confirmAction?['params']['lbb_expense_transaction_header_id'],
          '{{data.id}}');
    });

    test('NavigateAction.fromJson should handle missing params gracefully', () {
      final json = {
        'type': 'navigate',
        'entity_id': 'some_entity',
      };

      final action = NavigateAction.fromJson(json);

      expect(action.entityId, 'some_entity');
      expect(action.params, isEmpty);
    });

    test('model.WorkflowAction.fromMap should parse navigate action correctly', () {
      final map = {
        'type': 'navigate',
        'entity_id': 'lbb_expense_transaction_details',
        'params': {
          'lbb_expense_transaction_header_id': '{{ http.request.data.id }}',
          'period': '{{ (http.request.data.period || "").replaceAll("/", "") }}',
        },
      };

      final action = model.WorkflowAction.fromMap(map);
      expect(action.type, 'navigate');
      expect(action.toMap()['entity_id'], 'lbb_expense_transaction_details');
    });

    test('LayoutForm.fromMap should parse submit_workflow with navigate action', () {
      final layoutMap = {
        'id': 'form_create_header',
        'label': 'Create Header',
        'components': [],
        'submit_workflow': {
          'type': 'workflow',
          'actions': [
            {
              'type': 'http',
              'name': 'request',
              'http': {
                'method': 'POST',
                'url': 'http://example.com',
              },
            },
          ],
          'on_success': [
            {
              'type': 'navigate',
              'entity_id': 'lbb_expense_transaction_details',
              'params': {
                'lbb_expense_transaction_header_id': '{{ http.request.data.id }}',
                'period': '{{ (http.request.data.period || "").replaceAll("/", "") }}',
              },
            },
          ],
        },
      };

      final layout = LayoutForm.fromMap(layoutMap);
      expect(layout.submitWorkflow, isNotNull);
      expect(layout.submitWorkflow!.onSuccess.first.type, 'navigate');
    });

    test(
        'NavigateAction.execute should call ui.navigate with resolved entity_id and params',
        () async {
      String? capturedEntityId;
      Map<String, dynamic>? capturedParams;

      final bridge = _MockUiBridge(
        onNavigate: (entityId, params) {
          capturedEntityId = entityId;
          capturedParams = params;
        },
      );

      final action = NavigateAction(
        entityId: 'lbb_expense_transaction_headers',
        params: {'id': 'TXN-001', 'label': 'Test Transaction'},
      );

      final ctx = WorkflowContext(
        form: {},
        auth: AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      await action.execute(ctx, bridge);

      expect(capturedEntityId, 'lbb_expense_transaction_headers');
      expect(capturedParams?['id'], 'TXN-001');
      expect(capturedParams?['label'], 'Test Transaction');
    });

    test(
        'NavigateAction.execute should resolve template expressions in entity_id and params',
        () async {
      String? capturedEntityId;
      Map<String, dynamic>? capturedParams;

      final bridge = _MockUiBridge(
        onNavigate: (entityId, params) {
          capturedEntityId = entityId;
          capturedParams = params;
        },
      );

      final action = NavigateAction(
        entityId: '{{ vars.target_entity }}',
        params: {'id': '{{ form.transaction_id }}'},
      );

      final ctx = WorkflowContext(
        form: {'transaction_id': 'TXN-999'},
        auth: AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
        vars: {'target_entity': 'lbb_expense_transaction_details'},
      );

      await action.execute(ctx, bridge);

      expect(capturedEntityId, 'lbb_expense_transaction_details');
      expect(capturedParams?['id'], 'TXN-999');
    });

    test('NoopUiBridge.navigate should be a no-op (does not throw)', () async {
      final bridge = NoopUiBridge();
      await bridge.navigate('any_entity', {'id': '1'});
      // No assertion needed — just verifying no exception is thrown.
    });

    test(
        'NavigateAction should resolve http.request.data.id and period.replace',
        () async {
      String? capturedEntityId;
      Map<String, dynamic>? capturedParams;

      final bridge = _MockUiBridge(
        onNavigate: (entityId, params) {
          capturedEntityId = entityId;
          capturedParams = params;
        },
      );

      final action = NavigateAction(
        entityId: 'lbb_expense_transaction_details',
        params: {
          'lbb_expense_transaction_header_id': '{{ http.request.data.id }}',
          'period': '{{ (http.request.data.period || "").replaceAll("/", "") }}',
        },
      );

      final ctx = WorkflowContext(
        form: {},
        auth: AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );
      ctx.http['request'] = const HttpResult(
        status: 200,
        data: {
          'id': 'EVENT/2026/08/003',
          'period': '2026/08',
        },
      );

      await action.execute(ctx, bridge);

      expect(capturedEntityId, 'lbb_expense_transaction_details');
      expect(capturedParams?['lbb_expense_transaction_header_id'],
          'EVENT/2026/08/003');
      expect(capturedParams?['period'], '202608');
    });
  });
}

/// ============================================================================
/// Test helpers
/// ============================================================================
class _MockUiBridge implements UiBridge {
  final void Function(String entityId, Map<String, dynamic> params)? onNavigate;

  _MockUiBridge({this.onNavigate});

  @override
  Future<void> toast(String variant, String message) async {}
  @override
  Future<void> closeModal() async {}
  @override
  Future<void> refresh(String target) async {}
  @override
  Future<void> navigate(String entityId, Map<String, dynamic> params) async {
    onNavigate?.call(entityId, params);
  }
  @override
  void log(String message) {}
}

class _NoopHttpExecutor implements HttpExecutor {
  @override
  Future<HttpResult> execute(dynamic request) async =>
      const HttpResult(status: 200, data: null);
}
