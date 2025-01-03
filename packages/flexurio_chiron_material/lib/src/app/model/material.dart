import 'package:equatable/equatable.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material.freezed.dart';
part 'material.g.dart';

@freezed
class Material extends Equatable with _$Material {
  const factory Material({
    required String id,
    required String name,
    @JsonKey(defaultValue: '') required String company,
    @JsonKey(name: 'halal_certificate_id') required String? halalCertificateId,
    @JsonKey(name: 'is_asset', defaultValue: false) required bool isAsset,
    @JsonKey(name: 'is_active', defaultValue: false) required bool isActive,
    @JsonKey(name: 'is_order', defaultValue: false) required bool isOrder,
    @JsonKey(name: 'is_stock', defaultValue: false) required bool isStock,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit materialUnit,
    @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit stockUnit,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup materialGroup,
    @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
    required MaterialType materialType,
    @JsonKey(name: 'pack_size', defaultValue: 0) required double packSize,
    @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
    required bool isLockQuantityMaterialIssue,
  }) = _Material;
  const Material._();

  factory Material.empty() => Material(
        isLockQuantityMaterialIssue: true,
        company: '',
        id: '',
        name: '',
        halalCertificateId: '',
        isAsset: false,
        isActive: false,
        createdAt: DateTime(0),
        updatedAt: DateTime(0),
        materialUnit: MaterialUnit.empty(),
        stockUnit: MaterialUnit.empty(),
        materialType: MaterialType.empty(),
        materialGroup: MaterialGroup.empty(),
        packSize: 0,
        isOrder: false,
        isStock: false,
      );

  factory Material.fromJson(Map<String, Object?> json) =>
      _$MaterialFromJson(json);

  static Material? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$MaterialFromJson(json as Map<String, dynamic>);
  }

  @override
  List<Object> get props => [id];
}
