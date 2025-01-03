// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockRupiahImpl _$$ProductStockRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockRupiahImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      unitId: json['unit_id'] as String,
      qty: (json['qty'] as num).toInt(),
      primaryPrice: (json['primary_price'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductStockRupiahImplToJson(
        _$ProductStockRupiahImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_id': instance.unitId,
      'qty': instance.qty,
      'primary_price': instance.primaryPrice,
    };
