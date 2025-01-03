// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_batch_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageBatchGlobalImpl _$$MaterialUsageBatchGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageBatchGlobalImpl(
      productId: json['product_id'] as String?,
      productName: json['product_name'] as String?,
      batchNo: json['batch_no'] as String?,
      total: (json['total'] as num).toDouble(),
      totalSummary: (json['total_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialUsageBatchGlobalImplToJson(
        _$MaterialUsageBatchGlobalImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'batch_no': instance.batchNo,
      'total': instance.total,
      'total_summary': instance.totalSummary,
    };
