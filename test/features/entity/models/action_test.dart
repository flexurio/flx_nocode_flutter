import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';

void main() {
  group('ActionD Export Tests', () {
    test('ActionD.fromJson correctly handles export format and columns', () {
      final json = <String, dynamic>{
        'id': 'export_excel',
        'name': 'Export to Excel',
        'type': 'export',
        'is_multiple': true,
        'on_success': 'toast',
        'on_failure': 'toast',
        'export_format': 'xlsx',
        'export_columns': [
          {'header': 'ID', 'body': 'id'},
          {'header': 'Customer Name', 'body': 'customer.name'},
        ],
      };

      final action = ActionD.fromJson(json);

      expect(action.type, ActionType.export);
      expect(action.exportFormat, 'xlsx');
      expect(action.exportColumns?.length, 2);
      expect(action.exportColumns?[0].header, 'ID');
      expect(action.exportColumns?[0].body, 'id');
      expect(action.exportColumns?[1].header, 'Customer Name');
      expect(action.exportColumns?[1].body, 'customer.name');
    });

    test('ActionD.toJson correctly serializes export format and columns', () {
      final action = ActionD(
        id: 'export_csv',
        name: 'Export to CSV',
        type: ActionType.export,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        exportFormat: 'csv',
        exportColumns: [
          TColumn(header: 'Date', body: 'created_at'),
          TColumn(header: 'Amount', body: 'total_amount'),
        ],
      );

      final json = action.toJson();

      expect(json['type'], 'export');
      expect(json['export_format'], 'csv');
      final columns = json['export_columns'] as List;
      expect(columns.length, 2);
      expect(columns[0]['header'], 'Date');
      expect(columns[1]['header'], 'Amount');
    });

    test('ActionD.copyWith handles export fields correctly', () {
      final original = ActionD(
        id: 'orig',
        name: 'Original',
        type: ActionType.export,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        exportFormat: 'pdf',
      );

      final updated = original.copyWith(
        exportFormat: 'xlsx',
        exportColumns: [TColumn(header: 'New', body: 'new_key')],
      );

      expect(updated.exportFormat, 'xlsx');
      expect(updated.exportColumns?.first.header, 'New');
      expect(original.exportFormat, 'pdf');
      expect(original.exportColumns, isNull);
    });

    test('ActionD handles filter_fields deserialization correctly', () {
      final json = <String, dynamic>{
        'id': 'print_1',
        'name': 'Print Doc',
        'type': 'print',
        'is_multiple': false,
        'filter_fields': [
          {
            'id': 'dept',
            'type': 'text_field',
            'label': 'Department',
            'required': true,
          }
        ],
      };

      final action = ActionD.fromJson(json);

      expect(action.filterFields.length, 1);
      expect(action.filterFields.first.id, 'dept');
      expect(action.filterFields.first.type, 'text_field');
      expect(action.filterFields.first.displayLabel, 'Department');
    });

    test('ActionD handles layout_form_id for print action', () {
      // New pattern: print actions no longer embed filter_fields,
      // they reference a layout_form by layout_form_id.
      final json = <String, dynamic>{
        'id': 'print_initial_personnel_action',
        'name': 'Daftar Inisial Personel',
        'type': 'print',
        'on_success': 'toast',
        'on_failure': 'toast',
        'is_multiple': false,
        'layout_print_id': 'print_initial_personnel_layout',
        'layout_form_id': 'filter_personnel',
        'icon': 'Print',
      };

      final action = ActionD.fromJson(json);

      expect(action.type, ActionType.print);
      expect(action.layoutPrintId, 'print_initial_personnel_layout');
      expect(action.layoutFormId, 'filter_personnel');
      // No inline filter_fields – they come from the layout_form at runtime
      expect(action.filterFields, isEmpty);
    });

    test('ActionD.toJson round-trips layout_form_id correctly', () {
      final action = ActionD(
        id: 'print_initial_personnel_action',
        name: 'Daftar Inisial Personel',
        type: ActionType.print,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        layoutPrintId: 'print_initial_personnel_layout',
        layoutFormId: 'filter_personnel',
        icon: 'Print',
      );

      final json = action.toJson();

      expect(json['layout_print_id'], 'print_initial_personnel_layout');
      expect(json['layout_form_id'], 'filter_personnel');
      expect(json['type'], 'print');
    });

    test('ActionD with dropdown filter_field parses httpData', () {
      final json = <String, dynamic>{
        'id': 'print_filter',
        'name': 'Print With Dropdown Filter',
        'type': 'print',
        'is_multiple': false,
        'filter_fields': [
          {
            'id': 'department_id',
            'type': 'dropdown',
            'label': 'Department',
            'options': [],
            'initialValue': '',
            'httpData': {
              'method': 'GET',
              'url': '{{backend_host}}/departments?page=1&sort=created_at&ascending=false&limit=90000',
              'headers': {'Authorization': 'Bearer {{auth_token}}'},
              'body': {},
              'use_form_data': false,
            },
            'optionKey': '{{item.id}}',
            'optionLabel': '{{item.id}} - {{item.name}}',
            'onChangeActions': [
              {
                'type': 'set_value',
                'target_id': 'department_name',
                'value': '{{item.name}}',
              }
            ],
            'required': true,
            'dependsOn': [],
          }
        ],
      };

      final action = ActionD.fromJson(json);

      expect(action.filterFields.length, 1);
      final dropdown = action.filterFields.first as ComponentDropdown;
      expect(dropdown.id, 'department_id');
      expect(dropdown.label, 'Department');
      expect(dropdown.httpData, isNotNull);
      expect(dropdown.httpData!.url, contains('departments'));
    });
  });
}
