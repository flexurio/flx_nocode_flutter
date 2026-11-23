import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/field/domain/field_value_label_resolver.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

List<int> generalXlsxNoCode(
  BuildContext? context,
  List<Map<String, dynamic>> data,
  List<String> fields, {
  List<EntityField>? entityFields,
}) {
  for (final field in fields) {
    if (data.isNotEmpty && !data[0].containsKey(field)) {
      throw Exception(
        'The specified field "$field" is missing from the data. '
        'Available fields are: ${data[0].keys.join(', ')}.',
      );
    }
  }

  final labelFields = FieldValueLabelResolver.indexFieldsWithLabels(entityFields);

  final excel = Excel.createExcel();
  final sheet = excel['Sheet1'];
  
  // Clean default sheet if it is not Sheet1
  final defaultSheet = excel.getDefaultSheet();
  if (defaultSheet != null && defaultSheet != 'Sheet1') {
    excel.delete(defaultSheet);
  }

  final headers = fields.map((e) => e.replaceAll('_', ' ').toUpperCase()).toList();
  sheet.appendRow(headers.map((e) => TextCellValue(e)).toList());
  
  for (var row in data) {
    final rowItems = fields.map((field) {
      final val = row[field];
      if (val == null) {
        return TextCellValue('-');
      }
      final labelField = labelFields[field];
      if (labelField != null) {
        return TextCellValue(labelField.resolveDisplayLabel(val));
      }
      if (val is int) {
        return IntCellValue(val);
      } else if (val is double) {
        return DoubleCellValue(val);
      } else if (val is String) {
        return TextCellValue(val);
      } else {
        return TextCellValue(val.toString());
      }
    }).cast<CellValue>().toList();
    sheet.appendRow(rowItems);
  }

  return excel.encode()!;
}
