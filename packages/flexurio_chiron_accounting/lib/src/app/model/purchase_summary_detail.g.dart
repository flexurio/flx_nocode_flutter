// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_summary_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseSummaryDetailImpl _$$PurchaseSummaryDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseSummaryDetailImpl(
      transactionId: json['transaction_id'] as String,
      supplier: json['supplier'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      description: json['description'] as String,
      materialName: json['material_name'] as String,
      price: (json['price'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toInt(),
      ppnValue: (json['ppn_value'] as num).toInt(),
      pph22Value: (json['pph22_value'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      descriptionTotal: json['description_total'] as String,
      subtotalSummary: (json['subtotal_summary'] as num).toInt(),
      ppnValueSummary: (json['ppn_value_summary'] as num).toInt(),
      pph22ValueSummary: (json['pph22_value_summary'] as num).toInt(),
      totalSummary: (json['total_summary'] as num).toDouble(),
      unitId: json['unit_id'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PurchaseSummaryDetailImplToJson(
        _$PurchaseSummaryDetailImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'supplier': instance.supplier,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'description': instance.description,
      'material_name': instance.materialName,
      'price': instance.price,
      'subtotal': instance.subtotal,
      'ppn_value': instance.ppnValue,
      'pph22_value': instance.pph22Value,
      'total': instance.total,
      'description_total': instance.descriptionTotal,
      'subtotal_summary': instance.subtotalSummary,
      'ppn_value_summary': instance.ppnValueSummary,
      'pph22_value_summary': instance.pph22ValueSummary,
      'total_summary': instance.totalSummary,
      'unit_id': instance.unitId,
      'quantity': instance.quantity,
    };
