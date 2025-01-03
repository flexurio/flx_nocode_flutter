// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_a1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FormA1Impl _$$FormA1ImplFromJson(Map<String, dynamic> json) => _$FormA1Impl(
      type: json['type'] as String,
      date: DateTime.parse(json['date'] as String),
      customer: json['customer'] as String,
      npwp: json['npwp'] as String,
      taxInvoiceNo: json['tax_invoice_no'] as String,
      subAfterTax: (json['sub_after_tax'] as num).toInt(),
      ppnValue: (json['ppn_value'] as num).toInt(),
      pph22Value: (json['pph_22_value'] as num).toInt(),
    );

Map<String, dynamic> _$$FormA1ImplToJson(_$FormA1Impl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'customer': instance.customer,
      'npwp': instance.npwp,
      'tax_invoice_no': instance.taxInvoiceNo,
      'sub_after_tax': instance.subAfterTax,
      'ppn_value': instance.ppnValue,
      'pph_22_value': instance.pph22Value,
    };
