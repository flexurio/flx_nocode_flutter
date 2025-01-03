// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockRupiahImpl _$$MaterialStockRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockRupiahImpl(
      year: json['year'] as String,
      month: json['month'] as String,
      transactionId: json['transaction_id'] as String,
      materialId: json['material_id'] as String,
      na: json['na'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      materialName: json['material_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      value: (json['value'] as num).toInt(),
      materialGroupId: json['material_group_id'] as String,
      batchProduct: json['batch_product'] as String,
      dk: json['dk'] as String,
      processDate: isoDateToDateTime(json['process_date'] as String?),
    );

Map<String, dynamic> _$$MaterialStockRupiahImplToJson(
        _$MaterialStockRupiahImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'transaction_id': instance.transactionId,
      'material_id': instance.materialId,
      'na': instance.na,
      'date': instance.date.toIso8601String(),
      'material_name': instance.materialName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'value': instance.value,
      'material_group_id': instance.materialGroupId,
      'batch_product': instance.batchProduct,
      'dk': instance.dk,
      'process_date': instance.processDate.toIso8601String(),
    };
