import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

List<int> generalXlsx(
  BuildContext context,
  List<Map<String, dynamic>> data,
  List<String> fields,
) {
  for (final field in fields) {
    if (data.isNotEmpty && !data[0].containsKey(field)) {
      throw Exception(
        'The specified field "$field" is missing from the data. '
        'Available fields are: ${data[0].keys.join(', ')}.',
      );
    }
  }

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
      } else if (val is int) {
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
