import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

class _NoopHttpExecutor implements HttpExecutor {
  @override
  Future<HttpResult> execute(HttpData request) async {
    return HttpResult(status: 200, data: {});
  }
}

void main() {
  group('ExportAction Workflow Tests', () {
    test('ActionFactory should parse "export" action correctly', () {
      final json = {
        'type': 'export',
        'format': 'csv',
        'save_result_to': 'export_res',
        'columns': [
          {'header': 'ID', 'body': 'id'}
        ]
      };

      final action = ActionFactory.fromJson(json);

      expect(action, isA<ExportAction>());
      if (action is ExportAction) {
        expect(action.format, 'csv');
        expect(action.saveResultTo, 'export_res');
        expect(action.columns.length, 1);
        expect(action.columns[0].header, 'ID');
      }
    });

    test('ActionFactory should use default format "xlsx" if not provided', () {
      final json = {
        'type': 'export',
        'saveResultTo': 'another_res',
      };

      final action = ActionFactory.fromJson(json);

      expect(action, isA<ExportAction>());
      if (action is ExportAction) {
        expect(action.format, 'xlsx');
        expect(action.saveResultTo, 'another_res');
        expect(action.columns.length, 0);
      }
    });

    test('ExportAction execute should set status in ctx.vars', () async {
      final exportAction = ExportAction(
        format: 'pdf',
        columns: [
          TColumn(header: 'Col 1', body: 'Column 1'),
          TColumn(header: 'Col 2', body: 'Column 2'),
        ],
        saveResultTo: 'my_export',
      );

      final ctx = WorkflowContext(
        form: {},
        auth: AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      await exportAction.execute(ctx, NoopUiBridge());

      // Verify that the result was saved to the specified variable
      expect(ctx.vars.containsKey('my_export'), isTrue);

      final result = ctx.vars['my_export'] as Map<String, dynamic>;
      expect(result['format'], 'pdf');
      expect(result['columns'], 2);
      expect(result['status'], 'generated');
    });

    test('ExportAction execute should not fail if saveResultTo is null',
        () async {
      final exportAction = ExportAction(
        format: 'xlsx',
        columns: [],
      );

      final ctx = WorkflowContext(
        form: {},
        auth: AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      // Should run without throwing errors
      await exportAction.execute(ctx, NoopUiBridge());
    });
  });
}
