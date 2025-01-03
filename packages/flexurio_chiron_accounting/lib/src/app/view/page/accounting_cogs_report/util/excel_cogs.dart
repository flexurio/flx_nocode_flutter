import 'package:appointment/constant/month.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs_detail.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelCogs(List<CogsGrade1> cogs) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet.getRangeByIndex(1, 1, 1, 13).setBuiltInStyle(BuiltInStyles.heading1);

  sheet.getRangeByIndex(1, 1).setValue('Transaction');
  for (var i = 0; i < months.length; i++) {
    sheet.getRangeByIndex(1, 2 + i).setValue(months[i]);
  }

  final style = workbook.styles.add('bold')
    ..bold = true
    ..fontColorRgb = Colors.blue.shade700;

  var row = 2;

  // loop grade 1
  for (var i1 = 0; i1 < cogs.length; i1++) {
    final cogs1 = cogs[i1];
    sheet.getRangeByIndex(row, 1, row, 13).cellStyle = style;
    sheet.getRangeByIndex(row, 1).setValue('${i1 + 1} ${cogs1.name}');
    for (var i = 1; i <= months.length; i++) {
      sheet.getRangeByIndex(row, i + 1).setNumber(
            cogs1.getValueByMonth(i),
          );
    }
    row++;

    // loop grade 2
    for (var i2 = 0; i2 < cogs1.children.length; i2++) {
      final cogs2 = cogs1.children[i2];
      sheet
          .getRangeByIndex(row, 1)
          .setValue('${i1 + 1}.${i2 + 1} ${cogs2.name}');
      for (var i = 1; i <= months.length; i++) {
        sheet.getRangeByIndex(row, i + 1).setNumber(
              cogs2.getValueByMonth(i),
            );
      }
      row++;

      // loop grade 3
      for (var i3 = 0; i3 < cogs2.children.length; i3++) {
        final cogs3 = cogs2.children[i3];
        sheet.getRangeByIndex(row, 1).setValue(
              '${i1 + 1}.${i2 + 1}.${i3 + 1} ${cogs3.name}',
            );
        for (var i = 1; i <= months.length; i++) {
          sheet.getRangeByIndex(row, i + 1).setNumber(
                cogs3.getValueByMonth(i),
              );
        }
        row++;

        // loop grade 4
        for (var i4 = 0; i4 < cogs3.children.length; i4++) {
          final cogs4 = cogs3.children[i4];
          sheet.getRangeByIndex(row, 1).setValue(
                '${i1 + 1}.${i2 + 1}.${i3 + 1}.${i4 + 1} ${cogs4.name}',
              );
          for (var i = 1; i <= months.length; i++) {
            sheet.getRangeByIndex(row, i + 1).setNumber(
                  cogs4.getValueByMonth(i),
                );
          }
          row++;
        }
      }
    }
  }

  sheet
    ..autoFitColumn(1)
    ..autoFitRow(1);
  for (var i = 0; i < months.length; i++) {
    sheet.setColumnWidthInPixels(i + 2, 160);
  }

  sheet.getRangeByIndex(2, 2, 2000, 13).numberFormat = '_(Rp* #,##0_)';

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}

List<int> excelCogsDetail(ExcelCogsDetailValue excelCogsDetailValues) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  const headerCogsDetail = <String>[
    'Period',
    'Division',
    'Type',
    'Product',
    'Quantity',
    'Price',
    'Total',
  ];

  sheet.getRangeByIndex(1, 1, 1, 7).setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < headerCogsDetail.length; i++) {
    sheet.getRangeByIndex(1, 1 + i).setValue(headerCogsDetail[i]);
  }

  var row = 2;
  for (var i = 0; i < excelCogsDetailValues.cogsDetails.length; i++) {
    sheet.getRangeByIndex(row, 1).setValue(excelCogsDetailValues.period);
    sheet.getRangeByIndex(row, 2).setValue(excelCogsDetailValues.division);
    sheet.getRangeByIndex(row, 3).setValue(excelCogsDetailValues.typeName);
    sheet
        .getRangeByIndex(row, 4)
        .setValue(excelCogsDetailValues.cogsDetails[i].transaction);
    sheet
        .getRangeByIndex(row, 5)
        .setValue(excelCogsDetailValues.cogsDetails[i].quantity);
    sheet
        .getRangeByIndex(row, 6)
        .setValue(excelCogsDetailValues.cogsDetails[i].price);
    sheet
        .getRangeByIndex(row, 7)
        .setValue(excelCogsDetailValues.cogsDetails[i].value);
    row++;
  }

  sheet
    ..autoFitColumn(1)
    ..autoFitRow(1);
  for (var i = 0; i < headerCogsDetail.length; i++) {
    if (i == 3 || i == 2) {
      sheet.setColumnWidthInPixels(i + 1, 280);
    } else {
      sheet.setColumnWidthInPixels(i + 1, 140);
    }
  }

  sheet.getRangeByIndex(2, 6, 2000, 7).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 5, 2000, 5).numberFormat = '_(#,##0_)';

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}

class ExcelCogsDetailValue {
  const ExcelCogsDetailValue({
    required this.period,
    required this.division,
    required this.typeName,
    required this.cogsDetails,
  });
  final String period;
  final String division;
  final String typeName;
  final List<CogsDetail> cogsDetails;
}
