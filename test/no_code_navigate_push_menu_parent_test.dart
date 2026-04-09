import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as core;
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/model/theme.dart';

class MockEntityCustomRepository extends Mock implements EntityCustomRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('NoCode.navigatePushMenu Parent Data Test', () {
    const entityId = 'employee';
    
    final mockEntityJson = {
      "id": entityId,
      "label": "Employee",
      "description": "Employee Description",
      "fields": [
        {"reference": "nik", "label": "NIK", "type": "text"},
        {"reference": "name", "label": "Name", "type": "text"}
      ],
      "backend": {
        "read_all": {
          "method": "GET",
          "url": "/employees?dept_id={{ parent.id }}",
          "mock_enabled": true,
          "mock_data": {"data": [], "total_data": 0}
        }
      },
      "layout_form": [],
      "actions_home": [],
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
      registerFallbackValue(core.PageOptions<Map<String, dynamic>>.empty());
      SharedPreferences.setMockInitialValues({});
      
      // Initialize configuration for FlavorConfig
      Configuration.instance = Configuration.empty().copyWith(
        theme: ThemeC(color: '#03A9F4', colorSoft: '#B3E5FC'),
      );

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
        // Return a 1x1 transparent PNG
        final pngData = Uint8List.fromList([
          0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
          0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
          0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
          0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
          0x42, 0x60, 0x82
        ]);
        return ByteData.view(pngData.buffer);
      });

      final mockRepo = MockEntityCustomRepository();
      EntityCustomRepository.instance = mockRepo;
      
      when(() => mockRepo.fetch(
        accessToken: any(named: 'accessToken'),
        pageOptions: any(named: 'pageOptions'),
        method: any(named: 'method'),
        path: any(named: 'path'),
        filterMap: any(named: 'filterMap'),
        headers: any(named: 'headers'),
        cachedDurationSeconds: any(named: 'cachedDurationSeconds'),
        mockEnabled: any(named: 'mockEnabled'),
        mockData: any(named: 'mockData'),
      )).thenAnswer((invocation) async {
        final pageOptions = invocation.namedArguments[#pageOptions] as core.PageOptions<Map<String, dynamic>>;
        return pageOptions.copyWith(data: []);
      });
    });

    testWidgets('should interpolate parent.id in read_all URL via NoCode.navigatePushMenu', (WidgetTester tester) async {
      final pageData = {'id': 'dept_001', 'name': 'IT Department'};

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => NoCode.navigatePushMenu(
                context: context,
                entityId: entityId,
                pageData: pageData,
              ),
              child: const Text('Navigate'),
            ),
          ),
        ),
      );

      // Trigger navigation
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify repository was called with the correctly interpolated URL
      final captured = verify(() => EntityCustomRepository.instance.fetch(
        accessToken: any(named: 'accessToken'),
        pageOptions: any(named: 'pageOptions'),
        method: 'GET',
        path: captureAny(named: 'path'),
        filterMap: any(named: 'filterMap'),
        headers: any(named: 'headers'),
        cachedDurationSeconds: any(named: 'cachedDurationSeconds'),
        mockEnabled: true,
        mockData: any(named: 'mockData'),
      )).captured;

      expect(captured.first, contains('dept_id=dept_001'));
    });
  });
}
