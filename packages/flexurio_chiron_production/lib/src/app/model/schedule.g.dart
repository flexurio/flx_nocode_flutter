// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      (json['id'] as num).toInt(),
      (json['quantity_man'] as num).toInt(),
      isoDateToDateTime(json['start_time'] as String?),
      isoDateToDateTime(json['end_time'] as String?),
      isoDateToDateTime(json['actual_start_time'] as String?),
      isoDateToDateTime(json['actual_end_time'] as String?),
      (json['yield'] as num).toDouble(),
      (json['over_time'] as num).toInt(),
      json['notes'] as String,
      WorkHourType.fromString(json['work_hour_type'] as String),
      json['is_close'] as bool? ?? false,
      json['is_toll'] as bool? ?? false,
      ProductionOrder.fromJson(
          json['production_order'] as Map<String, dynamic>),
      Product.fromJson(json['product'] as Map<String, dynamic>),
      WorkHourShift.fromJson(json['work_hour_shift'] as Map<String, Object?>),
      ProductionStageProcess.fromJson(
          json['production_stage_process'] as Map<String, dynamic>),
      MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity_man': instance.quantityMan,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'actual_start_time': instance.actualStartTime.toIso8601String(),
      'actual_end_time': instance.actualEndTime.toIso8601String(),
      'yield': instance.yield,
      'over_time': instance.overTime,
      'notes': instance.notes,
      'work_hour_type': _$WorkHourTypeEnumMap[instance.workHourType]!,
      'is_close': instance.isClose,
      'is_toll': instance.isToll,
      'production_order': instance.productionOrder,
      'product': instance.product,
      'work_hour_shift': instance.workHourShift,
      'production_stage_process': instance.productionStageProcess,
      'unit': instance.materialUnit,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$WorkHourTypeEnumMap = {
  WorkHourType.empty: 'empty',
  WorkHourType.regular: 'regular',
  WorkHourType.overtime: 'overtime',
};
