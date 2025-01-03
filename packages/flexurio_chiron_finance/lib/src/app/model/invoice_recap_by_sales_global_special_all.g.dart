// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_recap_by_sales_global_special_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceRecapBySalesGlobalSpecialAllImpl
    _$$InvoiceRecapBySalesGlobalSpecialAllImplFromJson(
            Map<String, dynamic> json) =>
        _$InvoiceRecapBySalesGlobalSpecialAllImpl(
          transactionName: json['transaction_name'] as String,
          customer: json['customer'] as String? ?? '',
          subtotalCustomer: (json['subtotal_customer'] as num).toDouble(),
          discountValueCustomer:
              (json['discount_value_customer'] as num).toDouble(),
          additionalDiscountValueCustomer:
              (json['additional_discount_value_customer'] as num).toDouble(),
          ppnValueCustomer: (json['ppn_value_customer'] as num).toDouble(),
          pph22ValueCustomer: (json['pph22_value_customer'] as num).toDouble(),
          totalCustomer: (json['total_customer'] as num).toDouble(),
          subtotalTransactionType:
              (json['subtotal_transaction_type'] as num).toDouble(),
          discountValueTransactionType:
              (json['discount_value_transaction_type'] as num).toDouble(),
          additionalDiscountValueTransactionType:
              (json['additional_discount_value_transaction_type'] as num)
                  .toDouble(),
          ppnValueTransactionType:
              (json['ppn_value_transaction_type'] as num).toDouble(),
          pph22ValueTransactionType:
              (json['pph22_value_transaction_type'] as num).toDouble(),
          totalTransactionType:
              (json['total_transaction_type'] as num).toDouble(),
          subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
          discountValueSummary:
              (json['discount_value_summary'] as num).toDouble(),
          additionalDiscountValueSummary:
              (json['additional_discount_value_summary'] as num).toDouble(),
          ppnValueSummary: (json['ppn_value_summary'] as num).toDouble(),
          pph22ValueSummary: (json['pph22_value_summary'] as num).toDouble(),
          totalSummary: (json['total_summary'] as num).toDouble(),
        );

Map<String, dynamic> _$$InvoiceRecapBySalesGlobalSpecialAllImplToJson(
        _$InvoiceRecapBySalesGlobalSpecialAllImpl instance) =>
    <String, dynamic>{
      'transaction_name': instance.transactionName,
      'customer': instance.customer,
      'subtotal_customer': instance.subtotalCustomer,
      'discount_value_customer': instance.discountValueCustomer,
      'additional_discount_value_customer':
          instance.additionalDiscountValueCustomer,
      'ppn_value_customer': instance.ppnValueCustomer,
      'pph22_value_customer': instance.pph22ValueCustomer,
      'total_customer': instance.totalCustomer,
      'subtotal_transaction_type': instance.subtotalTransactionType,
      'discount_value_transaction_type': instance.discountValueTransactionType,
      'additional_discount_value_transaction_type':
          instance.additionalDiscountValueTransactionType,
      'ppn_value_transaction_type': instance.ppnValueTransactionType,
      'pph22_value_transaction_type': instance.pph22ValueTransactionType,
      'total_transaction_type': instance.totalTransactionType,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'pph22_value_summary': instance.pph22ValueSummary,
      'total_summary': instance.totalSummary,
    };
