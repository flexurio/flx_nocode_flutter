// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderDetailImpl _$$SalesOrderDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderDetailImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['qty'] as num).toInt(),
      price: (json['price'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      qtyDelivery: (json['qty_delivery'] as num).toInt(),
      warehouse: json['warehouse'] as String,
      salesOrderId: json['sales_order_id'] as String,
      productId: json['product_id'] as String,
      batchNoId: json['batch_no_id'] as String,
      unitId: json['unit_id'] as String,
      batchNo:
          ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      isHistory: json['is_history'] as String? ?? '',
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      priceAfterDiscount:
          (json['price_after_discount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$SalesOrderDetailImplToJson(
        _$SalesOrderDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qty': instance.quantity,
      'price': instance.price,
      'subtotal': instance.subtotal,
      'discount_value': instance.discountValue,
      'discount_percent': instance.discountPercent,
      'qty_delivery': instance.qtyDelivery,
      'warehouse': instance.warehouse,
      'sales_order_id': instance.salesOrderId,
      'product_id': instance.productId,
      'batch_no_id': instance.batchNoId,
      'unit_id': instance.unitId,
      'batch_no': instance.batchNo,
      'unit': instance.unit,
      'is_history': instance.isHistory,
      'product': instance.product,
      'price_after_discount': instance.priceAfterDiscount,
    };
