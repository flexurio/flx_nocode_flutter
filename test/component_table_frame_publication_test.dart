import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table_controller.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });
  tearDown(() => Get.reset());

  for (final closeBeforeFrame in [false, true]) {
    testWidgets(
        'publishes after build, skips disposed tables ($closeBeforeFrame)',
        (tester) async {
      final entity = EntityCustom.empty().copyWith(layoutForm: [
        LayoutForm.fromMap(
            {'id': 'create', 'label': 'Create', 'components': []}),
      ]);
      final page = Get.put(
          CreatePageController(
            entity: entity,
            layoutFormId: 'create',
            initialDataInput: {},
            parentData: [],
          ),
          tag: 'create_page_create');
      final table = ComponentTableController(
        component: ComponentTable.fromMap({
          'id': 'products',
          'reference_id': 'products',
          'http': {'method': 'GET', 'url': ''},
          'columns': [],
        }),
        contextData: {'rootLayoutFormId': 'create'},
      );
      var published = false;
      await tester.pumpWidget(MaterialApp(home: Obx(() {
        final count = (page.initialData['products'] as List?)?.length ?? 0;
        return Column(children: [
          Text('Products: $count'),
          Builder(builder: (_) {
            if (!published) {
              published = true;
              table.rows.add({'product_id': 'P1'});
              table.notifyChanged();
              table.rows.add({'product_id': 'P2'});
              table.notifyChanged();
              if (closeBeforeFrame) table.onDelete();
            }
            return const SizedBox.shrink();
          }),
        ]);
      })));
      await tester.pumpAndSettle();
      expect(
          find.text('Products: ${closeBeforeFrame ? 0 : 2}'), findsOneWidget);
      if (closeBeforeFrame) {
        expect(page.initialData.containsKey('products'), isFalse);
      } else {
        expect((page.initialData['products'] as List).length, 2);
        table.onDelete();
      }
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }
}
