// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionStageImpl _$$ProductionStageImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionStageImpl(
      (json['id'] as num).toInt(),
      json['name'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$ProductionStageImplToJson(
        _$ProductionStageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
