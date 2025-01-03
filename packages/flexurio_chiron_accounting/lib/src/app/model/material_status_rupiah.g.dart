// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_status_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStatusRupiahImpl _$$MaterialStatusRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStatusRupiahImpl(
      transactionId: json['transaction_id'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      supplierName: json['supplier_name'] as String,
      materialName: json['material_name'] as String,
      na: json['na'] as String,
      vatTotal: (json['vat_total'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      quantityRelease: (json['quantity_release'] as num).toDouble(),
      valueRelease: (json['value_release'] as num).toDouble(),
      quantityReject: (json['quantity_reject'] as num).toInt(),
      valueReject: (json['value_reject'] as num).toInt(),
      valueReleaseSummary: (json['value_release_summary'] as num).toDouble(),
      valueRejectSummary: (json['value_reject_summary'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialStatusRupiahImplToJson(
        _$MaterialStatusRupiahImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'supplier_name': instance.supplierName,
      'material_name': instance.materialName,
      'na': instance.na,
      'vat_total': instance.vatTotal,
      'price': instance.price,
      'quantity_release': instance.quantityRelease,
      'value_release': instance.valueRelease,
      'quantity_reject': instance.quantityReject,
      'value_reject': instance.valueReject,
      'value_release_summary': instance.valueReleaseSummary,
      'value_reject_summary': instance.valueRejectSummary,
    };
