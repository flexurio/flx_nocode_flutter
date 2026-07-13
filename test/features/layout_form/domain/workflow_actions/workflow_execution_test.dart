import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpExecutor extends Mock implements HttpExecutor {}

class MockUiBridge extends Mock implements UiBridge {}

void main() {
  late MockHttpExecutor mockHttpExecutor;

  setUpAll(() {
    registerFallbackValue(HttpData.empty());
  });

  setUp(() {
    mockHttpExecutor = MockHttpExecutor();
  });

  group('Workflow Execution - Loop with HTTP', () {
    test('Sequential HTTP POSTs with mapped body should contain correct data',
        () async {
      // 1. Prepare Workflow JSON
      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": "{{ inventory_list }}",
            "item_var": "row",
            "actions": [
              {
                "type": "http",
                "name": "Post Row",
                "http": {
                  "method": "POST",
                  "url": "https://api.example.com/inventory",
                  "body": {
                    "product_name": "{{ vars.row.name }}",
                    "quantity": "{{ vars.row.qty }}"
                  }
                }
              }
            ]
          }
        ]
      };

      // 2. Prepare Context Data
      final form = <String, dynamic>{};
      final data = {
        "inventory_list": [
          {"name": "Apple", "qty": 10},
          {"name": "Banana", "qty": 5},
        ]
      };

      final definition = WorkflowDefinition.fromJson(workflowJson);
      final ctx = WorkflowContext(
        form: form,
        data: data,
        auth: const AuthContext(permissions: []),
        httpExecutor: mockHttpExecutor,
      );

      // 3. Mock HTTP responses
      when(() => mockHttpExecutor.execute(any()))
          .thenAnswer((_) async => const HttpResult(
                status: 200,
                data: {"status": "ok"},
              ));

      // 4. Run Workflow
      await WorkflowExecutor(definition).run(ctx);

      // 5. Verify HTTP requests
      final capturedRequests =
          verify(() => mockHttpExecutor.execute(captureAny())).captured;
      expect(capturedRequests.length, 2);

      // Check first request
      final HttpData firstReq = capturedRequests[0] as HttpData;
      expect(firstReq.method, "POST");
      expect(firstReq.body["product_name"], "Apple");
      expect(firstReq.body["quantity"], 10);

      // Check second request
      final HttpData secondReq = capturedRequests[1] as HttpData;
      expect(secondReq.method, "POST");
      expect(secondReq.body["product_name"], "Banana");
      expect(secondReq.body["quantity"], 5);
    });

    test('Loop action should auto-decode JSON string array items', () async {
      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": "{{ inventory_json_str }}",
            "item_var": "row",
            "actions": [
              {
                "type": "http",
                "name": "Post Row",
                "http": {
                  "method": "POST",
                  "url": "https://api.example.com/inventory",
                  "body": {
                    "product_name": "{{ vars.row.name }}",
                    "quantity": "{{ vars.row.qty }}"
                  }
                }
              }
            ]
          }
        ]
      };

      final form = <String, dynamic>{};
      final data = {
        "inventory_json_str": '[{"name": "Orange", "qty": 8}, {"name": "Mango", "qty": 12}]'
      };

      final definition = WorkflowDefinition.fromJson(workflowJson);
      final ctx = WorkflowContext(
        form: form,
        data: data,
        auth: const AuthContext(permissions: []),
        httpExecutor: mockHttpExecutor,
      );

      when(() => mockHttpExecutor.execute(any()))
          .thenAnswer((_) async => const HttpResult(
                status: 200,
                data: {"status": "ok"},
              ));

      await WorkflowExecutor(definition).run(ctx);

      final capturedRequests =
          verify(() => mockHttpExecutor.execute(captureAny())).captured;
      expect(capturedRequests.length, 2);

      final HttpData firstReq = capturedRequests[0] as HttpData;
      expect(firstReq.body["product_name"], "Orange");
      expect(firstReq.body["quantity"], 8);

      final HttpData secondReq = capturedRequests[1] as HttpData;
      expect(secondReq.body["product_name"], "Mango");
      expect(secondReq.body["quantity"], 12);
    });

    test('Loop action should safely skip when items resolves to empty string', () async {
      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": "{{ empty_str }}",
            "item_var": "row",
            "actions": [
              {
                "type": "http",
                "name": "Post Row",
                "http": {
                  "method": "POST",
                  "url": "https://api.example.com/inventory",
                  "body": {"val": "{{ vars.row }}"}
                }
              }
            ]
          }
        ]
      };

      final form = <String, dynamic>{};
      final data = {"empty_str": ""};

      final definition = WorkflowDefinition.fromJson(workflowJson);
      final ctx = WorkflowContext(
        form: form,
        data: data,
        auth: const AuthContext(permissions: []),
        httpExecutor: mockHttpExecutor,
      );

      await WorkflowExecutor(definition).run(ctx);

      verifyNever(() => mockHttpExecutor.execute(any()));
    });
  });
}

