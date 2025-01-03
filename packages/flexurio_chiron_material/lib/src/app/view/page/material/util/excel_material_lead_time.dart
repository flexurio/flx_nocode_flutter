import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

const materialLeadTimeHeaders = [
  'Matgroup',
  'Material Code',
  'Material Name',
  'Supplier Code',
  'Suuppler Name',
  'LeadTime',
  'Satuan LeadTime',
  'Unit',
];

List<int> excelMaterialLeadTime(List<MaterialSupplierLeadTime> data) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  sheet
      .getRangeByIndex(1, 1, 1, materialLeadTimeHeaders.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var i = 0; i < materialLeadTimeHeaders.length; i++) {
    sheet.getRangeByIndex(1, i + 1).setValue(materialLeadTimeHeaders[i]);
  }

  for (var i = 0; i < materialLeadTimeHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < data.length; i++) {
    final leadtime = data[i];

    // sheet.getRangeByIndex(i + 2, 1).setValue(leadtime.materialGroup.id);
    sheet.getRangeByIndex(i + 2, 2).setValue(leadtime.material.id);
    sheet.getRangeByIndex(i + 2, 3).setValue(leadtime.material.name);
    sheet.getRangeByIndex(i + 2, 4).setValue(leadtime.vendor.id);
    sheet.getRangeByIndex(i + 2, 5).setValue(leadtime.vendor.name);
    sheet.getRangeByIndex(i + 2, 6).setValue(leadtime.leadTime);
    sheet.getRangeByIndex(i + 2, 7).setValue('days');
    sheet.getRangeByIndex(i + 2, 8).setValue(leadtime.material.materialUnit.id);
  }

  for (var i = 0; i < materialLeadTimeHeaders.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  sheet.getRangeByIndex(2, 8, 2000, 13).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 9, 2000, 14).numberFormat = '_(Rp* #,##0_)';
  sheet.getRangeByIndex(2, 13, 2000, 18).numberFormat = '_(Rp* #,##0_)';

  final bytes = workbook.saveSync();
  workbook.dispose();

  return bytes;
}
