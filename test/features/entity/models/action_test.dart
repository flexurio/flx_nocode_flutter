import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';

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
        onSuccess: 'toast',
        onFailure: 'toast',
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
        onSuccess: 'toast',
        onFailure: 'toast',
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
  });
}
