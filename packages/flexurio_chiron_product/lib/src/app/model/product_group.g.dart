// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductGroupImpl _$$ProductGroupImplFromJson(Map<String, dynamic> json) =>
    _$ProductGroupImpl(
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      (json['updated_by_id'] as num).toInt(),
      json['id'] as String,
    );

Map<String, dynamic> _$$ProductGroupImplToJson(_$ProductGroupImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
      'id': instance.id,
    };
