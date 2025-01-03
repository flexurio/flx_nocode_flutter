// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_status_rupiah_quarantine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStatusRupiahQuarantineImpl
    _$$MaterialStatusRupiahQuarantineImplFromJson(Map<String, dynamic> json) =>
        _$MaterialStatusRupiahQuarantineImpl(
          transactionId: json['transaction_id'] as String,
          transactionDate:
              isoDateToDateTime(json['transaction_date'] as String?),
          supplierName: json['supplier_name'] as String,
          materialName: json['material_name'] as String,
          na: json['na'] as String,
          vatTotal: (json['vat_total'] as num?)?.toInt(),
          price: (json['price'] as num?)?.toInt(),
          quantityQuarantine: (json['quantity_quarantine'] as num).toInt(),
          valueQuarantine: (json['value_quarantine'] as num).toInt(),
          valueQuarantineSummary:
              (json['value_quarantine_summary'] as num).toInt(),
        );

Map<String, dynamic> _$$MaterialStatusRupiahQuarantineImplToJson(
        _$MaterialStatusRupiahQuarantineImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'supplier_name': instance.supplierName,
      'material_name': instance.materialName,
      'na': instance.na,
      'vat_total': instance.vatTotal,
      'price': instance.price,
      'quantity_quarantine': instance.quantityQuarantine,
      'value_quarantine': instance.valueQuarantine,
      'value_quarantine_summary': instance.valueQuarantineSummary,
    };
