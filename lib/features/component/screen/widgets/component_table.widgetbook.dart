import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
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

@UseCase(name: 'With Dropdown Component', type: ComponentTable)
Widget mockComponentTableWithDropdown(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "component_table",
    "reference_id": "users",
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
      { "header": "Email", "body": "email", "width": 200 }
    ],
    "http": { "method": "GET", "url": "" }
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentTable.fromMap(map);

  final contextData = {
    "users": [
      {"name": "Alice Smith", "status": "Active", "email": "alice@example.com"},
      {"name": "Bob Jones", "status": "Inactive", "email": "bob@example.com"},
      {"name": "Charlie Brown", "status": "Pending", "email": "charlie@example.com"}
    ]
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Table with nested Dropdown component:", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        component.toWidget(contextData),
      ],
    ),
  );
}
