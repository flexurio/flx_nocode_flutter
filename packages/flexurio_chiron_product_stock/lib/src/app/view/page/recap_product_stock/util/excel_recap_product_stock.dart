import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelRecapProductStock(List<RecapProductStock> recapProductStocks) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet.getRangeByIndex(1, 1, 1, 10).setBuiltInStyle(BuiltInStyles.heading1);

  const colNumber = 10;
  String getHeaderLabel(int col) {
    switch (col) {
      case 1:
        return 'Period';
      case 2:
        return 'Product Name';
      case 3:
        return 'Batch';
      case 4:
        return 'Quantity Quarantine';
      case 5:
        return 'Quantity Reject';
      case 6:
        return 'Quantity Release';
      case 7:
        return 'Warehouse';
      case 8:
        return 'Unit';
      case 9:
        return 'Create At';
      case 10:
        return 'Updated At';
      default:
        return '';
    }
  }

  for (var col = 1; col <= colNumber; col++) {
    sheet.getRangeByIndex(1, col).setValue(getHeaderLabel(col));
  }

  for (var i = 0; i < recapProductStocks.length; i++) {
    final productStock = recapProductStocks[i];
    sheet.getRangeByIndex(2 + i, 1).setValue(productStock.period.yMMMM);
    sheet.getRangeByIndex(2 + i, 2).setValue(productStock.product.name);
    sheet.getRangeByIndex(2 + i, 3).setValue(productStock.productionOrder.id);
    sheet.getRangeByIndex(2 + i, 4).setValue(productStock.qtyQuarantine);
    sheet.getRangeByIndex(2 + i, 5).setValue(productStock.qtyReject);
    sheet.getRangeByIndex(2 + i, 6).setValue(productStock.qtyRelease);
    sheet.getRangeByIndex(2 + i, 7).setValue(productStock.warehouse.id);
    sheet.getRangeByIndex(2 + i, 8).setValue(productStock.unit.id);
    sheet.getRangeByIndex(2 + i, 9).setValue(productStock.createdAt);
    sheet.getRangeByIndex(2 + i, 10).setValue(productStock.updatedAt);
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
