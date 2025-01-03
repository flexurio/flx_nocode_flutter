// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentGroupImpl _$$DepartmentGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$DepartmentGroupImpl(
      json['id'] as String,
      json['name'] as String,
      json['email'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$DepartmentGroupImplToJson(
        _$DepartmentGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
