import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_handler_extension.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  group('ActionType.clearForm Tests', () {
    test('ActionType.fromId should recognize clear_form', () {
      final type = ActionType.fromId('clear_form');
      expect(type, ActionType.clearForm);
      expect(type.label, 'Clear Form');
    });

    testWidgets('handleOnSuccessSingle with clear_form should trigger controller.clearForm()', (tester) async {
      const layoutId = 'test_layout';
      
      // 1. Setup Mock Entity and Controller
      final form = LayoutForm(id: layoutId, label: 'Test Form', components: []);
      final entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
        layoutForm: [form],
      );

      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {},
          parentData: [],
        ),
        tag: 'create_page_$layoutId',
      );

      // Manually add a controller and some text to verify it gets cleared
      controller.controllers['test_field'] = TextEditingController(text: 'Dirty Content');

      // 2. Define Action with on_success: clear_form
      final action = ActionD(
        id: 'test_act',
        type: ActionType.none,
        name: 'Test',
        isMultiple: false,
        onSuccess: 'clear_form',
        onFailure: 'none',
      );

      // 3. Build a context for handleOnSuccessSingle
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async {
                    await action.handleOnSuccessSingle(
                      entity: entity,
                      context: context,
                      responseData: null,
                      data: {'layoutFormId': layoutId},
                    );
                  },
                  child: const Text('Trigger'),
                );
              },
            ),
          ),
        ),
      );

      // 4. Trigger the action
      await tester.tap(find.text('Trigger'));
      await tester.pumpAndSettle();

      // 5. Verify the field is cleared
      expect(controller.controllers['test_field']?.text, '', reason: 'Form fields should be cleared after clear_form action');
    });
  });
}
