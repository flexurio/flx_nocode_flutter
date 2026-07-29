import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
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

  group('ProductionUiBridge Tests', () {
    test('refresh should trigger callback registered in CreatePageController', () async {
      const layoutId = 'test_layout';
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

      bool refreshCalled = false;
      controller.tableReloadListeners['target_table'] = () {
        refreshCalled = true;
      };

      final ui = ProductionUiBridge(layoutFormId: layoutId);
      await ui.refresh('target_table');

      expect(refreshCalled, isTrue);
    });

    test('refresh should do nothing if layoutFormId or listener is not found', () async {
      final ui = ProductionUiBridge(layoutFormId: 'non_existent_layout');
      // Should not throw any exception
      await ui.refresh('target_table');
    });
  });
}
