// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialDesignImpl _$$MaterialDesignImplFromJson(Map<String, dynamic> json) =>
    _$MaterialDesignImpl(
      (json['id'] as num).toInt(),
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      json['description'] as String,
      (json['updated_by_id'] as num).toInt(),
      json['design_code'] as String,
      json['is_lock'] as bool? ?? false,
      Material.fromJson(json['material'] as Map<String, Object?>),
      ProductFormulation.fromJson(json['formulation'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$MaterialDesignImplToJson(
        _$MaterialDesignImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'description': instance.description,
      'updated_by_id': instance.updateById,
      'design_code': instance.designCode,
      'is_lock': instance.isLock,
      'material': instance.material,
      'formulation': instance.formulation,
    };
