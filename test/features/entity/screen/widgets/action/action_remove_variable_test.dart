import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_execution_extension.dart';
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

  group('ActionType.removeVariable Tests', () {
    const layoutId = 'test_layout';
    late EntityCustom entity;
    late ActionD action;

    setUp(() {
      final form = LayoutForm(id: layoutId, label: 'Test Form', components: []);
      entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
        layoutForm: [form],
      );

      action = ActionD(
        id: 'delete_act',
        type: ActionType.removeVariable,
        name: 'Delete Row',
        isMultiple: false,
        targetVariable: 'item_list',
        onSuccess: const ['none'],
        onFailure: const ['none'],
      );
    });

    testWidgets('should remove item at rowIndex when rowIndex is an integer', (WidgetTester tester) async {
      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {
            'item_list': [
              {'id': '101', 'name': 'Item A'},
              {'id': '102', 'name': 'Item B'},
              {'id': '103', 'name': 'Item C'},
            ]
          },
          parentData: [],
        ),
        tag: 'create_page_$layoutId',
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  await action.executeSingle(
                    entity: entity,
                    context: context,
                    data: {
                      'layoutFormId': layoutId,
                      'rowIndex': 1,
                    },
                    parentData: const [],
                  );
                },
                child: const Text('Trigger'),
              );
            },
          ),
        ),
      ));

      await tester.tap(find.text('Trigger'));
      await tester.pumpAndSettle();

      final list = controller.initialData['item_list'] as List;
      expect(list.length, 2);
      expect(list[0]['id'], '101');
      expect(list[1]['id'], '103');
    });

    testWidgets('should remove item at rowIndex when rowIndex is a string integer', (WidgetTester tester) async {
      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {
            'item_list': [
              {'id': '101', 'name': 'Item A'},
              {'id': '102', 'name': 'Item B'},
              {'id': '103', 'name': 'Item C'},
            ]
          },
          parentData: [],
        ),
        tag: 'create_page_$layoutId',
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  await action.executeSingle(
                    entity: entity,
                    context: context,
                    data: {
                      'layoutFormId': layoutId,
                      'rowIndex': '2',
                    },
                    parentData: const [],
                  );
                },
                child: const Text('Trigger'),
              );
            },
          ),
        ),
      ));

      await tester.tap(find.text('Trigger'));
      await tester.pumpAndSettle();

      final list = controller.initialData['item_list'] as List;
      expect(list.length, 2);
      expect(list[0]['id'], '101');
      expect(list[1]['id'], '102');
    });

    testWidgets('should fallback to row matching when rowIndex is missing', (WidgetTester tester) async {
      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {
            'item_list': [
              {'id': '101', 'name': 'Item A'},
              {'id': '102', 'name': 'Item B'},
              {'id': '103', 'name': 'Item C'},
            ]
          },
          parentData: [],
        ),
        tag: 'create_page_$layoutId',
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  await action.executeSingle(
                    entity: entity,
                    context: context,
                    data: {
                      'layoutFormId': layoutId,
                      'id': '102',
                      'name': 'Item B',
                    },
                    parentData: const [],
                  );
                },
                child: const Text('Trigger'),
              );
            },
          ),
        ),
      ));

      await tester.tap(find.text('Trigger'));
      await tester.pumpAndSettle();

      final list = controller.initialData['item_list'] as List;
      expect(list.length, 2);
      expect(list[0]['id'], '101');
      expect(list[1]['id'], '103');
    });
  });
}
