import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final headers = [
  'ID',
  'Purchase Request ID',
  'Status',
  'Supplier',
  'Manufacturer',
  'delivery_date'.tr(),
  'Total',
  'created_by'.tr(),
  'created_at'.tr(),
  'Updated By',
  'Updated At',
];

List<int> excelPurchaseOrder(List<PurchaseOrder> data) {
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
    final order = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(order.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(order.materialRequest.id);
    sheet.getRangeByIndex(i + 2, 3).setValue(order.status.id);
    sheet.getRangeByIndex(i + 2, 4).setValue(order.supplier.name);
    sheet
        .getRangeByIndex(i + 2, 5)
        .setValue(order.materialRequest.vendor?.name ?? '-');
    sheet.getRangeByIndex(i + 2, 6).setValue(order.deliveryDate.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 7).setValue(order.total.format());
    sheet.getRangeByIndex(i + 2, 8).setValue(order.createdById);
    sheet.getRangeByIndex(i + 2, 9).setValue(order.createdAt.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 10).setValue(order.updateById);
    sheet.getRangeByIndex(i + 2, 11).setValue(order.updatedAt.yMMMdHm);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
