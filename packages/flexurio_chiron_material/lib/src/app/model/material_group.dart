import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_group.freezed.dart';
part 'material_group.g.dart';

enum MaterialGroupCategory implements ColorType {
  empty('', '', Colors.transparent),
  material('MATERIAL', 'Material', Colors.blue),
  product('PRODUCT', 'Product', Colors.purple),
  service('SERVICE', 'Service', Colors.orange);

  const MaterialGroupCategory(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static MaterialGroupCategory fromString(String id) {
    if (id == MaterialGroupCategory.product.id) {
      return MaterialGroupCategory.product;
    }
    if (id == MaterialGroupCategory.service.id) {
      return MaterialGroupCategory.service;
    }
    if (id == MaterialGroupCategory.material.id) {
      return MaterialGroupCategory.material;
    }
    return MaterialGroupCategory.empty;
  }
}

@freezed
class MaterialGroup with _$MaterialGroup {
  const factory MaterialGroup({
    required String id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'group_category', fromJson: MaterialGroupCategory.fromString)
    required MaterialGroupCategory category,
    @JsonKey(name: 'has_vendor', defaultValue: false) required bool hasVendor,
  }) = _MaterialGroup;
  const MaterialGroup._();

  factory MaterialGroup.id(String id) => MaterialGroup.empty().copyWith(id: id);

  factory MaterialGroup.empty() => MaterialGroup(
        id: '',
        createdById: 0,
        createdAt: DateTime.now(),
        updateById: 0,
        updatedAt: DateTime.now(),
        category: MaterialGroupCategory.empty,
        hasVendor: false,
      );

  factory MaterialGroup.fromJson(Map<String, Object?> json) =>
      _$MaterialGroupFromJson(json);

  ProductGroup get toProductGroup =>
      ProductGroup(createdAt, updatedAt, 0, 0, id);

  bool get isProduct => category == MaterialGroupCategory.product;
  bool get isPacking => id == 'KEMASAN';
  bool get isGeneral => id == 'UMUM';
  bool get isBasic => id == 'BAKU';
  bool get isAuxiliary => id == 'BANTU';
}
