import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_detail_report.freezed.dart';
part 'material_issue_detail_report.g.dart';

@freezed
class MaterialIssuesDetailReport with _$MaterialIssuesDetailReport {
  factory MaterialIssuesDetailReport({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson) required MaterialIssue materialIssue,
    @JsonKey(name: 'material', fromJson: Material.fromJson) required Material material,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson) required MaterialUnit materialUnit,
    required String na,
    @JsonKey(name: 'quantity_required') required double quantityRequired,
    required double quantity,
    @JsonKey(name: 'weighted_quantity') required double weightedQuantity,
    @JsonKey(name: 'weighted_unit') required String weightedUnit,
    required int price,
    @JsonKey(name: 'total_price') required double totalPrice,
    required String warehouse,
    @JsonKey(name: 'design_code') String? designCode,
    @JsonKey(name: 'expired_date', fromJson: dateTimeNullable) required DateTime? expiredDate,
    @JsonKey(name: 'best_before', fromJson: dateTimeNullable) DateTime? bestBefore,
    @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable) DateTime? shelfLife,
    @JsonKey(name: 'retest_date', fromJson: dateTimeNullable) DateTime? retestDate,
    @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable) DateTime? retestDateQc,
    @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime) required DateTime manufacturingDate,
  }) = _MaterialIssuesDetailReport;
  const MaterialIssuesDetailReport._();

  factory MaterialIssuesDetailReport.fromJson(Map<String, dynamic> json) => _$MaterialIssuesDetailReportFromJson(json);
}
