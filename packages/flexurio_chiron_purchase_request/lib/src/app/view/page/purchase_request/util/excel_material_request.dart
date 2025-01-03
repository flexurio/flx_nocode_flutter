import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final materialRequestHeader = [
  'Period',
  'department'.tr(),
  'Material Request ID',
  'Date Material Request',
  'Material Name',
  'Product Name',
  'No Batch',
  'Qty',
  'Unit',
  'Design Code',
  'Date of Need',
  'Due Date',
  'Manufacturer',
  'material_group'.tr(),
  'description'.tr(),
  'Status',
  'Status Date of Need',
];

List<int> excelMaterialRequest(List<PurchaseRequestDetail> materialRequest) {
  final workbook = Workbook();
  final sheet = workbook.worksheets[0];
  sheet
      .getRangeByIndex(1, 1, 1, materialRequestHeader.length)
      .setBuiltInStyle(BuiltInStyles.heading1);

  for (var column = 0; column < materialRequestHeader.length; column++) {
    sheet
        .getRangeByIndex(1, column + 1)
        .setValue(materialRequestHeader[column]);
  }

  for (var i = 0; i < materialRequestHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var i = 0; i < materialRequest.length; i++) {
    final periodFormat = DateFormat('yyyyMM');
    final materials = materialRequest[i];
    final dateOfNeed = materials.materialRequest?.dateOfNeed ?? DateTime(0);
    final dueDate = materials.dueDate;
    final detailStatus = dueDate.isAfter(dateOfNeed) ? 'NOT OK' : 'OK';
    sheet.getRangeByIndex(2 + i, 1).setValue(
          periodFormat.format(materials.createdAt),
        );
    sheet
        .getRangeByIndex(2 + i, 2)
        .setValue(materials.materialRequest?.department.name ?? '-');
    sheet
        .getRangeByIndex(2 + i, 3)
        .setValue(materials.materialRequest?.id ?? '-');
    sheet
        .getRangeByIndex(2 + i, 4)
        .setValue(materials.materialRequest?.createdAt.yMMMMd);
    sheet.getRangeByIndex(2 + i, 5).setValue(materials.material?.name ?? '-');
    sheet.getRangeByIndex(2 + i, 6).setValue(materials.product?.name ?? '-');
    sheet.getRangeByIndex(2 + i, 7).setValue(materials.batchNo ?? '-');
    sheet.getRangeByIndex(2 + i, 8).setValue(materials.quantity.format());
    sheet.getRangeByIndex(2 + i, 9).setValue(materials.unit.id);
    sheet
        .getRangeByIndex(2 + i, 10)
        .setValue(materials.materialDesign?.designCode);
    sheet
        .getRangeByIndex(2 + i, 11)
        .setValue(materials.materialRequest?.dateOfNeed.yMMMMd ?? '-');
    sheet.getRangeByIndex(2 + i, 12).setValue(materials.dueDate.yMMMMd);
    sheet
        .getRangeByIndex(2 + i, 13)
        .setValue(materials.materialRequest?.vendor?.name ?? '-');
    sheet
        .getRangeByIndex(2 + i, 14)
        .setValue(materials.materialRequest?.materialGroup.id ?? '-');
    sheet
        .getRangeByIndex(2 + i, 15)
        .setValue(materials.materialRequest?.description ?? '-');
    sheet.getRangeByIndex(2 + i, 16).setValue(materials.status.label);
    sheet.getRangeByIndex(2 + i, 17).setValue(detailStatus);
  }

  for (var i = 0; i < materialRequestHeader.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();

  return bytes;
}
