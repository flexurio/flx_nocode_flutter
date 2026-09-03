import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpExecutor extends Mock implements HttpExecutor {}

class MockUiBridge extends Mock implements UiBridge {}

void main() {
  late MockHttpExecutor mockHttpExecutor;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
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

    test('Realization loop should resolve form.realization_list correctly', () async {
      final itemsExpr = r"""{{ (function(){
  var list = [];
  try { list = JSON.parse(form.realization_list || '[]'); } catch(e) { list = []; }
  if (!Array.isArray(list)) list = [];
  return list;
})() }}""";

      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": itemsExpr,
            "item_var": "item",
            "actions": [
              {
                "type": "http",
                "name": "post_realization",
                "http": {
                  "method": "POST",
                  "url": "https://api.example.com/lbb_realization_details",
                  "body": {
                    "real_destination_id": "{{ vars.item.real_destination_id || '' }}",
                    "real_home_base_id": "{{ vars.item.real_home_base_id || '' }}",
                    "real_transportation_types_id": "{{ vars.item.real_transportation_types_id || '' }}",
                    "realization_customer_id": "{{ vars.item.realization_customer_id || '' }}",
                    "realization_value": "{{ vars.item.realization_value || '0' }}"
                  }
                }
              }
            ]
          }
        ]
      };

      final form = <String, dynamic>{
        "realization_list": '[{"realization_customer_id": "23060014", "real_home_base_id": "53", "real_destination_id": "78", "real_transportation_types_id": "MBLDNS", "realization_value": "2000000"}]',
      };
      final data = <String, dynamic>{
        "id": "29",
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
      expect(capturedRequests.length, 1);
      final HttpData req = capturedRequests[0] as HttpData;
      print('Captured body: ${req.body}');
      expect(req.body["realization_customer_id"], "23060014");
      expect(req.body["real_home_base_id"], "53");
      expect(req.body["real_destination_id"], "78");
      expect(req.body["real_transportation_types_id"], "MBLDNS");
      expect(req.body["realization_value"], "2000000");
    });

    test('Realization loop should make 0 POST requests when realization_list is empty', () async {
      final itemsExpr = r"""{{ (function(){
  var list = [];
  try { list = JSON.parse(form.realization_list || '[]'); } catch(e) { list = []; }
  if (!Array.isArray(list)) list = [];
  return list.filter(function(item) {
    return item && item.realization_customer_id && String(item.realization_customer_id).trim() !== '';
  });
})() }}""";

      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": itemsExpr,
            "item_var": "item",
            "actions": [
              {
                "type": "http",
                "name": "post_realization",
                "http": {
                  "method": "POST",
                  "url": "https://api.example.com/lbb_realization_details",
                  "body": {
                    "realization_customer_id": "{{ vars.item.realization_customer_id }}"
                  }
                }
              }
            ]
          }
        ]
      };

      final form = <String, dynamic>{
        "realization_list": "[]",
      };
      final data = <String, dynamic>{
        "id": "29",
      };

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

    test('Realization submit from lbb_expense_transaction_details sets transaction_detail_sub_id and lbb_expense_transaction_detail_id to detail id', () async {
      final itemsExpr = r"""{{ (function(){
  var list = [];
  try { list = JSON.parse(form.realization_list || '[]'); } catch(e) { list = []; }
  if (!Array.isArray(list)) list = [];
  return list.filter(function(item) {
    return item && item.realization_customer_id && String(item.realization_customer_id).trim() !== '';
  });
})() }}""";

      final workflowJson = {
        "type": "workflow",
        "actions": [
          {
            "type": "loop",
            "items": itemsExpr,
            "item_var": "item",
            "actions": [
              {
                "type": "http",
                "name": "post_realization",
                "http": {
                  "method": "POST",
                  "url": "https://erp-metiska-farma-api-dev.flexurio.com/lbb_realization_details",
                  "body": {
                    "realization_customer_id": "{{ vars.item.realization_customer_id }}",
                    "transaction_detail_sub_id": "{{ data.id }}",
                    "lbb_expense_transaction_detail_id": "{{ data.id }}"
                  }
                }
              }
            ]
          }
        ]
      };

      final form = <String, dynamic>{
        "realization_list": jsonEncode([
          {"realization_customer_id": "23060014"}
        ]),
      };
      final data = <String, dynamic>{
        "id": "160",
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
      expect(capturedRequests.length, 1);
      final HttpData req = capturedRequests[0] as HttpData;
      expect(req.body["realization_customer_id"], "23060014");
      expect(req.body["transaction_detail_sub_id"], "160");
      expect(req.body["lbb_expense_transaction_detail_id"], "160");
    });
  });
}

