import 'package:flexurio_chiron_product/src/app/model/product_price.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final header = [
  'ID',
  'No',
  'Name',
  'Product Group',
  'Start Date',
  'Price',
  'Primary Price',
  'Bonus Price',
  'Strip Price',
  'Tablet Price',
  'currency'.tr(),
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

List<int> excelProductPrice(
  List<ProductPrice> prices,
) {
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

  for (var i = 0; i < prices.length; i++) {
    final price = prices[i];
    sheet.getRangeByIndex(2 + i, 1).setValue(price.product.id);
    sheet.getRangeByIndex(2 + i, 2).setValue(price.product.productNo);
    sheet.getRangeByIndex(2 + i, 3).setValue(price.product.name);
    sheet.getRangeByIndex(2 + i, 4).setValue(price.product.productGroup.id);
    sheet.getRangeByIndex(2 + i, 5).setValue(price.startDate.yMMMMd);
    sheet.getRangeByIndex(2 + i, 6).setValue(price.price.format());
    sheet.getRangeByIndex(2 + i, 7).setValue(price.primaryPrice.format());
    sheet.getRangeByIndex(2 + i, 8).setValue(price.bonusPrice.format());
    sheet.getRangeByIndex(2 + i, 9).setValue(price.stripPrice.format());
    sheet.getRangeByIndex(2 + i, 10).setValue(price.tabletPrice.format());
    sheet.getRangeByIndex(2 + i, 11).setValue(price.currency.id);
    sheet.getRangeByIndex(2 + i, 12).setValue(price.product.unitPacking.id);
    sheet.getRangeByIndex(2 + i, 13).setValue(price.product.unitSmallest.id);
    sheet.getRangeByIndex(2 + i, 14).setValue(price.product.unitOrder.id);
    sheet.getRangeByIndex(2 + i, 15).setValue(price.product.unitSecondary.id);
    sheet.getRangeByIndex(2 + i, 16).setValue(price.product.division.id);
    sheet
        .getRangeByIndex(2 + i, 17)
        .setValue('${price.product.expiryPeriod} Month');
    sheet.getRangeByIndex(2 + i, 18).setValue(price.product.tollOut.toString());
    sheet
        .getRangeByIndex(2 + i, 19)
        .setValue(price.product.productType.productType);
    sheet.getRangeByIndex(2 + i, 20).setValue(price.product.quantityTablet);
    sheet.getRangeByIndex(2 + i, 21).setValue(price.product.quantityStrip);
    sheet.getRangeByIndex(2 + i, 22).setValue(price.product.quantityBatch);
    sheet.getRangeByIndex(2 + i, 23).setValue(price.product.quantityPack);
    sheet
        .getRangeByIndex(2 + i, 24)
        .setValue(DateFormat().format(price.product.createAt));
    sheet
        .getRangeByIndex(2 + i, 25)
        .setValue(DateFormat().format(price.product.updatedAt));
  }

  for (var i = 0; i < header.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
