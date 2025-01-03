// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_mutation_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialMutationRupiahImpl _$$MaterialMutationRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialMutationRupiahImpl(
      year: json['year'] as String,
      month: json['month'] as String,
      na: json['na'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String,
      price: (json['price'] as num).toDouble(),
      value: (json['value'] as num).toInt(),
      dk: json['dk'] as String,
      transactionId: json['transaction_id'] as String,
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      materialGroupId: json['material_group_id'] as String,
      batchProduct: json['batch_product'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      processDate: isoDateToDateTime(json['process_date'] as String?),
    );

Map<String, dynamic> _$$MaterialMutationRupiahImplToJson(
        _$MaterialMutationRupiahImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'na': instance.na,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'value': instance.value,
      'dk': instance.dk,
      'transaction_id': instance.transactionId,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'material_group_id': instance.materialGroupId,
      'batch_product': instance.batchProduct,
      'date': instance.date.toIso8601String(),
      'process_date': instance.processDate.toIso8601String(),
    };
