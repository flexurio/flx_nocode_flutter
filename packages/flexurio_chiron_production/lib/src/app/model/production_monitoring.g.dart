// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_monitoring.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionMonitoringImpl _$$ProductionMonitoringImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionMonitoringImpl(
      batchNo: json['batch_no'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productionSubStageId: (json['production_sub_stage_id'] as num).toInt(),
      productionSubStageName: json['production_sub_stage_name'] as String,
      productionStageName: json['production_stage_name'] as String,
      ordinal: json['ordinal'] as String,
      machineId: (json['machine_id'] as num).toInt(),
      machineName: json['machine_name'] as String,
      startTime: isoDateToDateTime(json['start_time'] as String?),
      endTime: isoDateToDateTime(json['end_time'] as String?),
      status: json['status'] as String,
      description: json['description'] as String,
      quarantineDate: dateTimeNullable(json['quarantine_date'] as String?),
      expiredDate: dateTimeNullable(json['expired_date'] as String?),
      releaseDate: dateTimeNullable(json['release_date'] as String?),
    );

Map<String, dynamic> _$$ProductionMonitoringImplToJson(
        _$ProductionMonitoringImpl instance) =>
    <String, dynamic>{
      'batch_no': instance.batchNo,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'production_sub_stage_id': instance.productionSubStageId,
      'production_sub_stage_name': instance.productionSubStageName,
      'production_stage_name': instance.productionStageName,
      'ordinal': instance.ordinal,
      'machine_id': instance.machineId,
      'machine_name': instance.machineName,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime.toIso8601String(),
      'status': instance.status,
      'description': instance.description,
      'quarantine_date': instance.quarantineDate?.toIso8601String(),
      'expired_date': instance.expiredDate?.toIso8601String(),
      'release_date': instance.releaseDate?.toIso8601String(),
    };
