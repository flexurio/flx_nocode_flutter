// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageDetailImpl _$$MaterialUsageDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageDetailImpl(
      materialIssueId: json['material_issue_id'] as String,
      description: json['description'] as String,
      materialName: json['material_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      miType: json['mi_type'] as String,
      miTypeName: json['mi_type_name'] as String,
      subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialUsageDetailImplToJson(
        _$MaterialUsageDetailImpl instance) =>
    <String, dynamic>{
      'material_issue_id': instance.materialIssueId,
      'description': instance.description,
      'material_name': instance.materialName,
      'quantity': instance.quantity,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'mi_type': instance.miType,
      'mi_type_name': instance.miTypeName,
      'subtotal_summary': instance.subtotalSummary,
    };
