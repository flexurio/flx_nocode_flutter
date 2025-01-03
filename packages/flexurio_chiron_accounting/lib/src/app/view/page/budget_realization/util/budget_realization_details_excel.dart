import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelBudgetRealizationDetails(BudgetRealization budgetRealization) {
  final header = [
    'month'.tr(),
    '% ${'achievement'.tr()}',
  ];
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet
      .getRangeByIndex(1, 1, 1, header.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var col = 0; col < header.length; col++) {
    sheet.getRangeByIndex(1, col + 1).setValue(header[col]);
  }

  for (var i = 0; i < header.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < budgetRealization.months.length; i++) {
    final month = budgetRealization.months[i];
    sheet
        .getRangeByIndex(2 + i, 1)
        .setValue(DateFormat('MMMM').format(DateTime(0, i + 1)));
    sheet.getRangeByIndex(2 + i, 2)
      ..setValue(month)
      ..cellStyle.hAlign = HAlignType.right;
  }
  sheet.getRangeByIndex(14, 1).setValue('YTD');
  sheet.getRangeByIndex(14, 2)
    ..setValue(budgetRealization.yearToDate)
    ..cellStyle.hAlign = HAlignType.right;

  for (var i = 0; i < header.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
