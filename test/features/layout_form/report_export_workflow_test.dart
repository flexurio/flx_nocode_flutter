import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

class _MockReportHttpExecutor implements HttpExecutor {
  @override
  Future<HttpResult> execute(HttpData request) async {
    if (request.url.contains('/report-work-orders')) {
      return const HttpResult(
        status: 200,
        data: {
          "success": true,
          "message": "Record found",
          "total_data": 2,
          "data": [
            {
              "work_order_id": "0021/02/26/ENG",
              "department_name": "ENGINEERING",
              "title": "AC Gudang Bahan pengemas panas",
              "status": "CLOSE",
            },
            {
              "work_order_id": "0022/02/26/ENG",
              "department_name": "ENGINEERING",
              "title": "AC Office",
              "status": "OPEN",
            },
          ]
        },
      );
    }
    return const HttpResult(status: 404, data: {});
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Report Export Workflow Test', () {
    test('Should fetch work orders and export correctly', () async {
      // 1. Define the workflow JSON
      final workflowJson = {
        'lock_ui_while_submitting': true,
        'actions': [
          {
            'type': 'http',
            'name': 'report_data',
            'http': {
              'method': 'GET',
              'url': '{{backend_host}}/report-work-orders',
              'headers': {},
              'body': {},
            },
          },
          {
            'type': 'export',
            'format': 'xlsx',
            'data_source': '{{http.report_data.data}}',
            'columns': [
              {'header': 'ID', 'body': '{{work_order_id}}'},
              {'header': 'Dept', 'body': '{{department_name}}'},
              {'header': 'Title', 'body': '{{title}}'},
              {'header': 'Status', 'body': '{{status}}'},
            ],
            'save_result_to': 'export_meta',
          },
        ],
      };

      // 2. Setup context
      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockReportHttpExecutor(),
      );

      // 3. Setup definition and executor
      final definition = WorkflowDefinition.fromJson(workflowJson);
      final executor = WorkflowExecutor(definition, ui: NoopUiBridge());

      // 4. Run workflow
      final result = await executor.run(ctx);

      // 5. Assertions
      expect(result.status, WorkflowRunStatus.success);

      // Verify HTTP result was saved
      expect(ctx.http.containsKey('report_data'), isTrue);
      final reportResult = ctx.http['report_data'];
      expect(reportResult?.data, isA<Map>());
      expect((reportResult?.data as Map)['data'], isA<List>());

      // Verify ExportAction step
      expect(ctx.vars.containsKey('export_meta'), isTrue);
      final meta = ctx.vars['export_meta'] as Map<String, dynamic>;
      expect(meta['format'], 'xlsx');
      expect(meta['status'], 'generated');
      expect(meta['items_count'], 2);
    });

    test('Should handle data_source pointing directly to the list', () async {
      final workflowJson = {
        'actions': [
          {
            'type': 'http',
            'name': 'fetch',
            'http': {
              'method': 'GET',
              'url': '{{backend_host}}/report-work-orders',
            },
          },
          {
            'type': 'export',
            'data_source': '{{http.fetch.data.data}}',
            'columns': [
              {'header': 'ID', 'body': '{{work_order_id}}'},
            ],
            'save_result_to': 'meta',
          },
        ],
      };

      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockReportHttpExecutor(),
      );

      final definition = WorkflowDefinition.fromJson(workflowJson);
      final executor = WorkflowExecutor(definition, ui: NoopUiBridge());
      final result = await executor.run(ctx);

      expect(result.status, WorkflowRunStatus.success);
    });

    test('Should handle complex JS expressions with "data" key', () async {
      final workflowJson = {
        'actions': [
          {
            'type': 'http',
            'name': 'fetch',
            'http': {
              'method': 'GET',
              'url': '{{backend_host}}/report-work-orders',
            },
          },
          {
            'type': 'set_var',
            'key': 'items_length',
            'value': '{{ http.fetch.data.data.length }}',
          },
        ],
      };

      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockReportHttpExecutor(),
      );

      final definition = WorkflowDefinition.fromJson(workflowJson);
      final executor = WorkflowExecutor(definition, ui: NoopUiBridge());
      final result = await executor.run(ctx);

      expect(result.status, WorkflowRunStatus.success);
      expect(ctx.vars['items_length'], 2);
    });
  });
}
