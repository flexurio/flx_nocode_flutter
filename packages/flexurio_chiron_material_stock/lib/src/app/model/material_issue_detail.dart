import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_detail.freezed.dart';
part 'material_issue_detail.g.dart';

@freezed
class MaterialIssueDetail with _$MaterialIssueDetail {
  factory MaterialIssueDetail({
    required int id,
    required String na,
    required double quantity,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
    required MaterialIssue materialIssue,
    @JsonKey(name: 'material', fromJson: Material.fromJson)
    required Material material,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit materialUnit,
    @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
    required Warehouse warehouse,
    @JsonKey(name: 'weighted_quantity') required double weightedQuantity,
    @JsonKey(name: 'weighted_unit') required String weightedUnit,
    @JsonKey(name: 'design_code') String? designCode,
    @JsonKey(name: 'quantity_required') required double quantityRequired,
  }) = _MaterialIssueDetail;
  const MaterialIssueDetail._();

  factory MaterialIssueDetail.fromJson(Map<String, dynamic> json) =>
      _$MaterialIssueDetailFromJson(json);
}
