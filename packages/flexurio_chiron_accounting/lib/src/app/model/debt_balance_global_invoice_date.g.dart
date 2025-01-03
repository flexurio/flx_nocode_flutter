// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_balance_global_invoice_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebtBalanceGlobalInvoiceDateImpl _$$DebtBalanceGlobalInvoiceDateImplFromJson(
        Map<String, dynamic> json) =>
    _$DebtBalanceGlobalInvoiceDateImpl(
      supplierName: json['supplier_name'] as String,
      accountValue: (json['account_value'] as num).toInt(),
      accountValueSummary: (json['account_value_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$DebtBalanceGlobalInvoiceDateImplToJson(
        _$DebtBalanceGlobalInvoiceDateImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplierName,
      'account_value': instance.accountValue,
      'account_value_summary': instance.accountValueSummary,
    };
