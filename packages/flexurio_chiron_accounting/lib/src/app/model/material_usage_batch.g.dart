// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageBatchImpl _$$MaterialUsageBatchImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageBatchImpl(
      batchNo: json['batch_no'] as String?,
      productName: json['product_name'] as String?,
      materialGroupId: json['material_group_id'] as String?,
      materialId: json['material_id'] as String?,
      materialName: json['material_name'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      price: (json['price'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      totalPriceSummary: (json['total_price_summary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MaterialUsageBatchImplToJson(
        _$MaterialUsageBatchImpl instance) =>
    <String, dynamic>{
      'batch_no': instance.batchNo,
      'product_name': instance.productName,
      'material_group_id': instance.materialGroupId,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'total_price_summary': instance.totalPriceSummary,
    };
