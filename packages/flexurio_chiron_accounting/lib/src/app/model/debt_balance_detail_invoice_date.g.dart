// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_balance_detail_invoice_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebtBalanceDetailInvoiceDateImpl _$$DebtBalanceDetailInvoiceDateImplFromJson(
        Map<String, dynamic> json) =>
    _$DebtBalanceDetailInvoiceDateImpl(
      supplierName: json['supplier_name'] as String,
      transactionId: json['transaction_id'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      currencyId: json['currency_id'] as String,
      rate: (json['rate'] as num).toInt(),
      accountValue: (json['account_value'] as num).toInt(),
      accountValueSummary: (json['account_value_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$DebtBalanceDetailInvoiceDateImplToJson(
        _$DebtBalanceDetailInvoiceDateImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplierName,
      'transaction_id': instance.transactionId,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'currency_id': instance.currencyId,
      'rate': instance.rate,
      'account_value': instance.accountValue,
      'account_value_summary': instance.accountValueSummary,
    };
