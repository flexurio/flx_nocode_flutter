import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:get/get.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CreatePageController user_id Tests', () {
    late EntityCustom mockEntity;
    const String formId = 'test_form';

    setUp(() {
      // 1. Setup global singletons
      Configuration.instance = Configuration.empty();
      UserRepositoryApp.instance = UserRepositoryApp();
      UserRepositoryApp.instance.userApp = UserApp(
        id: 1801008, // Dynamic User ID from JWT
        name: 'Logged In User',
        role: 'admin',
      );

      // 2. Setup mock entity and layout form
      mockEntity = EntityCustom.empty().copyWith(
        id: 'test_entity',
        fields: [],
        layoutForm: [
          LayoutForm.fromMap({
            'id': formId,
            'label': 'Test Form',
            'action': 'create',
            'components': [
              {
                'id': 'progressed_by_id',
                'type': 'text_field',
                'label': 'Progressed By',
                'initialValue': '{{ user_id }}',
              }
            ],
          }),
        ],
      );

      // Clean up GetX between tests
      Get.reset();
    });

    test('should initialize field with user_id from JWT', () {
      final controller = CreatePageController(
        entity: mockEntity,
        layoutFormId: formId,
        initialDataInput: {},
        parentData: [],
      );

      controller.onInit();

      // Check initialData map
      expect(controller.initialData['progressed_by_id'], '1801008');

      // Check the actual TextEditingController value
      expect(controller.controllers['progressed_by_id']?.text, '1801008');
    });

    test('JWT user_id should take priority even if initialData has user_id',
        () {
      final controller = CreatePageController(
        entity: mockEntity,
        layoutFormId: formId,
        initialDataInput: {
          'user_id': 3251043, // ID from old record data
        },
        parentData: [],
      );

      controller.onInit();

      // Even if 'user_id' exists in input, {{ user_id }} should use JWT's 1801008
      expect(controller.initialData['progressed_by_id'], '1801008');
      expect(controller.controllers['progressed_by_id']?.text, '1801008');
    });

    test('should still be able to access record user_id via explicit prefix',
        () {
      // Mock layout form to explicitly use record.user_id
      final entityWithExplicitPrefix = mockEntity.copyWith(
        layoutForm: [
          LayoutForm.fromMap({
            'id': formId,
            'label': 'Test Form',
            'action': 'create',
            'components': [
              {
                'id': 'progressed_by_id',
                'type': 'text_field',
                'label': 'Progressed By',
                'initialValue': '{{ record.user_id }}',
              }
            ],
          }),
        ],
      );

      final controller = CreatePageController(
        entity: entityWithExplicitPrefix,
        layoutFormId: formId,
        initialDataInput: {
          'user_id': 3251043,
        },
        parentData: [],
      );

      controller.onInit();

      // Should use the record value because of explicit prefix
      expect(controller.initialData['progressed_by_id'], '3251043');
    });
  });
}
