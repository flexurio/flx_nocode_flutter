// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CostReportImpl _$$CostReportImplFromJson(Map<String, dynamic> json) =>
    _$CostReportImpl(
      chartOfAccountId: json['chart_of_account_id'] as String,
      chartOfAccountName: json['chart_of_account_name'] as String,
      transactionNo: json['transaction_no'] as String,
      departmentId: json['department_id'] as String,
      departmentName: json['department_name'] as String,
      debit: (json['debit'] as num).toDouble(),
      credit: (json['credit'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$CostReportImplToJson(_$CostReportImpl instance) =>
    <String, dynamic>{
      'chart_of_account_id': instance.chartOfAccountId,
      'chart_of_account_name': instance.chartOfAccountName,
      'transaction_no': instance.transactionNo,
      'department_id': instance.departmentId,
      'department_name': instance.departmentName,
      'debit': instance.debit,
      'credit': instance.credit,
      'description': instance.description,
    };
