import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flx_core_flutter/flx_core_flutter.dart' show flavorConfig;
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';

class MockEntityCustomRepository extends Mock implements EntityCustomRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NoCode.navigatePushMenu Initial Value Test', () {
    const entityId = 'employee';
    const layoutFormId = 'create_employee';
    
    final mockEntityJson = {
      "id": entityId,
      "label": "Employee",
      "description": "Employee entity",
      "fields": [
        {"reference": "nik", "label": "NIK", "type": "text"},
        {"reference": "name", "label": "Name", "type": "text"}
      ],
      "backend": {
        "read_all": {
          "method": "GET",
          "url": "/employees",
          "mock_enabled": true,
          "mock_data": {"data": [], "total_data": 0}
        }
      },
      "layout_form": [
        {
          "id": layoutFormId,
          "label": "Create Employee",
          "action": "create",
          "submit_workflow": {
            "submit_label": "Submit",
            "actions": [
              {
                "type": "http",
                "name": "Submit Form",
                "http": {
                  "method": "POST",
                  "url": "/employees/create?form_name={{ form.name }}&parent_name={{ parent.name }}",
                  "body": {
                    "nik": "{{ form.nik }}",
                    "name": "{{ form.name }}",
                    "parent_nik": "{{ parent.nik }}"
                  },
                  "mock_enabled": true,
                  "mock_data": {"status": "success", "message": "Employee created"}
                }
              },
              {
                "type": "close_modal"
              }
            ]
          },
          "components": [
            {
              "id": "nik",
              "type": "text_field",
              "label": "NIK",
              "initialValue": "{{ parent.nik }}"
            },
            {
              "id": "name",
              "type": "text_field",
              "label": "Name",
              "initialValue": "{{ parent.name }}"
            }
          ]
        }
      ],
      "actions_home": [
        {
          "id": "add_employee",
          "name": "Add Employee",
          "type": "open_page",
          "layout_form_id": layoutFormId
        }
      ],
      "layout_table": {
        "nik": 1,
        "name": 2
      },
      "layout_list_tile": {
        "title": "{{ nik }}",
        "subtitle": "{{ name }}"
      }
    };

    setUpAll(() async {
      SharedPreferences.setMockInitialValues({});
      await EasyLocalization.ensureInitialized();

      final binaryMessenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      binaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
        if (message == null) return null;
        final String key = utf8.decode(message.buffer.asUint8List());
        if (key == 'AssetManifest.json') {
          return ByteData.view(Uint8List.fromList(utf8.encode('{}')).buffer);
        }
        if (key == 'AssetManifest.bin') {
          return const StandardMessageCodec().encodeMessage(<String, List<Object>>{});
        }
        if (key.contains('configuration/entity/$entityId.json')) {
          return ByteData.view(utf8.encode(jsonEncode(mockEntityJson)).buffer);
        }
        if (key.contains('asset/translation/en.json') || key.contains('asset/translation/id.json')) {
          return ByteData.view(utf8.encode(jsonEncode({})).buffer);
        }
        if (key.contains('packages/flutter_js/assets/js/')) {
          return ByteData.view(utf8.encode('// dummy').buffer);
        }
        return null;
      });

      // Register default mock behavior
      final mockRepo = MockEntityCustomRepository();
      EntityCustomRepository.instance = mockRepo;
      
      when(() => mockRepo.modify(
        accessToken: any(named: 'accessToken'),
        path: any(named: 'path'),
        method: any(named: 'method'),
        headers: any(named: 'headers'),
        data: any(named: 'data'),
        mockEnabled: any(named: 'mockEnabled'),
        mockData: any(named: 'mockData'),
      )).thenAnswer((invocation) async {
        final mockData = invocation.namedArguments[#mockData];
        return (mockData as Map<String, dynamic>?) ?? {};
      });
    });

    tearDown(() {
      Get.reset();
    });

    testWidgets('should show initial value from parentData in TextField', (tester) async {
      // Initialize Configuration
      Configuration.instance = Configuration.empty();
      flavorConfig = Configuration.instance.flavorConfig;

      // Create a simple app to trigger navigation
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    NoCode.navigatePushMenu(
                      context: context,
                      entityId: entityId,
                      pageData: {'nik': '12345', 'name': 'John Doe'},
                    );
                  },
                  child: const Text('Navigate'),
                ),
              ),
            ),
          ),
        ),
      );

      // 1. Click Navigate
      await tester.tap(find.text('Navigate'));
      // Wait for navigation and potential nested MaterialApp/EasyLocalization setup
      await tester.pump(); 
      await tester.pump(const Duration(milliseconds: 100));

      // 2. Verify MenuCustom is shown (wait for FutureBuilder)
      // We might need to pump multiple times because of FutureBuilder and EasyLocalization
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 500));
      }

      if (find.text('Employee').evaluate().isEmpty) {
        debugPrint('Dumping widget tree because "Employee" not found:');
        debugPrint(tester.allWidgets.toString());
      }

      expect(find.text('Employee'), findsOneWidget);

      // 3. Click "Add Employee" button
      if (find.textContaining(RegExp('Add Employee', caseSensitive: false)).evaluate().isEmpty) {
        debugPrint('Dumping widget tree because "Add Employee" not found:');
        debugPrint(tester.allWidgets.toString());
      }
      final addButton = find.textContaining(RegExp('Add Employee', caseSensitive: false));
      expect(addButton, findsOneWidget);
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // 4. Verify CreatePage is shown
      expect(find.textContaining(RegExp('Create', caseSensitive: false)), findsAtLeast(1));
      expect(find.textContaining(RegExp('Employee', caseSensitive: false)), findsAtLeast(1));

      // 5. Verify TextFields have initial values from parentData
      final textFieldNik = find.descendant(
        of: find.ancestor(of: find.text('NIK'), matching: find.byType(core.FTextFormField)),
        matching: find.byType(TextField),
      );
      final textFieldName = find.descendant(
        of: find.ancestor(of: find.text('Name'), matching: find.byType(core.FTextFormField)),
        matching: find.byType(TextField),
      );

      expect(textFieldNik, findsOneWidget);
      expect(textFieldName, findsOneWidget);

      final nikController = (tester.widget<TextField>(textFieldNik)).controller;
      final nameController = (tester.widget<TextField>(textFieldName)).controller;

      expect(nikController?.text, '12345');
      expect(nameController?.text, 'John Doe');

      // 6. Click Submit button
      final submitButton = find.textContaining(RegExp('Submit', caseSensitive: false));
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);
      
      // Wait for workflow execution and navigation back
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();

      // 7. Verify we are back at the Menu page (Employee title should be present)
      await tester.pumpAndSettle();
      
      // Wait for the toast auto-dismiss timer (7s) to clear to avoid pending timer error
      await tester.pump(const Duration(seconds: 8)); 

      expect(find.text('Employee'), findsAtLeast(1));
      // Create page title should be gone
      expect(find.textContaining(RegExp('Create', caseSensitive: false)), findsNothing);

      // Verify HTTP Request Body and URL (with query params)
      final captured = verify(() => EntityCustomRepository.instance.modify(
        accessToken: any(named: 'accessToken'),
        path: captureAny(named: 'path'),
        method: 'POST',
        headers: any(named: 'headers'),
        data: captureAny(named: 'data'),
        mockEnabled: true,
        mockData: any(named: 'mockData'),
      )).captured;

      final url = captured[0] as String;
      final body = captured[1] as Map<String, dynamic>;

      expect(url, contains('form_name=John Doe'));
      expect(url, contains('parent_name=John Doe'));

      expect(body['nik'], '12345');
      expect(body['name'], 'John Doe');
      expect(body['parent_nik'], '12345');
    });
  });
}
