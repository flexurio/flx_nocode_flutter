import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

final headers = [
  'ID',
  'product_id'.tr(),
  'product_name'.tr(),
  'type'.tr(),
  'scale'.tr(),
  'material_group'.tr(),
  'quantity'.tr(),
  'Unit',
  'material_id'.tr(),
  'material_name'.tr(),
  'quantity_material'.tr(),
  'active'.tr(),
  'created_at'.tr(),
  'updated_at'.tr(),
];

List<int> excelBillOfMaterial(List<ProductFormulationDetail> data) {
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
    final materials = data[i];
    sheet.getRangeByIndex(i + 2, 1).setValue(materials.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(materials.formulation.product.id);
    sheet
        .getRangeByIndex(i + 2, 3)
        .setValue(materials.formulation.product.name);
    sheet
        .getRangeByIndex(i + 2, 4)
        .setValue(materials.formulation.type.productFormulationType);
    sheet
        .getRangeByIndex(i + 2, 5)
        .setValue(materials.formulation.scale.productFormulationScale);
    sheet
        .getRangeByIndex(i + 2, 6)
        .setValue(materials.formulation.type.productFormulationType);
    sheet
        .getRangeByIndex(i + 2, 7)
        .setValue(materials.formulation.quantity.format());
    sheet.getRangeByIndex(i + 2, 8).setValue(materials.formulation.unit);
    sheet.getRangeByIndex(i + 2, 9).setValue(materials.material.id);
    sheet.getRangeByIndex(i + 2, 10).setValue(materials.material.name);
    sheet.getRangeByIndex(i + 2, 11).setValue(materials.quantity.toString());
    sheet
        .getRangeByIndex(i + 2, 12)
        .setValue(materials.formulation.isActive.toString());
    sheet.getRangeByIndex(i + 2, 13).setValue(materials.createdAt.yMMMdHm);
    sheet.getRangeByIndex(i + 2, 14).setValue(materials.updatedAt.yMMMdHm);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  return bytes;
}
