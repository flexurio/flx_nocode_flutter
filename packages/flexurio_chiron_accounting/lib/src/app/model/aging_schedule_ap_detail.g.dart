// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aging_schedule_ap_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgingScheduleAPDetailImpl _$$AgingScheduleAPDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AgingScheduleAPDetailImpl(
      supplierName: json['supplier_name'] as String,
      transactionNo: json['transaction_no'] as String,
      remainingDebtAll: (json['remaining_debt_all'] as num).toInt(),
      remainingDebt15: (json['remaining_debt15'] as num).toInt(),
      remainingDebt30: (json['remaining_debt30'] as num).toInt(),
      remainingDebt45: (json['remaining_debt45'] as num).toInt(),
      remainingDebt60: (json['remaining_debt60'] as num).toInt(),
      remainingDebt60_past: (json['remaining_debt60_past'] as num).toInt(),
    );

Map<String, dynamic> _$$AgingScheduleAPDetailImplToJson(
        _$AgingScheduleAPDetailImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplierName,
      'transaction_no': instance.transactionNo,
      'remaining_debt_all': instance.remainingDebtAll,
      'remaining_debt15': instance.remainingDebt15,
      'remaining_debt30': instance.remainingDebt30,
      'remaining_debt45': instance.remainingDebt45,
      'remaining_debt60': instance.remainingDebt60,
      'remaining_debt60_past': instance.remainingDebt60_past,
    };
