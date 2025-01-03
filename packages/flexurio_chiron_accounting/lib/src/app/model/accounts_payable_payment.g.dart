// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_payable_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsPayablePaymentImpl _$$AccountsPayablePaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsPayablePaymentImpl(
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      invoiceReceivedDate:
          isoDateToDateTime(json['invoice_received_date'] as String?),
      remark: json['remark'] as String?,
      invoiceNo: json['invoice_no'] as String,
      taxValue: (json['tax_value'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      subtotalValue: (json['subtotal_value'] as num).toDouble(),
      totalValue: (json['total_value'] as num).toDouble(),
      supplierName: json['supplier_name'] as String?,
      totalSupplier: (json['total_supplier'] as num?)?.toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
      transactionNo: json['transaction_no'] as String?,
    );

Map<String, dynamic> _$$AccountsPayablePaymentImplToJson(
        _$AccountsPayablePaymentImpl instance) =>
    <String, dynamic>{
      'transaction_date': instance.transactionDate.toIso8601String(),
      'invoice_received_date': instance.invoiceReceivedDate.toIso8601String(),
      'remark': instance.remark,
      'invoice_no': instance.invoiceNo,
      'tax_value': instance.taxValue,
      'ppn_value': instance.ppnValue,
      'subtotal_value': instance.subtotalValue,
      'total_value': instance.totalValue,
      'supplier_name': instance.supplierName,
      'total_supplier': instance.totalSupplier,
      'total_summary': instance.totalSummary,
      'transaction_no': instance.transactionNo,
    };
