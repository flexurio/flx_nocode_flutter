// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialImpl _$$MaterialImplFromJson(Map<String, dynamic> json) =>
    _$MaterialImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      company: json['company'] as String? ?? '',
      halalCertificateId: json['halal_certificate_id'] as String?,
      isAsset: json['is_asset'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      isOrder: json['is_order'] as bool? ?? false,
      isStock: json['is_stock'] as bool? ?? false,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      stockUnit:
          MaterialUnit.fromJson(json['stock_unit'] as Map<String, Object?>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
      materialType:
          MaterialType.fromJson(json['material_type'] as Map<String, dynamic>),
      packSize: (json['pack_size'] as num?)?.toDouble() ?? 0,
      isLockQuantityMaterialIssue: json['is_lock_qty_mi'] as bool? ?? true,
    );

Map<String, dynamic> _$$MaterialImplToJson(_$MaterialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company': instance.company,
      'halal_certificate_id': instance.halalCertificateId,
      'is_asset': instance.isAsset,
      'is_active': instance.isActive,
      'is_order': instance.isOrder,
      'is_stock': instance.isStock,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'material_unit': instance.materialUnit,
      'stock_unit': instance.stockUnit,
      'material_group': instance.materialGroup,
      'material_type': instance.materialType,
      'pack_size': instance.packSize,
      'is_lock_qty_mi': instance.isLockQuantityMaterialIssue,
    };
