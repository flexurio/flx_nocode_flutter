import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flutter/services.dart';

class _NoopHttpExecutor implements HttpExecutor {
  @override
  Future<HttpResult> execute(HttpData request) async {
    return HttpResult(status: 200, data: {});
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ExportAction Execution Tests', () {
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    const channelMacos =
        MethodChannel('plugins.flutter.io/path_provider_macos');

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return '/mock/path';
      });
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channelMacos,
              (MethodCall methodCall) async {
        return '/mock/path';
      });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channelMacos, null);
    });

    test('ExportAction should handle Map dataSource with "data" key', () async {
      final exportAction = ExportAction(
        format: 'xlsx',
        dataSource: '{{ http.get_users.data }}',
        columns: [
          TColumn(header: 'Name', body: '{{ name }}'),
        ],
        saveResultTo: 'res',
      );

      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      // Simulate HTTP result with a Map wrapper
      ctx.http['get_users'] = HttpResult(
        status: 200,
        data: {
          'success': true,
          'data': [
            {'name': 'User 1'},
            {'name': 'User 2'},
          ],
        },
      );

      await exportAction.execute(ctx, NoopUiBridge());

      expect(ctx.vars['res']['items_count'], 2);
      expect(ctx.vars['res']['status'], 'generated');
    });

    test('ExportAction should handle List dataSource', () async {
      final exportAction = ExportAction(
        format: 'xlsx',
        dataSource: '{{ vars.my_list }}',
        columns: [
          TColumn(header: 'Name', body: '{{ name }}'),
        ],
        saveResultTo: 'res',
      );

      final ctx = WorkflowContext(
        form: {},
        vars: {
          'my_list': [
            {'name': 'Item A'},
            {'name': 'Item B'},
            {'name': 'Item C'},
          ]
        },
        auth: const AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      await exportAction.execute(ctx, NoopUiBridge());

      expect(ctx.vars['res']['items_count'], 3);
      expect(ctx.vars['res']['status'], 'generated');
    });

    test('ExportAction should handle empty dataSource', () async {
      final exportAction = ExportAction(
        format: 'xlsx',
        dataSource: '{{ vars.empty_list }}',
        columns: [
          TColumn(header: 'Name', body: '{{ name }}'),
        ],
        saveResultTo: 'res',
      );

      final ctx = WorkflowContext(
        form: {},
        vars: {'empty_list': []},
        auth: const AuthContext(permissions: []),
        httpExecutor: _NoopHttpExecutor(),
      );

      await exportAction.execute(ctx, NoopUiBridge());

      expect(ctx.vars['res']['items_count'], 0);
      expect(ctx.vars['res']['status'], 'empty');
    });
  });
}
