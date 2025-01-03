// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      json['id'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      DepartmentGroup.fromJson(
          json['department_group'] as Map<String, dynamic>),
      DepartmentType.fromJson(json['department_type'] as Map<String, dynamic>),
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'department_group': instance.departmentGroup,
      'department_type': instance.departmentType,
      'name': instance.name,
      'email': instance.email,
    };
