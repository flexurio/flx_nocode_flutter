// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_reject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderRejectImpl _$$PurchaseOrderRejectImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderRejectImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      materialRequestOld: json['material_request_old'] as String,
      purchaseOrderOld: json['purchase_order_old'] as String,
      purchaseOrderNew: json['purchase_order_new'] as String,
      dateOfNeed: isoDateToDateTime(json['date_of_need'] as String?),
      materialName: json['material_name'] as String,
      productName: json['product_name'] as String,
      quantity: (json['qty'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$PurchaseOrderRejectImplToJson(
        _$PurchaseOrderRejectImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'material_request_old': instance.materialRequestOld,
      'purchase_order_old': instance.purchaseOrderOld,
      'purchase_order_new': instance.purchaseOrderNew,
      'date_of_need': instance.dateOfNeed.toIso8601String(),
      'material_name': instance.materialName,
      'product_name': instance.productName,
      'qty': instance.quantity,
      'price': instance.price,
    };
