// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRequestDetailImpl _$$ProductRequestDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRequestDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      discountPercent: (json['discount_percent'] as num?)?.toDouble(),
      discountValue: (json['discount_value'] as num?)?.toDouble(),
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
      productPrice: (json['product_price'] as num?)?.toDouble(),
      totalProductPrice: (json['total_product_price'] as num?)?.toDouble(),
      quantityDelivery: (json['quantity_delivery'] as num?)?.toInt(),
      quantityRemaining: (json['quantity_remaining'] as num?)?.toInt() ?? 0,
      product: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      unit: json['unit_id'] as String,
    );

Map<String, dynamic> _$$ProductRequestDetailImplToJson(
        _$ProductRequestDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      'subtotal': instance.subtotal,
      'discount_percent': instance.discountPercent,
      'discount_value': instance.discountValue,
      'price_after_discount': instance.priceAfterDiscount,
      'product_price': instance.productPrice,
      'total_product_price': instance.totalProductPrice,
      'quantity_delivery': instance.quantityDelivery,
      'quantity_remaining': instance.quantityRemaining,
      'product_id': instance.product,
      'unit_id': instance.unit,
    };
