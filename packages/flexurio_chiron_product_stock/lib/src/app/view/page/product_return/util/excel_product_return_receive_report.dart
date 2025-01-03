import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class TColumn<T> {
  TColumn({
    required this.title,
    required this.builder,
    this.numeric = false,
  });

  final String title;
  final bool numeric;
  final String Function(T data, int index) builder;
}

List<int> productReturnReceiveExcel<T>({
  required BuildContext context,
  required List<T> data,
  required List<TColumn<T>> columns,
  required DateTime startDate,
  required DateTime endDate,
}) {
  final theme = Theme.of(context);
  final primaryColor = theme.colorScheme.primary;

  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  final headers = columns.map((e) => e.title).toList();
  final columnsCount = columns.length;

  sheet.getRangeByIndex(1, 1).setValue('Product Return Receive');
  sheet.getRangeByIndex(1, 1)
    ..cellStyle.bold = true
    ..cellStyle.fontName
    ..cellStyle.fontSize = 14;

  sheet
      .getRangeByIndex(2, 1)
      .setValue('${startDate.yMMMMd} - ${endDate.yMMMMd}');
  sheet.getRangeByIndex(2, 1)
    ..cellStyle.bold = true
    ..cellStyle.fontName
    ..cellStyle.fontSize = 14;

  sheet.getRangeByIndex(5, 1, 5, headers.length)
    ..cellStyle.backColorRgb = primaryColor
    ..cellStyle.fontColor = '#FFFFFF'
    ..cellStyle.bold = true
    ..cellStyle.fontName
    ..cellStyle.fontSize = 14;

  for (var i = 0; i < headers.length; i++) {
    final cell = sheet.getRangeByIndex(5, i + 1)..setValue(headers[i]);
    if (columns[i].numeric) {
      cell.cellStyle.hAlign = HAlignType.right;
    }
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  sheet.getRangeByName('I${data.length + 7}')..setValue('Diserahkan Oleh');
  sheet.getRangeByName('I${data.length + 12}')..setValue('SCMA');
  sheet.getRangeByName('L${data.length + 7}')..setValue('Diterima Oleh');
  sheet.getRangeByName('L${data.length + 12}')..setValue('PPIC');

  for (var row = 0; row < data.length; row++) {
    final item = data[row];

    for (var col = 0; col < columnsCount; col++) {
      final column = columns[col];
      final cell = sheet.getRangeByIndex(row + 6, col + 1)
        ..setValue(column.builder(item, row))
        ..cellStyle.backColorRgb = (row + 6).isEven
            ? primaryColor.lighten(.25)
            : primaryColor.lighten(.3);
      if (columns[col].numeric) {
        cell.cellStyle.hAlign = HAlignType.right;
      }
    }
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }
  sheet.getRangeByName('A5')..columnWidth = 12;
  sheet.getRangeByName('I5')..columnWidth = 6;
  sheet.getRangeByName('J5')..columnWidth = 6;
  sheet.getRangeByName('L5')..columnWidth = 14;

  final bytes = workbook.saveSync();
  return bytes;
}
