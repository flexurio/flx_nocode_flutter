// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnMaterialImpl _$$MaterialReturnMaterialImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReturnMaterialImpl(
      na: json['na'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      quantityRemaining: (json['quantity_remaining'] as num).toDouble(),
      quantityReturn: (json['quantity_return'] as num).toDouble(),
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      materialUnitId: json['material_unit_id'] as String,
    );

Map<String, dynamic> _$$MaterialReturnMaterialImplToJson(
        _$MaterialReturnMaterialImpl instance) =>
    <String, dynamic>{
      'na': instance.na,
      'quantity': instance.quantity,
      'quantity_remaining': instance.quantityRemaining,
      'quantity_return': instance.quantityReturn,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'material_unit_id': instance.materialUnitId,
    };
