import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

const headers = [
  'Product ID',
  'Product Name',
  'Tipe',
  'Skala',
  'Aktif Produktif',
  'Material ID',
  'Material Name',
  'Material Group',
  'Satuan',
  'Kode Desain',
];

List<int> excelMaterialDesign(List<MaterialDesign> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet
      .getRangeByIndex(1, 1, 1, headers.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var col = 0; col < headers.length; col++) {
    sheet.getRangeByIndex(1, col + 1).setValue(headers[col]);
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < data.length; i++) {
    final material = data[i];
    var active = '';
    if (material.formulation.isActive == true) {
      active = 'AKTIF';
    } else {
      active = 'TIDAK';
    }
    sheet.getRangeByIndex(2 + i, 1).setValue(material.formulation.product.id);
    sheet.getRangeByIndex(2 + i, 2).setValue(material.formulation.product.name);
    sheet
        .getRangeByIndex(2 + i, 3)
        .setValue(material.formulation.type.productFormulationType);
    sheet
        .getRangeByIndex(2 + i, 4)
        .setValue(material.formulation.scale.productFormulationScale);
    sheet.getRangeByIndex(2 + i, 5).setValue(active);
    sheet.getRangeByIndex(2 + i, 6).setValue(material.material.id);
    sheet.getRangeByIndex(2 + i, 7).setValue(material.material.name);
    sheet
        .getRangeByIndex(2 + i, 8)
        .setValue(material.material.materialGroup.id);
    sheet.getRangeByIndex(2 + i, 9).setValue(material.material.materialUnit.id);
    sheet.getRangeByIndex(2 + i, 10).setValue(material.designCode);
  }
  final bytes = workbook.saveSync();

  return bytes;
}
