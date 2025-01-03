// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_recap_by_sales_detail_special.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceRecapBySalesDetailSpecialImpl
    _$$InvoiceRecapBySalesDetailSpecialImplFromJson(
            Map<String, dynamic> json) =>
        _$InvoiceRecapBySalesDetailSpecialImpl(
          customer: json['customer'] as String? ?? '',
          transactionNo: json['transaction_no'] as String,
          transactionDate: DateTime.parse(json['transaction_date'] as String),
          subtotalSales: (json['subtotal'] as num).toDouble(),
          discountValueSales: (json['discount_value'] as num).toDouble(),
          additionalDiscountValueSales:
              (json['additional_discount_value'] as num).toDouble(),
          ppnValueSales: (json['ppn_value'] as num).toDouble(),
          pph22ValueSales: (json['pph22_value'] as num).toDouble(),
          total: (json['total'] as num).toDouble(),
          subtotalCustomer: (json['subtotal_customer'] as num).toDouble(),
          discountValueCustomer:
              (json['discount_value_customer'] as num).toDouble(),
          additionalDiscountValueCustomer:
              (json['additional_discount_value_customer'] as num).toDouble(),
          ppnValueCustomer: (json['ppn_value_customer'] as num).toDouble(),
          pph22ValueCustomer: (json['pph22_value_customer'] as num).toDouble(),
          totalCustomer: (json['total_customer'] as num).toDouble(),
          subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
          discountValueSummary:
              (json['discount_value_summary'] as num).toDouble(),
          additionalDiscountValueSummary:
              (json['additional_discount_value_summary'] as num).toDouble(),
          ppnValueSummary: (json['ppn_value_summary'] as num).toDouble(),
          pph22ValueSummary: (json['pph22_value_summary'] as num).toDouble(),
          totalSummary: (json['total_summary'] as num).toDouble(),
          taxInvoice: json['tax_invoice'] as String?,
        );

Map<String, dynamic> _$$InvoiceRecapBySalesDetailSpecialImplToJson(
        _$InvoiceRecapBySalesDetailSpecialImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'subtotal': instance.subtotalSales,
      'discount_value': instance.discountValueSales,
      'additional_discount_value': instance.additionalDiscountValueSales,
      'ppn_value': instance.ppnValueSales,
      'pph22_value': instance.pph22ValueSales,
      'total': instance.total,
      'subtotal_customer': instance.subtotalCustomer,
      'discount_value_customer': instance.discountValueCustomer,
      'additional_discount_value_customer':
          instance.additionalDiscountValueCustomer,
      'ppn_value_customer': instance.ppnValueCustomer,
      'pph22_value_customer': instance.pph22ValueCustomer,
      'total_customer': instance.totalCustomer,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'pph22_value_summary': instance.pph22ValueSummary,
      'total_summary': instance.totalSummary,
      'tax_invoice': instance.taxInvoice,
    };
