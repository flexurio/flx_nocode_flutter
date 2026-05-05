import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets(
      'ComponentButton with append_variable and clear_form should update data and reset form',
      (tester) async {
    const layoutId = 'test_layout';

    // 1. Define the form JSON with append_variable and clear_form
    final jsonMap = {
      "id": layoutId,
      "label": "Test Form",
      "components": [
        {"id": "name", "type": "text_field", "label": "Name"},
        {
          "id": "add_btn",
          "type": "button",
          "text": "Add",
          "color": "#2196F3",
          "on_click": {
            "id": "append_act",
            "type": "append_variable",
            "name": "Append",
            "target_variable": "items",
            "on_success": "clear_form"
          }
        }
      ]
    };

    final form = LayoutForm.fromMap(jsonMap);
    final entity = EntityCustom.empty().copyWith(
      id: 'test_entity',
      layoutForm: [form],
    );

    // 2. Initialize the controller with specific tag
    final controller = Get.put(
      CreatePageController(
        entity: entity,
        layoutFormId: layoutId,
        initialDataInput: {'items': []},
        parentData: [],
      ),
      tag: 'create_page_$layoutId',
    );

    // 3. Prepare context data exactly as expected by the framework
    final dataContext = {
      'layoutFormId': layoutId,
      'entity': entity,
      ...controller.initialData,
      'allControllers': controller.controllers,
    };

    // 4. Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: form.toWidget(dataContext),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // 5. Simulate user input - find by label to be more specific
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);
    await tester.enterText(textFieldFinder, 'John Doe');
    await tester.pumpAndSettle();

    // 6. Click the 'Add' button
    final buttonFinder = find.text('Add');
    expect(buttonFinder, findsOneWidget);
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // 7. Verify Data Append: The 'items' list should have 1 item
    final items = controller.initialData['items'] as List;
    expect(items.length, 1, reason: 'Item should be appended to the list');
    
    // Note: append_variable spreads controller.initialData into the item, 
    // so we look for the 'name' key which comes from the form controllers.
    expect(items[0]['name'], 'John Doe');

    // 8. Verify Form Clear: The text field should be empty due to on_success: clear_form
    expect(controller.controllers['name']?.text, '', reason: 'Form field should be cleared after success');
  });
}
