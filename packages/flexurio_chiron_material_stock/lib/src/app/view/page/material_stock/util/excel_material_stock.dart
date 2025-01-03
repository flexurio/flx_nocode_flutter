import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<String> materialStockHeaders = [
  'period'.tr(),
  'material_group'.tr(),
  'material_name'.tr(),
  'Material ID',
  'NA',
  'beginning_balance'.tr(),
  'quantity_in'.tr(),
  'quantity_out'.tr(),
  'ending_balance'.tr(),
];

List<int> excelMaterialStock(List<MaterialStock> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, materialStockHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < materialStockHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(materialStockHeaders[i]);
  }

  for (var i = 0; i < materialStockHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }
  for (var i = 0; i < data.length; i++) {
    final materialStock = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(materialStock.period);
    sheet.getRangeByIndex(i + 2, 2).setValue(materialStock.materialGroup.id);
    sheet.getRangeByIndex(i + 2, 3).setValue(materialStock.material.name);
    sheet.getRangeByIndex(i + 2, 4).setValue(materialStock.material.id);
    sheet.getRangeByIndex(i + 2, 5).setValue(materialStock.na);
    sheet.getRangeByIndex(i + 2, 6).setValue(materialStock.beginningBalance);
    sheet.getRangeByIndex(i + 2, 7).setValue(materialStock.quantityIn);
    sheet.getRangeByIndex(i + 2, 8).setValue(materialStock.quantityOut);
    sheet.getRangeByIndex(i + 2, 9).setValue(materialStock.endingBalance);
  }

  for (var i = 0; i < materialStockHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}
