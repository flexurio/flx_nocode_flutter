// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleDetailImpl _$$ScheduleDetailImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleDetailImpl(
      (json['id'] as num).toInt(),
      json['remarks'] as String,
      (json['cycle'] as num).toInt(),
      ScheduleDetailStatus.fromString(json['status'] as String),
      isoDateToDateTime(json['start_time'] as String?),
      isoDateToDateTime(json['end_time'] as String?),
      json['is_valid'] as bool? ?? false,
      (json['pic_id'] as num).toInt(),
      (json['schedule_header'] as num).toInt(),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$ScheduleDetailImplToJson(
        _$ScheduleDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'remarks': instance.remarks,
      'cycle': instance.cycle,
      'status': _$ScheduleDetailStatusEnumMap[instance.status]!,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'is_valid': instance.isValid,
      'pic_id': instance.picId,
      'schedule_header': instance.scheduleId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ScheduleDetailStatusEnumMap = {
  ScheduleDetailStatus.empty: 'empty',
  ScheduleDetailStatus.start: 'start',
  ScheduleDetailStatus.pending: 'pending',
  ScheduleDetailStatus.finish: 'finish',
};
