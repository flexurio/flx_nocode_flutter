import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_bom.freezed.dart';
part 'material_issue_bom.g.dart';

@freezed
class MaterialIssueBom with _$MaterialIssueBom {
  factory MaterialIssueBom({
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'scale') required String scale,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'quantity_material_issue') required int quantityMaterialIssue,
    @JsonKey(name: 'quantity_formulation') required int quantityFormulation,
    @JsonKey(name: 'quantity_material_return') required int quantityMaterialReturn,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
  }) = _MaterialIssueBom;
  const MaterialIssueBom._();

  factory MaterialIssueBom.fromJson(Map<String, dynamic> json) => _$MaterialIssueBomFromJson(json);
}
