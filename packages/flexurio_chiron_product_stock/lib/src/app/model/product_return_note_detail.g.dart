// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_note_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnNoteDetailImpl _$$ProductReturnNoteDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnNoteDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      productReturnNote: ProductReturnNote.fromJson(
          json['product_return_note'] as Map<String, dynamic>),
      productReturn: ProductReturn.fromJson(
          json['product_return'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productId: json['product_id'] as String,
      batchNo: json['batch_no'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      unitId: json['unit_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductReturnNoteDetailImplToJson(
        _$ProductReturnNoteDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product_return_note': instance.productReturnNote,
      'product_return': instance.productReturn,
      'product': instance.product,
      'product_id': instance.productId,
      'batch_no': instance.batchNo,
      'delivery_order_id': instance.deliveryOrderId,
      'unit_id': instance.unitId,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
    };
