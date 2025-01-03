// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_recap_by_sales_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceRecapBySalesDetailImpl _$$InvoiceRecapBySalesDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceRecapBySalesDetailImpl(
      customer: json['customer'] as String? ?? '',
      transactionNo: json['transaction_no'] as String,
      transactionDate: DateTime.parse(json['transaction_date'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      additionalDiscountValue:
          (json['additional_discount_value'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      subtotalCustomer: (json['subtotal_customer'] as num).toDouble(),
      discountValueCustomer:
          (json['discount_value_customer'] as num).toDouble(),
      additionalDiscountValueCustomer:
          (json['additional_discount_value_customer'] as num).toDouble(),
      ppnValueCustomer: (json['ppn_value_customer'] as num).toDouble(),
      totalCustomer: (json['total_customer'] as num).toDouble(),
      subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
      discountValueSummary: (json['discount_value_summary'] as num).toDouble(),
      additionalDiscountValueSummary:
          (json['additional_discount_value_summary'] as num).toDouble(),
      ppnValueSummary: (json['ppn_value_summary'] as num).toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
      taxInvoice: json['tax_invoice'] as String?,
    );

Map<String, dynamic> _$$InvoiceRecapBySalesDetailImplToJson(
        _$InvoiceRecapBySalesDetailImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'subtotal': instance.subtotal,
      'discount_value': instance.discountValue,
      'additional_discount_value': instance.additionalDiscountValue,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'subtotal_customer': instance.subtotalCustomer,
      'discount_value_customer': instance.discountValueCustomer,
      'additional_discount_value_customer':
          instance.additionalDiscountValueCustomer,
      'ppn_value_customer': instance.ppnValueCustomer,
      'total_customer': instance.totalCustomer,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'total_summary': instance.totalSummary,
      'tax_invoice': instance.taxInvoice,
    };
