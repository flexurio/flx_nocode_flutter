import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/table.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

List<int> excelReturnNote(List<FinanceReturnNote> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, financeReturnHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < financeReturnHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(financeReturnHeaders[i]);
  }

  for (var i = 0; i < financeReturnHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }
  for (var i = 0; i < data.length; i++) {
    final financeReturnNote = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(financeReturnNote.cnjNo);
    sheet.getRangeByIndex(i + 2, 2).setValue(financeReturnNote.srpNo);
    sheet.getRangeByIndex(i + 2, 3).setValue(financeReturnNote.returnNote);
    sheet.getRangeByIndex(i + 2, 4).setValue(financeReturnNote.deliveryNo);
    sheet.getRangeByIndex(i + 2, 5).setValue(financeReturnNote.deliveryDate);
    sheet.getRangeByIndex(i + 2, 6).setValue(financeReturnNote.taxInvoiceNo);
    sheet.getRangeByIndex(i + 2, 7).setValue(financeReturnNote.customer);
    sheet.getRangeByIndex(i + 2, 8).setValue(financeReturnNote.referenceNo);
    sheet.getRangeByIndex(i + 2, 9).setValue(financeReturnNote.division);
    sheet.getRangeByIndex(i + 2, 10).setValue(financeReturnNote.product);
    sheet.getRangeByIndex(i + 2, 11).setValue(financeReturnNote.quantity);
    sheet.getRangeByIndex(i + 2, 12).setValue(financeReturnNote.unit);
    sheet.getRangeByIndex(i + 2, 13).setValue(financeReturnNote.unitPrice);
    sheet.getRangeByIndex(i + 2, 14).setValue(financeReturnNote.price);
    sheet
        .getRangeByIndex(i + 2, 15)
        .setValue(financeReturnNote.discountPercent);
    sheet.getRangeByIndex(i + 2, 16).setValue(financeReturnNote.dpp);
    sheet.getRangeByIndex(i + 2, 17).setValue(financeReturnNote.ppn);
    sheet.getRangeByIndex(i + 2, 18).setValue(financeReturnNote.total);
    sheet.getRangeByIndex(i + 2, 19).setValue(financeReturnNote.expiredDate);
    sheet.getRangeByIndex(i + 2, 20).setValue(financeReturnNote.batch);
  }

  for (var i = 0; i < financeReturnHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  sheet.getRangeByIndex(2, 13, 2000, 13).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 14, 2000, 14).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 16, 2000, 18).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 17, 2000, 18).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 18, 2000, 18).numberFormat = '_(Rp* #,##0_)';

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}
