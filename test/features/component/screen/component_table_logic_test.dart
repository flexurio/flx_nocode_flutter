import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:get/get.dart';

void main() {
  late ComponentTable table;
  late ComponentTableController controller;
  late Map<String, dynamic> contextData;
  late TextEditingController parentController;

  setUp(() {
    parentController = TextEditingController();
    
    table = ComponentTable(
      id: 'test_table',
      columns: [
        TColumn(header: 'Name', body: 'name'),
        TColumn(header: 'Age', body: 'age'),
      ],
      http: HttpData.empty(),
      width: 1000,
    );

    contextData = {
      'allControllers': {
        'test_table': parentController,
      },
    };

    controller = Get.put(
      ComponentTableController(
        component: table,
        contextData: contextData,
      ),
      tag: 'test_table',
    );
  });

  tearDown(() {
    Get.delete<ComponentTableController>(tag: 'test_table');
    parentController.dispose();
  });

  group('ComponentTableController Logic', () {
    test('initial state has empty rows', () {
      expect(controller.rows, isEmpty);
    });

    test('onRowChanged updates rows and notifies parent', () {
      // 1. Initial rows
      controller.rows.value = [
        {'id': 1, 'name': 'John', 'age': 30},
        {'id': 2, 'name': 'Jane', 'age': 25},
      ];

      // 2. Update a row
      final newData = {'id': 1, 'name': 'John Doe', 'age': 31};
      controller.onRowChanged(0, newData);

      // 3. Verify reactive list updated
      expect(controller.rows[0]['name'], 'John Doe');
      expect(controller.rows[0]['age'], 31);

      // 4. Verify parent controller updated with JSON string
      expect(parentController.text, isNotEmpty);
      final List decoded = jsonDecode(parentController.text);
      expect(decoded[0]['name'], 'John Doe');
      expect(decoded.length, 2);
    });

    test('notifyChanged serializes empty rows correctly', () {
      controller.rows.value = [];
      controller.notifyChanged();
      
      expect(parentController.text, '[]');
    });

    test('resolveValue supports dot notation', () {
      final row = {
        'user': {
          'profile': {'name': 'Alice'}
        },
        'simple': 'value'
      };

      expect(controller.resolveValue(row, 'simple'), 'value');
      expect(controller.resolveValue(row, 'user.profile.name'), 'Alice');
      expect(controller.resolveValue(row, 'non.existent'), isNull);
    });

    test('loadData resolves initial_value as List', () async {
      final tableWithInitial = ComponentTable(
        id: 'test_table_initial',
        columns: [],
        http: HttpData.empty(),
        initial_value: [
          {'id': 1, 'name': 'Initial Item'}
        ],
      );

      final newController = ComponentTableController(
        component: tableWithInitial,
        contextData: {},
      );

      await newController.loadData();

      expect(newController.rows.length, 1);
      expect(newController.rows[0]['name'], 'Initial Item');
    });

    test('loadData resolves initial_value as JSON string via interpolation',
        () async {
      final tableWithInitial = ComponentTable(
        id: 'test_table_initial_json',
        columns: [],
        http: HttpData.empty(),
        initial_value: '{{ my_json_data }}',
      );

      final data = {
        'my_json_data': jsonEncode([
          {'id': 100, 'label': 'From JSON'}
        ])
      };

      final newController = ComponentTableController(
        component: tableWithInitial,
        contextData: data,
      );

      await newController.loadData();

      expect(newController.rows.length, 1);
    });

    test('loadData preserves empty list in referenceId without falling back to HTTP', () async {
      final tableWithRef = ComponentTable(
        id: 'test_table_empty_list',
        referenceId: 'my_rows',
        columns: [],
        http: HttpData(
          url: 'https://example.com/api/data',
          method: 'GET',
          headers: const {},
          body: const {},
        ),
      );

      final data = {
        'my_rows': <dynamic>[],
      };

      final newController = ComponentTableController(
        component: tableWithRef,
        contextData: data,
      );

      await newController.loadData();

      expect(newController.rows, isEmpty);
      expect(newController.isLoading.value, false);
      expect(newController.error.value, isNull);
    });

    test('loadData with isRefresh: true bypasses referenceId and re-executes HTTP', () async {
      final tableWithRef = ComponentTable(
        id: 'test_table_refresh',
        referenceId: 'my_rows',
        columns: [],
        http: HttpData.empty(),
      );

      final data = {
        'my_rows': [
          {'id': 1, 'name': 'Cached Row'}
        ],
      };

      final newController = ComponentTableController(
        component: tableWithRef,
        contextData: data,
      );

      // 1. Without isRefresh -> uses localData
      await newController.loadData();
      expect(newController.rows.length, 1);
      expect(newController.rows[0]['name'], 'Cached Row');

      // 2. With isRefresh: true -> bypasses localData, reaches empty HTTP -> rows reset to empty
      await newController.loadData(isRefresh: true);
      expect(newController.rows, isEmpty);
    });

    test('loadData with isRefresh: true safely resets inputs while preserving disabled, hidden context, and initialDataInput fields', () async {
      final tag = 'create_page_test_refresh_form';
      final pageCtrl = Get.put(
        CreatePageController(
          entity: EntityCustom.empty(),
          layoutFormId: 'test_refresh_form',
          initialDataInput: {
            'record_header_id': 'HDR-ORIGINAL',
          },
          parentData: const [],
        ),
        tag: tag,
      );

      pageCtrl.layoutForm = LayoutForm(
        id: 'test_refresh_form',
        label: 'Test Refresh Form',
        components: [
          ComponentTextField(
            id: 'expense_detail_id',
            label: 'Expense Transaction Detail ID',
            enabled: false,
            initialValue: '161',
          ),
          ComponentTextField(
            id: 'hidden_context',
            label: 'Hidden Context',
            visibilityCondition: 'false',
            initialValue: '{{ data.id }}',
          ),
          ComponentTextField(
            id: 'is_adding',
            label: 'Is Adding',
            visibilityCondition: 'false',
            initialValue: 'false',
          ),
          ComponentTextField(
            id: 'record_header_id',
            label: 'Header ID',
            initialValue: 'HDR-ORIGINAL',
          ),
          ComponentTextField(
            id: 'user_input_note',
            label: 'Note',
            initialValue: 'Default Note',
          ),
        ],
      );

      pageCtrl.controllers['expense_detail_id'] = TextEditingController(text: '161');
      pageCtrl.controllers['hidden_context'] = TextEditingController(text: '161');
      pageCtrl.controllers['is_adding'] = TextEditingController(text: 'true');
      pageCtrl.controllers['record_header_id'] = TextEditingController(text: 'HDR-MODIFIED');
      pageCtrl.controllers['user_input_note'] = TextEditingController(text: 'Unsaved User Input');

      final tableWithRef = ComponentTable(
        id: 'test_table_refresh',
        referenceId: 'my_rows',
        columns: [],
        http: HttpData.empty(),
        reloadWithRefresh: true,
      );

      final tableCtrl = ComponentTableController(
        component: tableWithRef,
        contextData: {
          'layoutFormId': 'test_refresh_form',
          'my_rows': [],
        },
      );

      await tableCtrl.loadData(isRefresh: true);

      // 1. Unsaved user inputs are reset to initial values
      expect(pageCtrl.controllers['user_input_note']?.text, 'Default Note');
      // 2. is_adding is reset to 'false' (collapses addition panel)
      expect(pageCtrl.controllers['is_adding']?.text, 'false');
      // 3. Disabled fields are preserved (not overwritten with template)
      expect(pageCtrl.controllers['expense_detail_id']?.text, '161');
      // 4. Hidden context fields are preserved (not overwritten with raw template)
      expect(pageCtrl.controllers['hidden_context']?.text, '161');
      // 5. Initial record data fields are preserved
      expect(pageCtrl.controllers['record_header_id']?.text, 'HDR-MODIFIED');

      Get.delete<CreatePageController>(tag: tag);
    });

    test(
        'loadData with isRefresh: true does NOT reset page inputs when reloadWithRefresh is false',
        () async {
      final tag = 'create_page_test_no_refresh_reset';
      final pageCtrl = Get.put(
        CreatePageController(
          entity: EntityCustom.empty(),
          layoutFormId: 'test_no_refresh_reset',
          initialDataInput: const {},
          parentData: const [],
        ),
        tag: tag,
      );

      pageCtrl.layoutForm = LayoutForm(
        id: 'test_no_refresh_reset',
        label: 'Test No Refresh Reset',
        components: [
          ComponentTextField(
            id: 'change_item_id',
            label: 'Item Perubahan',
            initialValue: '',
          ),
          ComponentTextField(
            id: 'change_name',
            label: 'Nama Perubahan',
            initialValue: '',
          ),
        ],
      );

      pageCtrl.controllers['change_item_id'] =
          TextEditingController(text: 'FORMULA_ID');
      pageCtrl.controllers['change_name'] =
          TextEditingController(text: 'Perubahan Formula');

      final tableWithoutReloadWithRefresh = ComponentTable(
        id: 'change_type_list',
        columns: [],
        http: HttpData.empty(),
        dependsOn: ['change_item_id'],
        reloadWithRefresh: false,
      );

      final tableCtrl = ComponentTableController(
        component: tableWithoutReloadWithRefresh,
        contextData: {
          'layoutFormId': 'test_no_refresh_reset',
          'allControllers': pageCtrl.controllers,
        },
      );

      await tableCtrl.loadData(isRefresh: true);

      // Page inputs MUST be preserved so table does not disappear!
      expect(pageCtrl.controllers['change_item_id']?.text, 'FORMULA_ID');
      expect(pageCtrl.controllers['change_name']?.text, 'Perubahan Formula');

      Get.delete<CreatePageController>(tag: tag);
    });

    test(
        'loadData with isRefresh: true preserves dependsOn fields even if reloadWithRefresh is true',
        () async {
      final tag = 'create_page_test_dependson_protect';
      final pageCtrl = Get.put(
        CreatePageController(
          entity: EntityCustom.empty(),
          layoutFormId: 'test_dependson_protect',
          initialDataInput: const {},
          parentData: const [],
        ),
        tag: tag,
      );

      pageCtrl.layoutForm = LayoutForm(
        id: 'test_dependson_protect',
        label: 'Test DependsOn Protect',
        components: [
          ComponentTextField(
            id: 'parent_filter_id',
            label: 'Filter Parent',
            initialValue: '',
          ),
          ComponentTextField(
            id: 'temp_input',
            label: 'Temp',
            initialValue: 'INITIAL',
          ),
        ],
      );

      pageCtrl.controllers['parent_filter_id'] =
          TextEditingController(text: 'SELECTED_PARENT');
      pageCtrl.controllers['temp_input'] =
          TextEditingController(text: 'MODIFIED');

      final tableWithDepends = ComponentTable(
        id: 'child_table',
        columns: [],
        http: HttpData.empty(),
        dependsOn: ['parent_filter_id'],
        reloadWithRefresh: true,
      );

      final tableCtrl = ComponentTableController(
        component: tableWithDepends,
        contextData: {
          'layoutFormId': 'test_dependson_protect',
          'allControllers': pageCtrl.controllers,
        },
      );

      await tableCtrl.loadData(isRefresh: true);

      // dependsOn component MUST be preserved!
      expect(pageCtrl.controllers['parent_filter_id']?.text, 'SELECTED_PARENT');
      // Other editable input without protection is reset
      expect(pageCtrl.controllers['temp_input']?.text, 'INITIAL');

      Get.delete<CreatePageController>(tag: tag);
    });
  });

  group('ComponentTable reloadWithRefresh', () {
    test('defaults to false when key is absent from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_a',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
      });
      expect(t.reloadWithRefresh, isFalse);
    });

    test('parses reload_with_refresh: true from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_b',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'reload_with_refresh': true,
      });
      expect(t.reloadWithRefresh, isTrue);
    });

    test('parses reload_with_refresh: false explicitly from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_c',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'reload_with_refresh': false,
      });
      expect(t.reloadWithRefresh, isFalse);
    });

    test('toMap serializes reload_with_refresh correctly', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_d',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'reload_with_refresh': true,
      });
      final map = t.toMap();
      expect(map['reload_with_refresh'], isTrue);
    });

    test(
        'toMap serializes reload_with_refresh: false when default', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_e',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
      });
      final map = t.toMap();
      expect(map['reload_with_refresh'], isFalse);
    });

    test(
        'change_type_list without reload_with_refresh stays false (dependsOn cascade safe)',
        () {
      // Simulates change_controls.json → change_type_list
      final t = ComponentTable.fromMap({
        'id': 'change_type_list',
        'http': {
          'method': 'GET',
          'url':
              '{{backend_host}}/cc_item_types?item_id.eq={{form.change_item_id}}'
        },
        'columns': [
          {'header': 'Tipe Perubahan', 'body': 'type_name', 'width': 500}
        ],
        'reference_id': null,
        'dependsOn': ['change_item_id'],
      });
      // tableReloadListeners will call loadData(isRefresh: false) → does NOT
      // clear local state, allows URL re-interpolation with updated contextData
      expect(t.reloadWithRefresh, isFalse);
    });

    test(
        'realization_table with reload_with_refresh: true clears local rows on dependsOn trigger',
        () {
      // Simulates lbb_expense_transaction_detail_subs.json → realization_table
      final t = ComponentTable.fromMap({
        'id': 'realization_table',
        'reference_id': 'realization_list',
        'http': {
          'method': 'GET',
          'url':
              '{{backend_host}}/lbb_realization_details?transaction_detail_sub_id.eq={{data.id}}'
        },
        'columns': [],
        'reload_with_refresh': true,
      });
      // tableReloadListeners will call loadData(isRefresh: true) → discards
      // locally-added rows and fetches purely from the HTTP endpoint
      expect(t.reloadWithRefresh, isTrue);
    });
  });

  group('ComponentTable showRefresh', () {
    test('defaults to true when key is absent from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_default_refresh',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
      });
      expect(t.showRefresh, isTrue);
    });

    test('parses show_refresh: false from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'review_comp_table',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'show_refresh': false,
      });
      expect(t.showRefresh, isFalse);
    });

    test('parses showRefresh: false (camelCase) from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'review_param_table',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'showRefresh': false,
      });
      expect(t.showRefresh, isFalse);
    });

    test('parses show_refresh_button: false from JSON', () {
      final t = ComponentTable.fromMap({
        'id': 'review_param_table_btn',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'show_refresh_button': false,
      });
      expect(t.showRefresh, isFalse);
    });

    test('toMap serializes show_refresh correctly', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_serialize_refresh',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'show_refresh': false,
      });
      final map = t.toMap();
      expect(map['show_refresh'], isFalse);
    });
  });

  group('ComponentTable refresh gaps', () {
    test('parses refresh_gap_top and refresh_gap_bottom from snake_case', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_gaps',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'refresh_gap_top': 16.0,
        'refresh_gap_bottom': 20.0,
      });
      expect(t.refreshGapTop, 16.0);
      expect(t.refreshGapBottom, 20.0);

      final map = t.toMap();
      expect(map['refresh_gap_top'], 16.0);
      expect(map['refresh_gap_bottom'], 20.0);
    });

    test('parses refreshGapTop and refreshGapBottom from camelCase', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_camel_gaps',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'refreshGapTop': 14.5,
        'refreshGapBottom': 18.5,
      });
      expect(t.refreshGapTop, 14.5);
      expect(t.refreshGapBottom, 18.5);
    });

    test('parses integer and string numbers for refresh gaps', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_num_gaps',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
        'refresh_gap_top': 10,
        'refresh_gap_bottom': '25.5',
      });
      expect(t.refreshGapTop, 10.0);
      expect(t.refreshGapBottom, 25.5);
    });

    test('defaults to null when refresh gaps are omitted', () {
      final t = ComponentTable.fromMap({
        'id': 'tbl_no_gaps',
        'http': {'method': 'GET', 'url': '{{backend_host}}/items'},
        'columns': [],
      });
      expect(t.refreshGapTop, isNull);
      expect(t.refreshGapBottom, isNull);

      final map = t.toMap();
      expect(map.containsKey('refresh_gap_top'), isFalse);
      expect(map.containsKey('refresh_gap_bottom'), isFalse);
    });
  });
}

