import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final productHeader = [
  'ID',
  'No',
  'Name',
  'NIE',
  'Product Group',
  'Unit Packing',
  'Unit Smallest',
  'Unit Order',
  'Unit Secondary',
  'Division',
  'Expiry Period',
  'Toll Out',
  'Type',
  'Quantity Tablet',
  'Quantity Strip',
  'Quantity Batch',
  'Quantity Pack',
  'created_at'.tr(),
  'Updated At',
];

List<int> excelProduct(List<Product> products) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet
      .getRangeByIndex(1, 1, 1, productHeader.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var col = 0; col < productHeader.length; col++) {
    sheet.getRangeByIndex(1, col + 1).setValue(productHeader[col]);
  }

  for (var i = 0; i < productHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < products.length; i++) {
    final product = products[i];
    sheet.getRangeByIndex(2 + i, 1).setValue(product.id);
    sheet.getRangeByIndex(2 + i, 2).setValue(product.productNo);
    sheet.getRangeByIndex(2 + i, 3).setValue(product.name);
    sheet.getRangeByIndex(2 + i, 4).setValue(product.nie ?? '-');
    sheet.getRangeByIndex(2 + i, 5).setValue(product.productGroup.id);
    sheet.getRangeByIndex(2 + i, 6).setValue(product.unitPacking.id);
    sheet.getRangeByIndex(2 + i, 7).setValue(product.unitSmallest.id);
    sheet.getRangeByIndex(2 + i, 8).setValue(product.unitOrder.id);
    sheet.getRangeByIndex(2 + i, 9).setValue(product.unitSecondary.id);
    sheet.getRangeByIndex(2 + i, 10).setValue(product.division.label);
    sheet.getRangeByIndex(2 + i, 11).setValue('${product.expiryPeriod} Month');
    sheet.getRangeByIndex(2 + i, 12).setValue(product.tollOut.toString());
    sheet.getRangeByIndex(2 + i, 13).setValue(product.productType.productType);
    sheet.getRangeByIndex(2 + i, 14).setValue(product.quantityTablet);
    sheet.getRangeByIndex(2 + i, 15).setValue(product.quantityStrip);
    sheet.getRangeByIndex(2 + i, 16).setValue(product.quantityBatch);
    sheet.getRangeByIndex(2 + i, 17).setValue(product.quantityPack);
    sheet
        .getRangeByIndex(2 + i, 18)
        .setValue(DateFormat().format(product.createAt));
    sheet
        .getRangeByIndex(2 + i, 19)
        .setValue(DateFormat().format(product.updatedAt));
  }

  for (var i = 0; i < productHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
