// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceDiscountImpl _$$InvoiceDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceDiscountImpl(
      transactionId: json['transaction_id'] as String?,
      transactionDate: json['transaction_date'] as String?,
      taxInvoiceNumber: json['tax_invoice_number'] as String?,
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      discountValue: (json['discount_value'] as num?)?.toDouble(),
      ppnValue: (json['ppn_value'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      additionalDiscountValue:
          (json['additional_discount_value'] as num?)?.toDouble(),
      subtotalSummary: (json['subtotal_summary'] as num?)?.toDouble(),
      discountValueSummary:
          (json['discount_value_summary'] as num?)?.toDouble(),
      ppnValueSummary: (json['ppn_value_summary'] as num?)?.toDouble(),
      totalSummary: (json['total_summary'] as num?)?.toDouble(),
      additionalDiscountValueSummary:
          (json['additional_discount_value_summary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$InvoiceDiscountImplToJson(
        _$InvoiceDiscountImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'transaction_date': instance.transactionDate,
      'tax_invoice_number': instance.taxInvoiceNumber,
      'subtotal': instance.subtotal,
      'discount_value': instance.discountValue,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'additional_discount_value': instance.additionalDiscountValue,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'total_summary': instance.totalSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
    };
