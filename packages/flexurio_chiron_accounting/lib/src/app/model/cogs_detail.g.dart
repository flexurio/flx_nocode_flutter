// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cogs_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CogsDetailImpl _$$CogsDetailImplFromJson(Map<String, dynamic> json) =>
    _$CogsDetailImpl(
      json['transaction_no'] as String,
      json['purchase_order_no'] as String,
      json['batch_no'] as String,
      json['product_id'] as String,
      json['product_name'] as String,
      json['material_id'] as String,
      json['material_name'] as String,
      json['na'] as String,
      json['qty'] as num,
      json['price'] as num,
      json['value'] as num,
      json['remark'] as String,
    );

Map<String, dynamic> _$$CogsDetailImplToJson(_$CogsDetailImpl instance) =>
    <String, dynamic>{
      'transaction_no': instance.transaction,
      'purchase_order_no': instance.purchaseOrder,
      'batch_no': instance.batch,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'na': instance.na,
      'qty': instance.quantity,
      'price': instance.price,
      'value': instance.value,
      'remark': instance.remark,
    };
