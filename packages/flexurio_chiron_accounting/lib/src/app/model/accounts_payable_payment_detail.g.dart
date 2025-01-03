// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_payable_payment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsPayablePaymentDetailImpl _$$AccountsPayablePaymentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsPayablePaymentDetailImpl(
      transactionDate: json['transaction_date'] as String,
      remark: json['remark'] as String,
      total: (json['total'] as num).toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
      supplier: json['supplier'] as String?,
      transactionNo: json['transaction_no'] as String?,
    );

Map<String, dynamic> _$$AccountsPayablePaymentDetailImplToJson(
        _$AccountsPayablePaymentDetailImpl instance) =>
    <String, dynamic>{
      'transaction_date': instance.transactionDate,
      'remark': instance.remark,
      'total': instance.total,
      'total_summary': instance.totalSummary,
      'supplier': instance.supplier,
      'transaction_no': instance.transactionNo,
    };
