import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_material.freezed.dart';
part 'material_return_material.g.dart';

@freezed
class MaterialReturnMaterial with _$MaterialReturnMaterial {
  factory MaterialReturnMaterial({
    required String na,
    required double quantity,
    @JsonKey(name: 'quantity_remaining') required double quantityRemaining,
    @JsonKey(name: 'quantity_return') required double quantityReturn,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
  }) = _MaterialReturnMaterial;
  const MaterialReturnMaterial._();

  factory MaterialReturnMaterial.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnMaterialFromJson(json);
}
