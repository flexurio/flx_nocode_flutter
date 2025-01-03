// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnDetailImpl _$$ProductReturnDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnDetailImpl(
      id: (json['id'] as num).toInt(),
      createAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      productReturn: ProductReturn.fromJson(
          json['product_return_id'] as Map<String, dynamic>),
      product: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      deliveryOrderId: json['delivery_order_id'] as String,
      batchNo:
          ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      unit: MaterialUnit.fromJson(json['unit_id'] as Map<String, Object?>),
      productPrice: (json['product_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      quantityRemaining: (json['quantity_remaining'] as num).toInt(),
      quantityCheck: (json['quantity_check'] as num).toInt(),
      totalProductPrice: (json['total_product_price'] as num).toDouble(),
      expirationDate: isoDateToDateTime(json['expiration_date'] as String?),
      checkQcAt: isoDateToDateTime(json['check_qc_at'] as String?),
      checkQcById: (json['check_qc_by_id'] as num).toInt(),
      quantityReturnNote: (json['quantity_return_note'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductReturnDetailImplToJson(
        _$ProductReturnDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product_return_id': instance.productReturn,
      'product_id': instance.product,
      'delivery_order_id': instance.deliveryOrderId,
      'batch_no': instance.batchNo,
      'unit_id': instance.unit,
      'product_price': instance.productPrice,
      'quantity': instance.quantity,
      'quantity_remaining': instance.quantityRemaining,
      'quantity_check': instance.quantityCheck,
      'total_product_price': instance.totalProductPrice,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'check_qc_at': instance.checkQcAt.toIso8601String(),
      'check_qc_by_id': instance.checkQcById,
      'quantity_return_note': instance.quantityReturnNote,
    };
