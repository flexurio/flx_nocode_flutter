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
  });
}
