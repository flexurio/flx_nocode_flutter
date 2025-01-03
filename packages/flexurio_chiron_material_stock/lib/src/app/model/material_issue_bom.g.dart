// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_issue_bom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialIssueBomImpl _$$MaterialIssueBomImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIssueBomImpl(
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      materialGroupId: json['material_group_id'] as String,
      batchNoId: json['batch_no_id'] as String,
      scale: json['scale'] as String,
      unitId: json['unit_id'] as String,
      quantityMaterialIssue: (json['quantity_material_issue'] as num).toInt(),
      quantityFormulation: (json['quantity_formulation'] as num).toInt(),
      quantityMaterialReturn: (json['quantity_material_return'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
    );

Map<String, dynamic> _$$MaterialIssueBomImplToJson(
        _$MaterialIssueBomImpl instance) =>
    <String, dynamic>{
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'material_group_id': instance.materialGroupId,
      'batch_no_id': instance.batchNoId,
      'scale': instance.scale,
      'unit_id': instance.unitId,
      'quantity_material_issue': instance.quantityMaterialIssue,
      'quantity_formulation': instance.quantityFormulation,
      'quantity_material_return': instance.quantityMaterialReturn,
      'created_at': instance.createdAt.toIso8601String(),
    };
