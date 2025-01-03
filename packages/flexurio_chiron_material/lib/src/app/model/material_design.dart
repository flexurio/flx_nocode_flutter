import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_design.freezed.dart';
part 'material_design.g.dart';

@freezed
class MaterialDesign with _$MaterialDesign {
  factory MaterialDesign(
    int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) DateTime createAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    String description,
    @JsonKey(name: 'updated_by_id') int updateById,
    @JsonKey(name: 'design_code') String designCode,
    @JsonKey(name: 'is_lock', defaultValue: false) bool isLock,
    @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
    @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
    ProductFormulation formulation,
  ) = _MaterialDesign;

  factory MaterialDesign.empty() => MaterialDesign(
        0,
        DateTime.now(),
        0,
        DateTime.now(),
        '',
        0,
        '',
        false,
        Material.empty(),
        ProductFormulation.empty(),
      );

  factory MaterialDesign.fromJson(Map<String, dynamic> json) =>
      _$MaterialDesignFromJson(json);

  static MaterialDesign? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$MaterialDesignFromJson(json as Map<String, dynamic>);
  }
}
