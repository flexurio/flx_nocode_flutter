// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionLineImpl _$$ProductionLineImplFromJson(Map<String, dynamic> json) =>
    _$ProductionLineImpl(
      (json['id'] as num).toInt(),
      json['name'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$ProductionLineImplToJson(
        _$ProductionLineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
