// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_with_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockWithPriceImpl _$$ProductStockWithPriceImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockWithPriceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      productNo: json['product_no'] as String,
      batch: json['batch_no'] as String,
      type: json['type'] as String,
      quantityStock: (json['quantity_stock'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      description: json['description'] as String,
      productGroup: json['product_group'] as String,
      unit: json['unit'] as String,
      warehouse: json['warehouse'] as String,
    );

Map<String, dynamic> _$$ProductStockWithPriceImplToJson(
        _$ProductStockWithPriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product_no': instance.productNo,
      'batch_no': instance.batch,
      'type': instance.type,
      'quantity_stock': instance.quantityStock,
      'price': instance.price,
      'image': instance.image,
      'description': instance.description,
      'product_group': instance.productGroup,
      'unit': instance.unit,
      'warehouse': instance.warehouse,
    };
