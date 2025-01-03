// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_hour_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkHourShiftImpl _$$WorkHourShiftImplFromJson(Map<String, dynamic> json) =>
    _$WorkHourShiftImpl(
      (json['id'] as num).toInt(),
      isoDateToDateTime(json['start_period'] as String?),
      isoDateToDateTime(json['end_period'] as String?),
      json['name'] as String,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$WorkHourShiftImplToJson(_$WorkHourShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_period': instance.periodStart.toIso8601String(),
      'end_period': instance.periodEnd.toIso8601String(),
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
