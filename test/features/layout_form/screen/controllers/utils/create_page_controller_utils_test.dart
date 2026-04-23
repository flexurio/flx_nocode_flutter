import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    // Initialize required singleton for JavaScript interpolation
    Configuration.instance = Configuration.empty();
  });

  group('CreatePageControllerUtils', () {
    test(
        'prepareInitialData should resolve {{current.x}} placeholders correctly',
        () {
      // Setup initial data representing a record being updated
      final initialData = {
        'id': '101',
        'name': 'Ahmad',
        'email': 'ahmad@example.com',
        'phone': '0812345678',
      };

      // Define components with initial values using {{current.field}}
      final components = <Component>[
        ComponentTextField(
          id: 'name',
          label: 'Name',
          maxLength: 50,
          maxLines: 1,
          initialValue: '{{current.name}}',
          enabled: true,
        ),
        ComponentTextField(
          id: 'email',
          label: 'Email',
          maxLength: 50,
          maxLines: 1,
          initialValue: '{{current.email}}',
          enabled: true,
        ),
        ComponentTextField(
          id: 'phone',
          label: 'Phone',
          maxLength: 15,
          maxLines: 1,
          initialValue: '{{current.phone}}',
          enabled: true,
        ),
        ComponentTextField(
          id: 'summary',
          label: 'Summary',
          maxLength: 255,
          maxLines: 1,
          initialValue: 'User: {{current.name}} (ID: {{current.id}})',
          enabled: true,
        ),
      ];

      // Run the prepareInitialData utility
      final result = CreatePageControllerUtils.prepareInitialData(
        initialDataInput: initialData,
        components: components,
        parentData: [],
      );

      // Assertions
      expect(result['name'], 'Ahmad');
      expect(result['email'], 'ahmad@example.com');
      expect(result['phone'], '0812345678');
      expect(result['summary'], 'User: Ahmad (ID: 101)');
    });

    test('prepareInitialData should resolve {{current.field_id}} specifically',
        () {
      // Direct test for the user's request example
      final initialData = {
        'field_id': 'Value 123',
      };

      final components = <Component>[
        ComponentTextField(
          id: 'test_field',
          label: 'Test',
          maxLength: 50,
          maxLines: 1,
          initialValue: '{{current.field_id}}',
          enabled: true,
        ),
      ];

      final result = CreatePageControllerUtils.prepareInitialData(
        initialDataInput: initialData,
        components: components,
        parentData: [],
      );

      expect(result['test_field'], 'Value 123');
    });

    test(
        'prepareInitialData should handle nested object in current if data contains one',
        () {
      final initialData = {
        'id': '202',
        'profile': {
          'first_name': 'Suhal',
          'last_name': 'Vneu',
        }
      };

      final components = <Component>[
        ComponentTextField(
          id: 'full_name',
          label: 'Full Name',
          maxLength: 100,
          maxLines: 1,
          initialValue:
              '{{current.profile.first_name}} {{current.profile.last_name}}',
          enabled: true,
        ),
      ];

      final result = CreatePageControllerUtils.prepareInitialData(
        initialDataInput: initialData,
        components: components,
        parentData: [],
      );

      expect(result['full_name'], 'Suhal Vneu');
    });
  });
}
