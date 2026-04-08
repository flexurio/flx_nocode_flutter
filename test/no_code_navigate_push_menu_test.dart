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
        return null;
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
    });
  });
}
