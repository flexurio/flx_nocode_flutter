import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class _MockHttpExecutor implements HttpExecutor {
  final HttpResult Function(HttpData request) handler;
  int callCount = 0;

  _MockHttpExecutor(this.handler);

  @override
  Future<HttpResult> execute(HttpData request) async {
    callCount++;
    return handler(request);
  }
}

void main() {
  group('HttpAction Workflow Tests', () {
    test('ActionFactory should parse "http" action correctly', () {
      final json = {
        'type': 'http',
        'name': 'fetch_user',
        'save_result_to': 'http.user_data',
        'http': {
          'method': 'GET',
          'url': 'https://api.example.com/users/1',
          'headers': {'Authorization': 'Bearer token'}
        },
        'retry': {'max': 3, 'delay_ms': 500}
      };

      final action = ActionFactory.fromJson(json);

      expect(action, isA<HttpAction>());
      if (action is HttpAction) {
        expect(action.name, 'fetch_user');
        expect(action.saveResultTo, 'http.user_data');
        expect(action.http.method, 'GET');
        expect(action.http.url, 'https://api.example.com/users/1');
        expect(action.http.headers['Authorization'], 'Bearer token');
        expect(action.retry?.max, 3);
        expect(action.retry?.delayMs, 500);
      }
    });

    test('HttpAction execute should resolve templates and execute request',
        () async {
      // Inject token since AuthContext doesn't pass it directly to building the scope
      // in the test without UserRepositoryApp instance mock. So we use vars instead as workaround.

      // We'll replace the auth.token with vars token for the test
      final actionForTest = HttpAction(
        name: 'create_order',
        http: HttpData(
          method: 'POST',
          url: 'https://api.example.com/orders/{{ form.customer_id }}',
          headers: {'Authorization': 'Bearer {{ vars.mock_token }}'},
          body: {'product': '{{ vars.product_id }}', 'qty': 2},
        ),
      );

      final ctxTest = WorkflowContext(
        form: {'customer_id': 123},
        vars: {'product_id': 'PROD-A', 'mock_token': 'test_token'},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockHttpExecutor((req) {
          expect(req.url, 'https://api.example.com/orders/123');
          expect(req.headers['Authorization'], 'Bearer test_token');
          expect(req.body['product'], 'PROD-A');
          expect(req.body['qty'], 2);
          return HttpResult(status: 201, data: {'id': 999});
        }),
      );

      await actionForTest.execute(ctxTest, NoopUiBridge());

      // Ensure the result is saved under ctx.http[name]
      expect(ctxTest.http.containsKey('create_order'), isTrue);
      expect(ctxTest.http['create_order']?.status, 201);
      expect(ctxTest.http['create_order']?.data['id'], 999);
      expect(ctxTest.lastData['id'], 999);
    });

    test(
        'HttpAction should retry on failure and eventually throw if max retries exceeded',
        () async {
      final action = HttpAction(
        name: 'flaky_request',
        http: HttpData(
          method: 'GET',
          url: 'https://api.example.com/flaky',
          headers: {},
          body: {},
        ),
        retry: RetryPolicy(max: 2, delayMs: 10), // Short delay for test
      );

      int attemptCount = 0;
      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockHttpExecutor((req) {
          attemptCount++;
          // Fail all the time
          return HttpResult(status: 500, data: 'Server Error');
        }),
      );

      try {
        await action.execute(ctx, NoopUiBridge());
        fail('Should have thrown an exception');
      } catch (e) {
        expect(e, isA<WorkflowExecutionException>());
        // Initial attempt + 2 retries = 3 attempts total
        expect(attemptCount, 3);
      }
    });

    test('HttpAction should succeed after retrying', () async {
      final action = HttpAction(
        name: 'flaky_request_success',
        http: HttpData(
          method: 'GET',
          url: 'https://api.example.com/flaky',
          headers: {},
          body: {},
        ),
        retry: RetryPolicy(max: 3, delayMs: 10),
      );

      int attemptCount = 0;
      final ctx = WorkflowContext(
        form: {},
        auth: const AuthContext(permissions: []),
        httpExecutor: _MockHttpExecutor((req) {
          attemptCount++;
          if (attemptCount < 3) {
            return HttpResult(
                status: 500, data: 'Server Error'); // Fail first two times
          }
          return HttpResult(
              status: 200, data: {'success': true}); // Succeed on third
        }),
      );

      await action.execute(ctx, NoopUiBridge());

      expect(attemptCount, 3);
      expect(ctx.http['flaky_request_success']?.status, 200);
      expect(ctx.http['flaky_request_success']?.data['success'], isTrue);
    });
  });
}
