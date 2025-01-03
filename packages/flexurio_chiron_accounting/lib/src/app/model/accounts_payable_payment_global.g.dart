// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_payable_payment_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsPayablePaymentGlobalImpl _$$AccountsPayablePaymentGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsPayablePaymentGlobalImpl(
      supplierId: json['supplier_id'] as String,
      supplierName: json['supplier_name'] as String,
      total: (json['total'] as num).toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$AccountsPayablePaymentGlobalImplToJson(
        _$AccountsPayablePaymentGlobalImpl instance) =>
    <String, dynamic>{
      'supplier_id': instance.supplierId,
      'supplier_name': instance.supplierName,
      'total': instance.total,
      'total_summary': instance.totalSummary,
    };
