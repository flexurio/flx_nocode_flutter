import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_unit.freezed.dart';
part 'material_unit.g.dart';

enum MaterialUnitType implements ColorType {
  general('GENERAL', Colors.blue),
  material('MATERIAL', Colors.purple),
  asset('ASSET', Colors.orange),
  empty('', Colors.red),
  produk('PRODUK', Colors.green),
  product('PRODUCT', Colors.green);

  const MaterialUnitType(this.type, this.color);
  @override
  String get label => type;

  List<MaterialUnitType> get list => [];

  @override
  final Color color;
  final String type;
}

@freezed
class MaterialUnit with _$MaterialUnit {
  factory MaterialUnit({
    required String id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(fromJson: _materialUnitTypeFromString)
    required MaterialUnitType type,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
  }) = _MaterialUnit;

  factory MaterialUnit.empty() {
    return MaterialUnit(
      id: '',
      createdById: 0,
      type: MaterialUnitType.empty,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      updateById: 0,
    );
  }
  const MaterialUnit._();

  factory MaterialUnit.fromJson(Map<String, Object?> json) =>
      _$MaterialUnitFromJson(json);

  static MaterialUnit? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$MaterialUnitFromJson(json as Map<String, dynamic>);
  }
}

MaterialUnitType _materialUnitTypeFromString(String type) {
  if (type == MaterialUnitType.asset.type) {
    return MaterialUnitType.asset;
  }
  if (type == MaterialUnitType.general.type) {
    return MaterialUnitType.general;
  }
  if (type == MaterialUnitType.material.type) {
    return MaterialUnitType.material;
  }
  if (type == MaterialUnitType.product.type) {
    return MaterialUnitType.product;
  }
  if (type == MaterialUnitType.product.type) {
    return MaterialUnitType.product;
  }
  if (type == MaterialUnitType.produk.type) {
    return MaterialUnitType.produk;
  }
  return MaterialUnitType.empty;
}
