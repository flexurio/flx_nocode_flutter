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

  group('ActionType.toastAndRefresh Tests', () {
    test('ActionType.fromId should recognize toast_and_refresh', () {
      final type = ActionType.fromId('toast_and_refresh');
      expect(type, ActionType.toastAndRefresh);
      expect(type.label, 'Toast and Refresh Data');
    });

    testWidgets('handleOnSuccessSingle with toast_and_refresh should trigger onSuccessCallback', (tester) async {
      // 1. Setup Mock Entity
      final entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
      );

      // 2. Define Action with on_success: toast_and_refresh
      final action = ActionD(
        id: 'test_act',
        type: ActionType.none,
        name: 'Test',
        isMultiple: false,
        onSuccess: 'toast_and_refresh',
        onFailure: 'none',
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
      expect(callbackTriggered, true, reason: 'onSuccessCallback should be triggered after toast_and_refresh action');
    });
  });
}
