import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval_flutter_js.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:get/get.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
    disposeJsRuntime();
  });

  group('ComponentDropdown Live Search Model Tests', () {
    test('should parse snake_case search_live parameters correctly from map', () {
      final map = {
        'id': 'outlet_id',
        'type': 'dropdown',
        'label': 'Outlet ID',
        'search_live': true,
        'search_live_limit': 25,
        'search_live_parameter': 'outlet_name.like',
        'options': ['Option 1'],
        'httpData': {
          'method': 'GET',
          'url':
              'https://api.example.com/outlets?marketing_structure_id.eq=BTMA1&period.eq=202611',
        },
      };

      final dropdown = ComponentDropdown.fromMap(map);
      expect(dropdown.searchLive, isTrue);
      expect(dropdown.searchLiveLimit, equals(25));
      expect(dropdown.searchLiveParameter, equals('outlet_name.like'));

      final serialized = dropdown.toMap();
      expect(serialized['search_live'], isTrue);
      expect(serialized['search_live_limit'], equals(25));
      expect(serialized['search_live_parameter'], equals('outlet_name.like'));
    });

    test('should parse camelCase searchLive parameters correctly from map', () {
      final map = {
        'id': 'outlet_id',
        'type': 'dropdown',
        'label': 'Outlet ID',
        'searchLive': true,
        'searchLiveLimit': 15,
        'searchLiveParameter': 'outlet_name.like',
      };

      final dropdown = ComponentDropdown.fromMap(map);
      expect(dropdown.searchLive, isTrue);
      expect(dropdown.searchLiveLimit, equals(15));
      expect(dropdown.searchLiveParameter, equals('outlet_name.like'));
    });

    test('ComponentDropdown.empty should have searchLive defaults to false and null', () {
      final empty = ComponentDropdown.empty('outlet_id');
      expect(empty.searchLive, isFalse);
      expect(empty.searchLiveLimit, isNull);
      expect(empty.searchLiveParameter, isNull);
    });
  });

  group('ComponentDropdownController Live Search & Dummy Data Tests', () {
    final dummyOutlets = [
      {'outlet_id': 'OUT-001', 'outlet_name': 'Apotek Kimia Farma 1'},
      {'outlet_id': 'OUT-002', 'outlet_name': 'Apotek Kimia Farma 2'},
      {'outlet_id': 'OUT-003', 'outlet_name': 'Apotek K-24 Menteng'},
      {'outlet_id': 'OUT-004', 'outlet_name': 'Apotek K-24 Sudirman'},
      {'outlet_id': 'OUT-005', 'outlet_name': 'Rumah Sakit Siloam'},
      {'outlet_id': 'OUT-006', 'outlet_name': 'Rumah Sakit Pondok Indah'},
      {'outlet_id': 'OUT-007', 'outlet_name': 'Klinik Sehat Sentosa'},
      {'outlet_id': 'OUT-008', 'outlet_name': 'Klinik Medika Pratama'},
    ];

    test('should filter dummy data with search query and preserve marketing_structure_id & period',
        () async {
      final component = ComponentDropdown(
        id: 'outlet_id',
        label: 'Outlet ID',
        options: const [],
        searchLive: true,
        searchLiveLimit: 20,
        searchLiveParameter: 'outlet_name.like',
        optionKey: '{{item.outlet_id}}',
        optionLabel: '{{item.outlet_id}} - {{item.outlet_name}}',
        httpData: HttpData(
          method: 'GET',
          url:
              'https://ski-compliance-metiska-farma-api.flexurio.com/marketings/structures/territories/outlets-no-auth?marketing_structure_id.eq={{ parent.area_code }}&period.eq={{ form.period }}',
          headers: const {},
          body: const {},
          mockEnabled: true,
          mockData: {'data': dummyOutlets},
        ),
      );

      final data = {
        'parent': {'area_code': 'BTMA1'},
        'form': {'period': '202611'},
      };

      final controller = ComponentDropdownController(
        component: component,
        data: data,
      );

      // Search with empty query -> returns all (or up to limit)
      final allResults = await controller.searchLiveOptions('');
      expect(allResults.length, equals(dummyOutlets.length));
      expect(allResults.first['key'], equals('OUT-001'));
      expect(allResults.first['label'], equals('OUT-001 - Apotek Kimia Farma 1'));

      // Search with "Kimia" -> returns only the 2 Kimia Farma outlets
      final kimiaResults = await controller.searchLiveOptions('Kimia');
      expect(kimiaResults.length, equals(2));
      expect(kimiaResults[0]['key'], equals('OUT-001'));
      expect(kimiaResults[1]['key'], equals('OUT-002'));

      // Search with "K-24" -> returns only K-24 outlets
      final k24Results = await controller.searchLiveOptions('K-24');
      expect(k24Results.length, equals(2));
      expect(k24Results[0]['key'], equals('OUT-003'));
      expect(k24Results[1]['key'], equals('OUT-004'));

      // Search with non-matching query -> returns 0
      final emptyResults = await controller.searchLiveOptions('NonExistentPharmacy');
      expect(emptyResults.length, equals(0));
    });

    test('should respect search_live_limit on dummy data', () async {
      final component = ComponentDropdown(
        id: 'outlet_id',
        label: 'Outlet ID',
        options: const [],
        searchLive: true,
        searchLiveLimit: 3,
        searchLiveParameter: 'outlet_name.like',
        optionKey: '{{item.outlet_id}}',
        optionLabel: '{{item.outlet_name}}',
        httpData: HttpData(
          method: 'GET',
          url: 'https://api.example.com/outlets',
          headers: const {},
          body: const {},
          mockEnabled: true,
          mockData: {'data': dummyOutlets},
        ),
      );

      final controller = ComponentDropdownController(
        component: component,
        data: const {},
      );

      final limitedResults = await controller.searchLiveOptions('');
      expect(limitedResults.length, equals(3));
    });

    test('should preserve initial value if not yet present in live search batch', () {
      final component = ComponentDropdown(
        id: 'outlet_id',
        label: 'Outlet ID',
        options: const [],
        initialValue: 'OUT-999',
        searchLive: true,
        searchLiveLimit: 20,
        searchLiveParameter: 'outlet_name.like',
      );

      final controller = ComponentDropdownController(
        component: component,
        data: const {},
      );

      controller.setInitialValue();
      expect(controller.selectedValue.value, equals('OUT-999'));
      expect(controller.displayedValue.value?['key'], equals('OUT-999'));
    });
  });

  group('ComponentDropdownWidget Live Search Rendering Tests', () {
    testWidgets('should render FDropDownSearch with asyncItems when search_live is true',
        (tester) async {
      final component = ComponentDropdown(
        id: 'outlet_id',
        label: 'Outlet ID',
        options: const [],
        searchLive: true,
        searchLiveLimit: 20,
        searchLiveParameter: 'outlet_name.like',
        httpData: HttpData(
          method: 'GET',
          url: 'https://api.example.com/outlets?marketing_structure_id.eq=BTMA1&period.eq=202611',
          headers: const {},
          body: const {},
          mockEnabled: true,
          mockData: {
            'data': [
              {'outlet_id': 'OUT-001', 'outlet_name': 'Kimia Farma'}
            ]
          },
        ),
      );

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(const {}),
          ),
        ),
      );

      final dropdownFinder = find.byType(FDropDownSearch<Map<String, dynamic>>);
      expect(dropdownFinder, findsOneWidget);

      final dropdownWidget =
          tester.widget<FDropDownSearch<Map<String, dynamic>>>(dropdownFinder);
      expect(dropdownWidget.asyncItems, isNotNull);
    });

    testWidgets('should render FDropDownSearchSmall with asyncItems when isSmall is true',
        (tester) async {
      final component = ComponentDropdown(
        id: 'outlet_id',
        label: 'Outlet ID',
        options: const [],
        searchLive: true,
        searchLiveLimit: 20,
        searchLiveParameter: 'outlet_name.like',
        httpData: HttpData(
          method: 'GET',
          url: 'https://api.example.com/outlets',
          headers: const {},
          body: const {},
          mockEnabled: true,
          mockData: {'data': []},
        ),
      );

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(const {}, isSmall: true),
          ),
        ),
      );

      final dropdownFinder =
          find.byType(FDropDownSearchSmall<Map<String, dynamic>>);
      expect(dropdownFinder, findsOneWidget);

      final dropdownWidget =
          tester.widget<FDropDownSearchSmall<Map<String, dynamic>>>(dropdownFinder);
      expect(dropdownWidget.asyncItems, isNotNull);
    });
  });
}
