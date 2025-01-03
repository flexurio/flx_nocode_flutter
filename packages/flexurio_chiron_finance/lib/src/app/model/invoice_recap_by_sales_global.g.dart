// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_recap_by_sales_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceRecapBySalesGlobalImpl _$$InvoiceRecapBySalesGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceRecapBySalesGlobalImpl(
      transactionName: json['transaction_name'] as String,
      customerDeliveryAddress:
          json['customer_delivery_address'] as String? ?? '',
      subtotal: (json['subtotal'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      additionalDiscountValue:
          (json['additional_discount_value'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      subtotalTransactionType:
          (json['subtotal_transaction_type'] as num).toDouble(),
      discountValueTransactionType:
          (json['discount_value_transaction_type'] as num).toDouble(),
      additionalDiscountValueTransactionType:
          (json['additional_discount_value_transaction_type'] as num)
              .toDouble(),
      ppnValueTransactionType:
          (json['ppn_value_transaction_type'] as num).toDouble(),
      totalTransactionType: (json['total_transaction_type'] as num).toDouble(),
      subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
      discountValueSummary: (json['discount_value_summary'] as num).toDouble(),
      additionalDiscountValueSummary:
          (json['additional_discount_value_summary'] as num).toDouble(),
      ppnValueSummary: (json['ppn_value_summary'] as num).toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$InvoiceRecapBySalesGlobalImplToJson(
        _$InvoiceRecapBySalesGlobalImpl instance) =>
    <String, dynamic>{
      'transaction_name': instance.transactionName,
      'customer_delivery_address': instance.customerDeliveryAddress,
      'subtotal': instance.subtotal,
      'discount_value': instance.discountValue,
      'additional_discount_value': instance.additionalDiscountValue,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'subtotal_transaction_type': instance.subtotalTransactionType,
      'discount_value_transaction_type': instance.discountValueTransactionType,
      'additional_discount_value_transaction_type':
          instance.additionalDiscountValueTransactionType,
      'ppn_value_transaction_type': instance.ppnValueTransactionType,
      'total_transaction_type': instance.totalTransactionType,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'total_summary': instance.totalSummary,
    };
