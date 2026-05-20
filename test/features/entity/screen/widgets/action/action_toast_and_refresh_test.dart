import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_handler_extension.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  group('Action onSuccess Array Tests', () {
    test('ActionD.fromJson should recognize array of actions for on_success', () {
      final json = <String, dynamic>{
        'id': 'test_act',
        'type': 'none',
        'name': 'Test',
        'on_success': ['refresh', 'toast'],
        'on_failure': 'none',
      };
      final action = ActionD.fromJson(json);
      expect(action.onSuccess, ['refresh', 'toast']);
    });

    testWidgets('handleOnSuccessSingle with array of actions should trigger onSuccessCallback', (tester) async {
      // 1. Setup Mock Entity
      final entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
      );

      // 2. Define Action with on_success: ["refresh", "toast"]
      final action = ActionD(
        id: 'test_act',
        type: ActionType.none,
        name: 'Test',
        isMultiple: false,
        onSuccess: const ['refresh', 'toast'],
        onFailure: const ['none'],
      );

      bool callbackTriggered = false;

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
                      data: {},
                      onSuccessCallback: () {
                        callbackTriggered = true;
                      },
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
      await tester.runAsync(() async {
        await tester.tap(find.text('Trigger'));
        await tester.pump();
        await Future.delayed(const Duration(seconds: 3));
      });

      // 5. Verify the callback was triggered
      expect(callbackTriggered, true, reason: 'onSuccessCallback should be triggered after refresh action in list');
    });
  });
}
