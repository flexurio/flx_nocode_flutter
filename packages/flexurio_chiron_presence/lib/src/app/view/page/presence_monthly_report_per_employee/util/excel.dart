import 'package:flexurio_chiron_presence/src/app/model/presence_employee.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelPresencePerEmployee({
  required Map<int, PresenceEmployee?> presences,
  required DateTime dateTime,
  required Employee employee,
}) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, presenceHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < presenceHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(presenceHeaders[i]);
  }

  final keys = presences.keys.toList();
  final values = presences.values.toList();

  for (var i = 0; i < keys.length; i++) {
    final item = values[i];
    final date = DateTime(dateTime.year, dateTime.month, i + 1);
    if (date.isWeekend) {
      sheet.getRangeByIndex(i + 2, 1, i + 2, 9).cellStyle.backColorRgb =
          Colors.yellow.shade50;
    }

    sheet
        .getRangeByIndex(i + 2, 1)
        .setValue(DateFormat('yyyy/MM/dd, EEEE').format(date));

    if (item == null) {
      continue;
    }

    final inLateData = sheet.getRangeByIndex(i + 2, 6);

    if (item.isInLate) {
      inLateData.cellStyle.backColorRgb = Colors.green.shade50;
      inLateData.cellStyle.fontColorRgb = Colors.green;
    } else {
      inLateData.cellStyle.backColorRgb = Colors.red.shade50;
      inLateData.cellStyle.fontColorRgb = Colors.red;
    }

    final inOutEarly = sheet.getRangeByIndex(i + 2, 7);
    if (item.isOutEarly != null) {
      if (item.isOutEarly!) {
        inOutEarly.cellStyle.backColorRgb = Colors.red.shade50;
        inOutEarly.cellStyle.fontColorRgb = Colors.red;
      } else {
        inOutEarly.cellStyle.backColorRgb = Colors.green.shade50;
        inOutEarly.cellStyle.fontColorRgb = Colors.green;
      }
    }

    sheet.getRangeByIndex(i + 2, 2).setValue(item.office.name);
    sheet.getRangeByIndex(i + 2, 3).setValue('08:00-17:00');
    sheet.getRangeByIndex(i + 2, 4).setValue(item.inTime);
    sheet.getRangeByIndex(i + 2, 5).setValue(item.outTime ?? '--:--');
    sheet.getRangeByIndex(i + 2, 6).setValue(item.inLate.toText);
    sheet.getRangeByIndex(i + 2, 7).setValue(item.outEarly?.toText ?? '--:--');
    sheet.getRangeByIndex(i + 2, 8).setValue(item.total?.toText ?? '--:--');
  }

  for (var i = 0; i < presenceHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  sheet.getRangeByIndex(2, 4, keys.length + 1, 8).cellStyle.hAlign =
      HAlignType.right;

  final bytes = workbook.saveSync();
  // workbook.dispose();

  return bytes;
}
