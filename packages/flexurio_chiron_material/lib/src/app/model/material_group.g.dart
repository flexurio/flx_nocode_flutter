// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialGroupImpl _$$MaterialGroupImplFromJson(Map<String, dynamic> json) =>
    _$MaterialGroupImpl(
      id: json['id'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      category:
          MaterialGroupCategory.fromString(json['group_category'] as String),
      hasVendor: json['has_vendor'] as bool? ?? false,
    );

Map<String, dynamic> _$$MaterialGroupImplToJson(_$MaterialGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'group_category': _$MaterialGroupCategoryEnumMap[instance.category]!,
      'has_vendor': instance.hasVendor,
    };

const _$MaterialGroupCategoryEnumMap = {
  MaterialGroupCategory.empty: 'empty',
  MaterialGroupCategory.material: 'material',
  MaterialGroupCategory.product: 'product',
  MaterialGroupCategory.service: 'service',
};
