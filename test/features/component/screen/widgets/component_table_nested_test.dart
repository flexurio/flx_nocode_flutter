import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown_widget.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('ComponentTable should render nested component in cells', (WidgetTester tester) async {
    // 1. Define JSON with nested component (Dropdown)
    const jsonRaw = '''
    {
      "id": "table_with_component",
      "reference_id": "table_with_component",
      "width": 800,
      "columns": [
        { "header": "User", "body": "name", "width": 200 },
        { 
          "header": "Action", 
          "body": "status", 
          "width": 150,
          "component": {
            "id": "status_dropdown",
            "type": "dropdown",
            "label": "",
            "initialValue": "{{current.status}}",
            "options": ["Active", "Inactive"],
            "widthMode": "fill"
          }
        }
      ]
    }
    ''';

    final map = json.decode(jsonRaw) as Map<String, dynamic>;
    final component = ComponentTable.fromMap(map);

    // 2. Row data
    final rowData = [
      {"name": "Alice", "status": "Active"},
      {"name": "Bob", "status": "Inactive"}
    ];

    final contextData = {
      "table_with_component": rowData
    };

    // 3. Render the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: component.toWidget(contextData),
        ),
      ),
    );

    // Allow controllers to initialize
    await tester.pumpAndSettle();

    // 4. Verify Alice row
    expect(find.text('Alice'), findsOneWidget);
    
    // 5. Verify Bob row
    expect(find.text('Bob'), findsOneWidget);

    // 6. Verify Dropdown components are present
    // We can search for the dropdown by its initial values or by type
    // Since it's a ComponentDropdown, it should render an AppDropdown (or similar)
    expect(find.byType(ComponentDropdownWidget), findsNWidgets(2));
    
    // 7. Verify Alice's dropdown value is "Active"
    expect(find.text('Active'), findsAtLeastNWidgets(1));
    
    // 8. Verify Bob's dropdown value is "Inactive"
    expect(find.text('Inactive'), findsAtLeastNWidgets(1));
  });
}
