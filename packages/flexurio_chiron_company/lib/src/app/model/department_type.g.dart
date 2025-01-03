// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentTypeImpl _$$DepartmentTypeImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentTypeImpl(
      json['id'] as String,
      json['name'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$DepartmentTypeImplToJson(
        _$DepartmentTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
