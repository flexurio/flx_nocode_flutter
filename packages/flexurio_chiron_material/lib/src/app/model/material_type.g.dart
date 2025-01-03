// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialTypeImpl _$$MaterialTypeImplFromJson(Map<String, dynamic> json) =>
    _$MaterialTypeImpl(
      id: json['id'] as String,
      createAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$MaterialTypeImplToJson(_$MaterialTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'material_group': instance.materialGroup,
      'type': instance.type,
    };
