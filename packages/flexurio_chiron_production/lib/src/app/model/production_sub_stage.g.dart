// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_sub_stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionSubStageImpl _$$ProductionSubStageImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionSubStageImpl(
      (json['id'] as num).toInt(),
      json['name'] as String,
      ProductionStage.fromJson(
          json['production_stage'] as Map<String, dynamic>),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductionSubStageImplToJson(
        _$ProductionSubStageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'production_stage': instance.stage,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_active': instance.isActive,
    };
