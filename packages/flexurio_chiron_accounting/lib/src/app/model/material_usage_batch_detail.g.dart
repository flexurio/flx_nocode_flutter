// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_batch_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageBatchDetailImpl _$$MaterialUsageBatchDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageBatchDetailImpl(
      productName: json['product_name'] as String?,
      batchNo: json['batch_no'] as String?,
      materialGroupId: json['material_group_id'] as String,
      transactionNo: json['transaction_no'] as String,
      materialName: json['material_name'] as String,
      transactionTypeName: json['transaction_type_name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String?,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      totalPriceSummary: (json['total_price_summary'] as num).toDouble(),
      totalPriceMaterialGroup:
          (json['total_price_material_group'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialUsageBatchDetailImplToJson(
        _$MaterialUsageBatchDetailImpl instance) =>
    <String, dynamic>{
      'product_name': instance.productName,
      'batch_no': instance.batchNo,
      'material_group_id': instance.materialGroupId,
      'transaction_no': instance.transactionNo,
      'material_name': instance.materialName,
      'transaction_type_name': instance.transactionTypeName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'total_price_summary': instance.totalPriceSummary,
      'total_price_material_group': instance.totalPriceMaterialGroup,
    };
