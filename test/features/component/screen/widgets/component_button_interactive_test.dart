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
      'ComponentButton with append_variable should update controller data (Generated from JSON)',
      (tester) async {
    const layoutId = 'test_layout';

    // 1. Define the form JSON
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
            "target_variable": "items"
          }
        }
      ]
    };

    final form = LayoutForm.fromMap(jsonMap);
    final entity = EntityCustom.empty().copyWith(
      id: 'test_entity',
      layoutForm: [form],
    );

    // 2. Initialize the controller
    final controller = Get.put(
      CreatePageController(
        entity: entity,
        layoutFormId: layoutId,
        initialDataInput: {'items': []},
        parentData: [],
      ),
      tag: 'create_page_$layoutId',
    );

    // 3. Prepare context data
    final dataContext = {
      'layoutFormId': layoutId,
      'entity': entity,
      ...controller.initialData,
      'allControllers': controller.controllers,
    };

    // 4. Build the widget using toWidget extension
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: form.toWidget(dataContext),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // 5. Simulate user input
    await tester.enterText(find.byType(TextField), 'John Doe');
    await tester.pumpAndSettle();

    // 6. Click the 'Add' button
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // 7. Verify the result
    final items = controller.initialData['items'] as List;
    expect(items.length, 1);
    expect(items[0]['name'], 'John Doe');
  });
}
