import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final materialsHeader = [
  'ID',
  'Material',
  'Manufacturer',
  'Supplier',
  'Halal Certificate Expired',
  'Halal Institution',
  'Halal No Certificate',
  'Storage Procedure',
  'Category',
  'Type',
  'Is Enable',
  'created_at'.tr(),
  'Updated At',
];

List<int> excelMaterialApproveVendor(List<MaterialApprovedVendor> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, materialsHeader.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < materialsHeader.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(materialsHeader[i]);
  }

  for (var i = 0; i < materialsHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < data.length; i++) {
    final materials = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(materials.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(materials.material.name);
    sheet.getRangeByIndex(i + 2, 3).setValue(materials.vendor.name);
    sheet.getRangeByIndex(i + 2, 4).setValue(materials.supplier.name);
    sheet
        .getRangeByIndex(i + 2, 5)
        .setValue(materials.halalCertificateExpired?.yMMMMd ?? '-');
    sheet.getRangeByIndex(i + 2, 6).setValue(materials.halalInstitution);
    sheet.getRangeByIndex(i + 2, 7).setValue(materials.halalNoCertificate);
    sheet.getRangeByIndex(i + 2, 8).setValue(materials.storageProcedure);
    sheet.getRangeByIndex(i + 2, 9).setValue(materials.category.label);
    sheet.getRangeByIndex(i + 2, 10).setValue(materials.type.label);
    sheet.getRangeByIndex(i + 2, 11).setValue(materials.isEnable);
    sheet.getRangeByIndex(i + 2, 12).setValue(materials.createdAt.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 13).setValue(materials.updatedAt.yMMMdHm);
  }

  for (var i = 0; i < materialsHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  return bytes;
}
