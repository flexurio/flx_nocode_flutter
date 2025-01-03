import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:easy_localization/easy_localization.dart';

String calculateStatus(
    DateTime? confirmPpicAt, DateTime? qualityAssuranceCheckDate) {
  if (confirmPpicAt == null) {
    return '-';
  }

  final workDaysDifference =
      calculateWorkDays(confirmPpicAt, qualityAssuranceCheckDate);

  if (workDaysDifference <= 2) {
    return 'MS';
  } else {
    return 'TMS';
  }
}

int calculateWorkDays(
    DateTime confirmPpicAt, DateTime? qualityAssuranceCheckDate) {
  if (qualityAssuranceCheckDate == null) {
    return 0;
  }

  final difference = qualityAssuranceCheckDate.difference(confirmPpicAt).inDays;

  return difference;
}

List<int> productReturnReceiveQaCheckExcel<T>({
  required BuildContext context,
  required List<ProductReturnReceiveReport> data,
}) {
  final theme = Theme.of(context);
  final primaryColor = theme.colorScheme.primary;

  final workbook = Workbook();
  final sheet = workbook.worksheets[0];

  List<TColumn<ProductReturnReceiveReport>> columns = [
    TColumn(
      title: 'product_return_create_at'.tr(),
      builder: (data, index) {
        return data.productReturn.createdAt.yMMMd;
      },
    ),
    TColumn(
      title: 'product_return_id'.tr(),
      builder: (data, index) => data.productReturn.id,
    ),
    TColumn(
      title: 'division'.tr(),
      builder: (data, index) => 'PT. METISKA FARMA',
    ),
    TColumn(
      title: 'customer_id'.tr(),
      builder: (data, index) => data.productReturn.customer.id,
    ),
    TColumn(
      title: 'reference_no'.tr(),
      builder: (data, index) => data.productReturn.referenceNo,
    ),
    TColumn(
      title: 'return_type'.tr(),
      builder: (data, index) => data.productReturn.transactionType.name,
    ),
    TColumn(
      title: 'product_id'.tr(),
      builder: (data, index) => data.productId.id,
    ),
    TColumn(
      title: 'product_name'.tr(),
      builder: (data, index) => data.productId.name,
    ),
    TColumn(
      title: 'quantity'.tr(),
      builder: (data, index) => data.quantity.format(),
    ),
    TColumn(
      title: 'quantity_check'.tr(),
      builder: (data, index) => data.quantityCheck.format(),
    ),
    TColumn(
      title: 'quantity_quality_assurance_check'.tr(),
      builder: (data, index) => data.quantityQualityAssuranceCheck.format(),
    ),
    TColumn(
      title: 'unit'.tr(),
      builder: (data, index) => data.unitId,
    ),
    TColumn(
      title: 'price'.tr(),
      builder: (data, index) => data.productPrice.format(),
    ),
    TColumn(
      title: 'total_price'.tr(),
      builder: (data, index) => data.totalProductPrice.format(),
    ),
    TColumn(
      title: 'batch_no'.tr(),
      builder: (data, index) => data.batchNo,
    ),
    TColumn(
      title: 'expired_date'.tr(),
      builder: (data, index) => data.expirationDate?.ddMMyyyySlash ?? '',
    ),
    TColumn(
      title: 'status_check_quality_assurance'.tr(),
      builder: (data, index) => data.status,
    ),
    TColumn(
      title: 'confirm_ppic_at'.tr(),
      builder: (data, index) =>
          data.productReturn.confirmPpicAt?.ddMMyyyySlash ?? '',
    ),
    TColumn(
      title: 'quality_assurance_check_date'.tr(),
      builder: (data, index) => data.qualityAssuranceCheckDate.ddMMyyyySlash,
    ),
    TColumn(
      title: 'status'.tr(),
      builder: (data, index) {
        final status = calculateStatus(
          data.productReturn.confirmPpicAt,
          data.qualityAssuranceCheckDate,
        );
        return status;
      },
    ),
  ];

  final headers = columns.map((e) => e.title).toList();
  final columnsCount = columns.length;

  sheet.getRangeByIndex(1, 1, 1, headers.length)
    ..cellStyle.backColorRgb = primaryColor
    ..cellStyle.fontColor = '#FFFFFF'
    ..cellStyle.bold = true
    ..cellStyle.fontName
    ..cellStyle.fontSize = 14;

  for (var i = 0; i < headers.length; i++) {
    final cell = sheet.getRangeByIndex(1, i + 1)..setValue(headers[i]);
    if (columns[i].numeric) {
      cell.cellStyle.hAlign = HAlignType.right;
    }
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  for (var row = 0; row < data.length; row++) {
    final item = data[row];

    for (var col = 0; col < columnsCount; col++) {
      final column = columns[col];
      final cell = sheet.getRangeByIndex(row + 2, col + 1)
        ..setValue(column.builder(item, row))
        ..cellStyle.backColorRgb = (row + 2).isEven
            ? primaryColor.lighten(.25)
            : primaryColor.lighten(.3);
      if (columns[col].numeric) {
        cell.cellStyle.hAlign = HAlignType.right;
      }
    }
  }

  for (var i = 0; i < headers.length; i++) {
    sheet
      ..autoFitColumn(1 + i)
      ..autoFitRow(1);
  }

  final bytes = workbook.saveSync();
  return bytes;
}
