import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelProductStock(List<ProductStock> productStocks) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet.getRangeByIndex(1, 1, 1, 11).setBuiltInStyle(BuiltInStyles.heading1);

  const colNumber = 11;
  String getHeaderLabel(int col) {
    switch (col) {
      case 1:
        return 'Period';
      case 2:
        return 'Batch';
      case 3:
        return 'Product Group';
      case 4:
        return 'Product Name';
      case 5:
        return 'Product ID';
      case 6:
        return 'Beginning Balance';
      case 7:
        return 'Quantity In';
      case 8:
        return 'Quantity Out';
      case 9:
        return 'Ending Balance';
      case 10:
        return 'Quantity Out Marketing';
      case 11:
        return 'Ending Balance Marketing';
      default:
        return '';
    }
  }

  for (var col = 1; col <= colNumber; col++) {
    sheet.getRangeByIndex(1, col).setValue(getHeaderLabel(col));
  }

  for (var i = 0; i < productStocks.length; i++) {
    final productStock = productStocks[i];
    sheet.getRangeByIndex(2 + i, 1).setValue(productStock.period);
    sheet.getRangeByIndex(2 + i, 2).setValue(productStock.batch.id);
    sheet
        .getRangeByIndex(2 + i, 3)
        .setValue(productStock.product.productGroup.id);
    sheet.getRangeByIndex(2 + i, 4).setValue(productStock.product.name);
    sheet.getRangeByIndex(2 + i, 5).setValue(productStock.product.id);
    sheet.getRangeByIndex(2 + i, 6).setValue(productStock.beginningBalance);
    sheet.getRangeByIndex(2 + i, 7).setValue(productStock.qtyIn);
    sheet.getRangeByIndex(2 + i, 8).setValue(productStock.qtyOut);
    sheet.getRangeByIndex(2 + i, 9).setValue(productStock.endingBalance);
    sheet.getRangeByIndex(2 + i, 10).setValue(productStock.qtyOutMarketing);
    sheet
        .getRangeByIndex(2 + i, 11)
        .setValue(productStock.endingBalanceMarketing);
  }

  sheet
    ..autoFitColumn(1)
    ..autoFitRow(1);

  for (var i = 0; i < colNumber; i++) {
    sheet.setColumnWidthInPixels(i + 1, i == 10 || i == 9 ? 210 : 160);
  }

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}
