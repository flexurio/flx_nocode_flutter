import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final supplierHeaders = [
  'Code',
  'Name',
  'address'.tr(),
  'City',
  'Country',
  'Postal Code',
  'Phone',
  'Fax',
  'Contact Person',
  'Email',
  'Tax ID',
];

List<int> excelSupplier(List<Supplier> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, supplierHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < supplierHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(supplierHeaders[i]);
  }

  for (var i = 0; i < supplierHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < data.length; i++) {
    final supplier = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(supplier.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(supplier.name);
    sheet.getRangeByIndex(i + 2, 3).setValue(supplier.address);
    sheet.getRangeByIndex(i + 2, 4).setValue(supplier.city);
    sheet.getRangeByIndex(i + 2, 5).setValue(supplier.country);
    sheet.getRangeByIndex(i + 2, 6).setValue(supplier.postalCode);
    sheet.getRangeByIndex(i + 2, 7).setValue(supplier.phone);
    sheet.getRangeByIndex(i + 2, 8).setValue(supplier.fax);
    sheet.getRangeByIndex(i + 2, 9).setValue(supplier.pic);
    sheet.getRangeByIndex(i + 2, 10).setValue(supplier.email);
    sheet.getRangeByIndex(i + 2, 11).setValue(supplier.npwp);
  }

  for (var i = 0; i < supplierHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
