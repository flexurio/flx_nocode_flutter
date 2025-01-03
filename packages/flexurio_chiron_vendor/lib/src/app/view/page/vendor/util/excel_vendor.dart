import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final vendorHeaders = [
  'Code',
  'name'.tr(),
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

List<int> excelVendor(List<Vendor> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, vendorHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < vendorHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(vendorHeaders[i]);
  }

  for (var i = 0; i < vendorHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }
  
  for (var i = 0; i < data.length; i++) {
    final vendor = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(vendor.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(vendor.name);
    sheet.getRangeByIndex(i + 2, 3).setValue(vendor.address);
    sheet.getRangeByIndex(i + 2, 4).setValue(vendor.city);
    sheet.getRangeByIndex(i + 2, 5).setValue(vendor.country);
    sheet.getRangeByIndex(i + 2, 6).setValue(vendor.postalCode);
    sheet.getRangeByIndex(i + 2, 7).setValue(vendor.phone);
    sheet.getRangeByIndex(i + 2, 8).setValue(vendor.fax);
    sheet.getRangeByIndex(i + 2, 9).setValue(vendor.pic);
    sheet.getRangeByIndex(i + 2, 10).setValue(vendor.email);
    sheet.getRangeByIndex(i + 2, 11).setValue(vendor.npwp);
  }

  for (var i = 0; i < vendorHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
