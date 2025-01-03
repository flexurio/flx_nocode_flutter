// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionMachineImpl _$$ProductionMachineImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionMachineImpl(
      (json['id'] as num).toInt(),
      json['name'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      json['asset_no'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductionMachineImplToJson(
        _$ProductionMachineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'asset_no': instance.assetNumber,
    };
