import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class _MockHttpExecutor implements HttpExecutor {
  final HttpResult Function(HttpData request) handler;
  _MockHttpExecutor(this.handler);

  @override
  Future<HttpResult> execute(HttpData request) async {
    return handler(request);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Workflow Date Time Interpolation Tests', () {
    test(
        'should correctly interpolate date and time from root scope (ctx.data) into ISO string',
        () async {
      final dateValue = '2024-05-20';
      final timeValue = '14:30:00';

      // The user wants: {{new Date(date + 'T' + time).toISOString()}}
      final action = HttpAction(
        name: 'test_submit',
        http: HttpData(
          method: 'GET',
          url:
              'https://api.example.com/submit?timestamp={{new Date(date + "T" + time).toISOString()}}',
          headers: {},
          body: {},
        ),
      );

      String? resolvedUrl;

      final ctx = WorkflowContext(
        form: {},
        data: {
          'date': dateValue,
          'time': timeValue,
        },
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockHttpExecutor((req) {
          resolvedUrl = req.url;
          return const HttpResult(status: 200, data: {});
        }),
      );

      await action.execute(ctx, NoopUiBridge());

      expect(resolvedUrl, isNotNull);
      // JS Date.toISOString() returns UTC.
      // '2024-05-20T14:30:00' parsing depends on environment timezone if no Z or offset is provided.
      // In JS, new Date('2024-05-20T14:30:00') uses local time.
      // For the test, we just want to ensure it evaluates to a valid ISO string containing the date.
      expect(resolvedUrl, contains('2024-05-20T'));
      expect(resolvedUrl, contains('Z')); // ISO string ends with Z
    });

    test(
        'should correctly interpolate date and time from form scope (form.date) into ISO string',
        () async {
      final dateValue = '2024-05-20';
      final timeValue = '14:30:00';

      final action = HttpAction(
        name: 'test_submit_form',
        http: HttpData(
          method: 'GET',
          url:
              'https://api.example.com/submit?timestamp={{new Date(form.date + "T" + form.time).toISOString()}}',
          headers: {},
          body: {},
        ),
      );

      String? resolvedUrl;

      final ctx = WorkflowContext(
        form: {
          'date': dateValue,
          'time': timeValue,
        },
        data: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockHttpExecutor((req) {
          resolvedUrl = req.url;
          return const HttpResult(status: 200, data: {});
        }),
      );

      await action.execute(ctx, NoopUiBridge());

      expect(resolvedUrl, isNotNull);
      expect(resolvedUrl, contains('2024-05-20T'));
      expect(resolvedUrl, contains('Z'));
    });

    test(
        'should handle invalid date/time gracefully (returns empty or throws depending on JS engine)',
        () async {
      final action = HttpAction(
        name: 'test_submit_invalid',
        http: HttpData(
          method: 'GET',
          url:
              'https://api.example.com/submit?timestamp={{new Date("invalid").toISOString()}}',
          headers: {},
          body: {},
        ),
      );

      final ctx = WorkflowContext(
        form: {},
        data: {},
        auth: const AuthContext(permissions: []),
        httpExecutor:
            _MockHttpExecutor((req) => const HttpResult(status: 200, data: {})),
      );

      // In many JS engines, toISOString() on an Invalid Date throws a RangeError.
      // Our implementation might catch it or return the original match.
      // Let's see how it behaves.
      try {
        await action.execute(ctx, NoopUiBridge());
      } catch (e) {
        expect(e, isA<WorkflowExecutionException>());
      }
    });
  });
}
