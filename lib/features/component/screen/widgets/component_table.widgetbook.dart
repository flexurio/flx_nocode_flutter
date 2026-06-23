import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'component_table.dart';

@UseCase(name: 'Mock Design', type: ComponentTable)
Widget mockComponentTableDesign(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "json_table",
    "width": 600,
    "columns": [
      { "header": "Product", "body": "name", "width": 200 },
      { "header": "Price", "body": "price", "width": 100 },
      { "header": "Stock", "body": "stock", "width": 100 }
    ],
    "http": {
      "method": "GET",
      "url": "https://api.example.com/products"
    }
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: component.toMockWidget(),
  );
}

@UseCase(name: 'Live Widget (Local Data)', type: ComponentTable)
Widget mockComponentTableLive(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "live_table",
    "reference_id": "products_data",
    "width": 600,
    "columns": [
      { "header": "Product", "body": "name", "width": 200 },
      { "header": "Price", "body": "price", "width": 150 }
    ],
    "http": {
      "method": "GET",
      "url": ""
    }
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  final contextData = {
    "products_data": [
      {"name": "MacBook Pro M3", "price": "IDR 30.000.000"},
      {"name": "iPhone 15 Pro", "price": "IDR 20.000.000"},
      {"name": "iPad Pro", "price": "IDR 15.000.000"}
    ]
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: component.toWidget(contextData),
  );
}

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

class HttpRequestConfigFake extends Fake implements HttpRequestConfig {}

@UseCase(name: 'With Dropdown Component', type: ComponentTable)
Widget mockComponentTableWithDropdown(BuildContext context) {
  // 1. Setup Mock Executor
  if (!Get.isRegistered<HttpRequestExecutor>()) {
    final mockExecutor = MockHttpRequestExecutor();

    // Register fallback for any() to work with HttpRequestConfig
    registerFallbackValue(HttpRequestConfigFake());

    when(() => mockExecutor.execute(any())).thenAnswer((_) async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 2000));

      return HttpRequestResult.success(
        statusCode: 200,
        data: [
          {
            "name": "Alice Smith",
            "status": "Active",
            "email": "alice@example.com"
          },
          {
            "name": "Bob Jones",
            "status": "Inactive",
            "email": "bob@example.com"
          },
          {
            "name": "Charlie Brown",
            "status": "Pending",
            "email": "charlie@example.com"
          },
          {
            "name": "David Wilson",
            "status": "Active",
            "email": "david@example.com"
          },
        ],
      );
    });

    Get.put<HttpRequestExecutor>(mockExecutor);
  }

  const jsonRaw = '''
  {
    "id": "component_table_dropdown",
    "width": 800,
    "columns": [
      { "header": "User Name", "body": "name", "width": 200 },
      { 
        "header": "Status", 
        "body": "status", 
        "width": 200,
        "component": {
          "id": "status_dropdown",
          "type": "dropdown",
          "label": "",
          "initialValue": "{{current.status}}",
          "options": ["Active", "Inactive", "Pending"],
          "widthMode": "fill"
        }
      },
      { "header": "Email", "body": "email", "width": 250 }
    ],
    "http": { 
      "method": "GET", 
      "url": "https://api.example.com/users" 
    }
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Table with nested Dropdown (Data from Mocked HTTP):",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        const Text(
            "This use case uses Get.put<HttpRequestExecutor> with mocktail.",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 16),
        Expanded(
          child: component.toWidget({}),
        ),
      ],
    ),
  );
}

@UseCase(name: 'With Row Actions', type: ComponentTable)
Widget mockComponentTableWithActions(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "table_with_actions",
    "reference_id": "users",
    "width": 900,
    "columns": [
      { "header": "Name", "body": "name", "width": 200 },
      { "header": "Role", "body": "role", "width": 150 },
      { "header": "Last Login", "body": "last_login", "width": 200 }
    ],
    "actions": [
      {
        "id": "edit",
        "type": "open_page",
        "name": "Edit",
        "icon": "edit",
        "layout_form_id": "user_form"
      },
      {
        "id": "delete",
        "type": "http",
        "name": "Delete",
        "icon": "delete",
        "http": {
          "method": "DELETE",
          "url": "https://api.example.com/users/\${id}"
        },
        "on_success": "refresh"
      }
    ],
    "http": {
      "method": "GET",
      "url": ""
    }
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  final contextData = {
    "bypassPermission": true,
    "users": [
      {"id": 1, "name": "Ahmad", "role": "Admin", "last_login": "2024-03-20"},
      {"id": 2, "name": "Budi", "role": "User", "last_login": "2024-03-19"},
      {"id": 3, "name": "Citra", "role": "User", "last_login": "2024-03-18"}
    ]
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Table with Row Actions:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        Expanded(
          child: component.toWidget(contextData),
        ),
      ],
    ),
  );
}

@UseCase(name: 'Reactive Form Integration', type: ComponentTable)
Widget mockComponentTableReactiveForm(BuildContext context) {
  // 1. Setup Form Controllers
  final detailTableController = TextEditingController();
  final allControllers = {
    'detail_table': detailTableController,
  };

  const jsonRaw = '''
  {
    "id": "detail_table",
    "initial_value": "{{form.detail_table}}",
    "width": 800,
    "columns": [
      { "header": "Item", "body": "name", "width": 200 },
      { 
        "header": "Status", 
        "body": "status", 
        "width": 200,
        "component": {
          "id": "status_dropdown",
          "type": "dropdown",
          "on_change": {
            "type": "update_row",
            "target_id": "detail_table"
          },
          "options": ["Pending", "Approved", "Rejected"],
          "widthMode": "fill"
        }
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  // Initial Data
  final initialRows = [
    {"name": "Document A", "status": "Pending"},
    {"name": "Document B", "status": "Pending"},
  ];
  detailTableController.text = jsonEncode(initialRows);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Reactive Table Sync with Form Controller:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        const Text(
            "Changing the dropdown inside the table updates the form controller below in real-time.",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: component.toWidget({
            'form': {'detail_table': detailTableController.text},
            'allControllers': allControllers,
          }),
        ),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 8),
        const Text("Parent Form Controller Value (Raw JSON):",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Expanded(
          child: ListenableBuilder(
            listenable: detailTableController,
            builder: (context, _) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    detailTableController.text,
                    style: const TextStyle(
                        fontFamily: 'monospace', color: Colors.blueAccent),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
