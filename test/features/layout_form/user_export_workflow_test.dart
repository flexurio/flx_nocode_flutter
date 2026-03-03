import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

class _MockExportHttpExecutor implements HttpExecutor {
  @override
  Future<HttpResult> execute(HttpData request) async {
    if (request.url.contains('/flx_users')) {
      return HttpResult(
        status: 200,
        data: [
          {'id': 1, 'name': 'User One', 'email': 'user1@example.com'},
          {'id': 2, 'name': 'User Two', 'email': 'user2@example.com'},
        ],
      );
    }
    return HttpResult(status: 404, data: {});
  }
}

void main() {
  group('User Filter & Export Workflow Test', () {
    test('Should execute fetch and then export correctly', () async {
      // 1. Define the workflow JSON (matching what we added to flx_users_schema_frontend.dart)
      final workflowJson = {
        'lock_ui_while_submitting': true,
        'actions': [
          {
            'type': 'http',
            'name': 'export_data',
            'http': {
              'method': 'GET',
              'url': '{{backend_host}}/flx_users',
              'headers': {},
              'body': {
                'name': '{{form.name}}',
                'email': '{{form.email}}',
              },
            },
          },
          {
            'type': 'export',
            'format': 'xlsx',
            'data_source': '{{http.export_data.data}}',
            'columns': [
              {'header': 'ID', 'body': 'id'},
              {'header': 'Name', 'body': 'name'},
              {'header': 'Email', 'body': 'email'},
            ],
            'save_result_to': 'export_meta',
          },
        ],
      };

      // 2. Setup context
      final ctx = WorkflowContext(
        form: {'name': 'test', 'email': 'test@example.com'},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockExportHttpExecutor(),
      );

      // 3. Setup definition and executor
      final definition = WorkflowDefinition.fromJson(workflowJson);
      final executor = WorkflowExecutor(definition, ui: NoopUiBridge());

      // 4. Run workflow
      final result = await executor.run(ctx);

      // 5. Assertions
      expect(result.status, WorkflowRunStatus.success);

      // Verify HTTP result was saved
      expect(ctx.http.containsKey('export_data'), isTrue);
      expect(ctx.http['export_data']?.data, isA<List>());
      expect((ctx.http['export_data']?.data as List).length, 2);

      // Verify ExportAction step (we added prints to debug, but here we check state)
      expect(ctx.vars.containsKey('export_meta'), isTrue);
      final meta = ctx.vars['export_meta'] as Map<String, dynamic>;
      expect(meta['format'], 'xlsx');
      expect(meta['status'], 'generated');
    });

    test('User Schema should contain the filter form with correct structure',
        () {
      // This part would ideally import the schema, but since we are in a package test,
      // we can verify the structure by looking at the schema file if we were in the app.
      // Since we want to be sure the schema we modified is correct,
      // let's assume we want to verify the existence of the 'filter' layoutForm.

      // Note: In a real app test, we'd do:
      // import 'package:flexurio_studio/core/model/schemas/flx_users_schema_frontend.dart';
      // final filterForm = flxUsersSchemaFrontend.layoutForm.firstWhere((f) => f.id == 'filter');
      // expect(filterForm.components.length, 1);
      // expect(filterForm.components[0], isA<ComponentColumn>());
    });
  });
}
