// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_man_hour_production.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportManHourProductionImpl _$$ReportManHourProductionImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportManHourProductionImpl(
      period: json['period'] as String,
      productID: json['product_id'] as String,
      productName: json['product_name'] as String,
      batchNo: json['batch_no'] as String,
      manHour: (json['man_hour'] as num?)?.toInt(),
      manHourWeight: (json['man_hour_weighing'] as num?)?.toInt(),
      manHourProduction: (json['man_hour_production'] as num?)?.toInt(),
      manHourPacking: (json['man_hour_packing'] as num?)?.toInt(),
      standart: (json['standart'] as num?)?.toInt(),
      achievement: (json['achievement'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReportManHourProductionImplToJson(
        _$ReportManHourProductionImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'product_id': instance.productID,
      'product_name': instance.productName,
      'batch_no': instance.batchNo,
      'man_hour': instance.manHour,
      'man_hour_weighing': instance.manHourWeight,
      'man_hour_production': instance.manHourProduction,
      'man_hour_packing': instance.manHourPacking,
      'standart': instance.standart,
      'achievement': instance.achievement,
    };
