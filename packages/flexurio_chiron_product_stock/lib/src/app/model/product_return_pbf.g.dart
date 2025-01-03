// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_pbf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnPbfImpl _$$ProductReturnPbfImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnPbfImpl(
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      productIssuedName: json['product_issued_name'] as String,
      productIssuedQty: (json['product_issued_qty'] as num).toInt(),
      productIssuedBatch: json['product_issued_batch'] as String,
      productReturnName: json['product_return_name'] as String,
      productReturnQty: (json['product_return_qty'] as num).toInt(),
      productReturnBatch: json['product_return_batch'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
    );

Map<String, dynamic> _$$ProductReturnPbfImplToJson(
        _$ProductReturnPbfImpl instance) =>
    <String, dynamic>{
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'product_issued_name': instance.productIssuedName,
      'product_issued_qty': instance.productIssuedQty,
      'product_issued_batch': instance.productIssuedBatch,
      'product_return_name': instance.productReturnName,
      'product_return_qty': instance.productReturnQty,
      'product_return_batch': instance.productReturnBatch,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
    };
