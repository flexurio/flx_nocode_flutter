import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final headers = [
  'Name',
  'COA',
  'Group Name',
  'Status',
  'Factory Overhead',
  'created_at'.tr(),
  'Updated At',
  'created_by'.tr(),
  'Updated By',
];

List<int> excelCoaNumber(List<ChartOfAccountNumber> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, headers.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < headers.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(headers[i]);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < data.length; i++) {
    final coaNumber = data[i];
    late String factoryOverhead;
    if (coaNumber.isFactoryOverhead == true) {
      factoryOverhead = 'True';
    } else {
      factoryOverhead = 'False';
    }
    sheet.getRangeByIndex(i + 2, 1).setValue(coaNumber.name);
    sheet.getRangeByIndex(i + 2, 2).setValue(coaNumber.id);
    sheet.getRangeByIndex(i + 2, 3).setValue(
          coaNumber.chartOfAccountGroup.balanceGroup.name,
        );
    sheet.getRangeByIndex(i + 2, 4).setValue(coaNumber.status.label);
    sheet.getRangeByIndex(i + 2, 5).setValue(factoryOverhead);
    sheet.getRangeByIndex(i + 2, 6).setValue(coaNumber.createdAt.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 7).setValue(coaNumber.createdById);
    sheet.getRangeByIndex(i + 2, 8).setValue(coaNumber.updatedAt.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 9).setValue(coaNumber.updateById);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  return bytes;
}
