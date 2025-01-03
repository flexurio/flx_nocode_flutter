import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_report.freezed.dart';
part 'material_receive_report.g.dart';

enum MaterialReceiveReportType implements ColorType {
  byStatus('by_status', Colors.purple),
  byPurchaseOrder('by_purchase_order', Colors.blue),
  byNonPurchaseOrder('by_non_purchase_order', Colors.amber);

  const MaterialReceiveReportType(this.label, this.color);

  @override
  final String label;

  @override
  final Color color;

  static List<MaterialReceiveReportType> get list => [
        MaterialReceiveReportType.byPurchaseOrder,
        MaterialReceiveReportType.byNonPurchaseOrder,
        MaterialReceiveReportType.byStatus,
      ];
}

@freezed
class MaterialReceiveReport with _$MaterialReceiveReport {
  factory MaterialReceiveReport({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
    required String unit,
    required int qty,
  }) = _MaterialReceiveReport;
  const MaterialReceiveReport._();

  factory MaterialReceiveReport.fromJson(Map<String, dynamic> json) =>
      _$MaterialReceiveReportFromJson(json);
}
