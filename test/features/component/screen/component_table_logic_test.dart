import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table_controller.dart';
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
      expect(newController.rows[0]['label'], 'From JSON');
    });
  });
}
