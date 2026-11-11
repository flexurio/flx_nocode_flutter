import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_execution_extension.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });
  tearDown(() => Get.reset());

  test('action JSON preserves object values when copied and serialized', () {
    final value = {'product_id': '{{form.product_id}}', 'no_batch': ''};
    final action = ActionD.fromJson({
      'id': 'append',
      'type': 'append_variable',
      'value': value,
    });
    expect(action.value, value);
    expect(action.copyWith().toJson()['value'], value);
  });

  for (final type in ['append_variable', 'set_variable']) {
    testWidgets('$type resolves nested JSON without losing scalar types', (
      tester,
    ) async {
      final entity = EntityCustom.empty().copyWith(
        layoutForm: [
          LayoutForm.fromMap({
            'id': 'create',
            'label': 'Create',
            'components': [],
          }),
        ],
      );
      final page = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: 'create',
          initialDataInput: {},
          parentData: [],
        ),
        tag: 'create_page_create',
      );
      late BuildContext context;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (value) {
              context = value;
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      final action = ActionD.fromJson({
        'id': 'products',
        'type': type,
        'target_variable': 'products',
        'on_success': [],
        'value': {
          'product_id': '{{form.product_id}}',
          'product_name': '{{form.product_name}}',
          'no_batch': '{{form.no_batch}}',
          'metadata': {'active': true, 'count': 2, 'optional': null},
          'tags': ['{{form.product_id}}', false],
        },
      });
      await action.executeSingle(
        entity: entity,
        context: context,
        parentData: [],
        data: {
          'rootLayoutFormId': 'create',
          'form': {
            'product_id': 'P1',
            'product_name': 'Product "A"\\B',
            'no_batch': '',
          },
        },
      );
      final expected = {
        'product_id': 'P1',
        'product_name': 'Product "A"\\B',
        'no_batch': '',
        'metadata': {'active': true, 'count': 2, 'optional': null},
        'tags': ['P1', false],
      };
      expect(
        page.initialData['products'],
        type == 'append_variable' ? [expected] : expected,
      );
      await tester.pumpWidget(const SizedBox.shrink());
    });
  }
}
