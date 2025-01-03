// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_data_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionDataReportImpl _$$ProductionDataReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionDataReportImpl(
      actualStartTime: isoDateToDateTime(json['actual_start_time'] as String?),
      productName: json['product_name'] as String,
      productionOrder: json['production_order'] as String,
      productionStageName: json['production_stage_name'] as String,
      machine: json['machine'] as String,
      productionSubStageName: json['production_sub_stage_name'] as String,
      machineName: json['machine_name'] as String,
      subStageName: json['sub_stage_name'] as String,
      status: json['status'] as String,
      yield: (json['yield'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductionDataReportImplToJson(
        _$ProductionDataReportImpl instance) =>
    <String, dynamic>{
      'actual_start_time': instance.actualStartTime.toIso8601String(),
      'product_name': instance.productName,
      'production_order': instance.productionOrder,
      'production_stage_name': instance.productionStageName,
      'machine': instance.machine,
      'production_sub_stage_name': instance.productionSubStageName,
      'machine_name': instance.machineName,
      'sub_stage_name': instance.subStageName,
      'status': instance.status,
      'yield': instance.yield,
    };
