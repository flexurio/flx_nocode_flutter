// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_mutation_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockMutationRecapImpl _$$ProductStockMutationRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockMutationRecapImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String?,
      unitId: json['unit_id'] as String,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      quantityIn: (json['quantity_in'] as num).toInt(),
      quantityOut: (json['quantity_out'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductStockMutationRecapImplToJson(
        _$ProductStockMutationRecapImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_id': instance.unitId,
      'beginning_balance': instance.beginningBalance,
      'quantity_in': instance.quantityIn,
      'quantity_out': instance.quantityOut,
      'total': instance.total,
    };
