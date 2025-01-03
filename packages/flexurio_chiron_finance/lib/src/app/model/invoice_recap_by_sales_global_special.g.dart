// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_recap_by_sales_global_special.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceRecapBySalesGlobalSpecialImpl
    _$$InvoiceRecapBySalesGlobalSpecialImplFromJson(
            Map<String, dynamic> json) =>
        _$InvoiceRecapBySalesGlobalSpecialImpl(
          customer: json['customer'] as String? ?? '',
          subtotal: (json['subtotal'] as num).toDouble(),
          discountValue: (json['discount_value'] as num).toDouble(),
          additionalDiscountValue:
              (json['additional_discount_value'] as num).toDouble(),
          ppnValue: (json['ppn_value'] as num).toDouble(),
          pph22Value: (json['pph22_value'] as num).toDouble(),
          total: (json['total'] as num).toDouble(),
          subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
          discountValueSummary:
              (json['discount_value_summary'] as num).toDouble(),
          additionalDiscountValueSummary:
              (json['additional_discount_value_summary'] as num).toDouble(),
          ppnValueSummary: (json['ppn_value_summary'] as num).toDouble(),
          pph22ValueSummary: (json['pph22_value_summary'] as num).toDouble(),
          totalSummary: (json['total_summary'] as num).toDouble(),
        );

Map<String, dynamic> _$$InvoiceRecapBySalesGlobalSpecialImplToJson(
        _$InvoiceRecapBySalesGlobalSpecialImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'subtotal': instance.subtotal,
      'discount_value': instance.discountValue,
      'additional_discount_value': instance.additionalDiscountValue,
      'ppn_value': instance.ppnValue,
      'pph22_value': instance.pph22Value,
      'total': instance.total,
      'subtotal_summary': instance.subtotalSummary,
      'discount_value_summary': instance.discountValueSummary,
      'additional_discount_value_summary':
          instance.additionalDiscountValueSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'pph22_value_summary': instance.pph22ValueSummary,
      'total_summary': instance.totalSummary,
    };
