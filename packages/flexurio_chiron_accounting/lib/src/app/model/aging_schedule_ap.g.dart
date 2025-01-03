// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aging_schedule_ap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgingScheduleAPImpl _$$AgingScheduleAPImplFromJson(
        Map<String, dynamic> json) =>
    _$AgingScheduleAPImpl(
      supplierName: json['supplier_name'] as String,
      remainingDebtAll: (json['remaining_debt_all'] as num).toInt(),
      remainingDebt15: (json['remaining_debt15'] as num).toInt(),
      remainingDebt30: (json['remaining_debt30'] as num).toInt(),
      remainingDebt45: (json['remaining_debt45'] as num).toInt(),
      remainingDebt60: (json['remaining_debt60'] as num).toInt(),
      remainingDebt60Past: (json['remaining_debt60_past'] as num).toInt(),
      remainingDebtAllSummary:
          (json['remaining_debt_all_summary'] as num).toInt(),
      remainingDebt15Summary: (json['remaining_debt15_summary'] as num).toInt(),
      remainingDebt30Summary: (json['remaining_debt30_summary'] as num).toInt(),
      remainingDebt45Summary: (json['remaining_debt45_summary'] as num).toInt(),
      remainingDebt60Summary: (json['remaining_debt60_summary'] as num).toInt(),
      remainingDebt60PastSummary:
          (json['remaining_debt60_past_summary'] as num).toInt(),
      remainingDebtAllPercent:
          (json['remaining_debt_all_percent'] as num).toInt(),
      remainingDebt15Percent: (json['remaining_debt15_percent'] as num).toInt(),
      remainingDebt30Percent: (json['remaining_debt30_percent'] as num).toInt(),
      remainingDebt45Percent: (json['remaining_debt45_percent'] as num).toInt(),
      remainingDebt60Percent: (json['remaining_debt60_percent'] as num).toInt(),
      remainingDebt60PastPercent:
          (json['remaining_debt60_past_percent'] as num).toInt(),
    );

Map<String, dynamic> _$$AgingScheduleAPImplToJson(
        _$AgingScheduleAPImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplierName,
      'remaining_debt_all': instance.remainingDebtAll,
      'remaining_debt15': instance.remainingDebt15,
      'remaining_debt30': instance.remainingDebt30,
      'remaining_debt45': instance.remainingDebt45,
      'remaining_debt60': instance.remainingDebt60,
      'remaining_debt60_past': instance.remainingDebt60Past,
      'remaining_debt_all_summary': instance.remainingDebtAllSummary,
      'remaining_debt15_summary': instance.remainingDebt15Summary,
      'remaining_debt30_summary': instance.remainingDebt30Summary,
      'remaining_debt45_summary': instance.remainingDebt45Summary,
      'remaining_debt60_summary': instance.remainingDebt60Summary,
      'remaining_debt60_past_summary': instance.remainingDebt60PastSummary,
      'remaining_debt_all_percent': instance.remainingDebtAllPercent,
      'remaining_debt15_percent': instance.remainingDebt15Percent,
      'remaining_debt30_percent': instance.remainingDebt30Percent,
      'remaining_debt45_percent': instance.remainingDebt45Percent,
      'remaining_debt60_percent': instance.remainingDebt60Percent,
      'remaining_debt60_past_percent': instance.remainingDebt60PastPercent,
    };
