import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/enitty_create_form.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  group('EntityCreateForm List/Map Override Tests', () {
    testWidgets('should preserve list from initialData when controller text is not empty', (tester) async {
      final inspectComp = ComponentText(
        id: 'composition_list',
        value: '{{composition_list}}',
      );
      final form = LayoutForm(
        id: 'test_form',
        label: 'Test Form',
        components: [inspectComp],
      );
      final entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
        layoutForm: [form],
      );

      final controllers = {
        'composition_list': TextEditingController(text: '[{"id": 1}]'),
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EntityCreateForm(
              dataAction: DataAction.create,
              entity: entity,
              controllers: controllers,
              layoutForm: form,
              parentData: const [],
              initialData: const {
                'composition_list': [
                  {'id': 1}
                ]
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // The text widget should contain the interpolated list string representation
      expect(find.textContaining('id: 1'), findsOneWidget);
    });

    testWidgets('should clear list to empty string in mergedData when controller text is empty', (tester) async {
      final inspectComp = ComponentText(
        id: 'composition_list',
        value: '{{composition_list}}',
      );
      final form = LayoutForm(
        id: 'test_form',
        label: 'Test Form',
        components: [inspectComp],
      );
      final entity = EntityCustom.empty().copyWith(
        id: 'test_entity',
        layoutForm: [form],
      );

      final controllers = {
        'composition_list': TextEditingController(text: ''), // explicitly cleared
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EntityCreateForm(
              dataAction: DataAction.create,
              entity: entity,
              controllers: controllers,
              layoutForm: form,
              parentData: const [],
              initialData: const {
                'composition_list': [
                  {'id': 1}
                ]
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // The text widget should be empty and NOT contain 'id: 1'
      expect(find.textContaining('id: 1'), findsNothing);
    });
  });
}
