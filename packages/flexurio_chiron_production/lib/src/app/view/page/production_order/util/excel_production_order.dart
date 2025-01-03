import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
// import 'package:flexurio_erp_finance/src/app/model/petty_cash.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final headers = [
  // 'ID',
  'Periode',
  'Kode Produk',
  'Nama Produk',
  'Batch',
  'Batch Size',
  'Divisi',
  'Skala',
  // 'created_by'.tr(),
  // 'created_at'.tr(),
  // 'Updated By',
  // 'Updated At',
];

List<int> excelProductionOrder(List<ProductionOrder> data) {
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
    final productionOrder = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 3).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 4).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 5).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 6).setValue(productionOrder.id);
    sheet.getRangeByIndex(i + 2, 7).setValue(productionOrder.id);
    // sheet.getRangeByIndex(i + 2, 7).setValue(pettyCash.createdById);
    // sheet.getRangeByIndex(i + 2, 8).setValue(pettyCash.createdAt.yMMMdHm);
    // sheet.getRangeByIndex(i + 2, 9).setValue(pettyCash.updateById);
    // sheet.getRangeByIndex(i + 2, 10).setValue(pettyCash.updatedAt.yMMMdHm);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  return bytes;
}
