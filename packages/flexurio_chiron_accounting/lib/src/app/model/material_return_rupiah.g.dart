// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnRupiahImpl _$$MaterialReturnRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReturnRupiahImpl(
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      materialUnitId: json['material_unit_id'] as String,
    );

Map<String, dynamic> _$$MaterialReturnRupiahImplToJson(
        _$MaterialReturnRupiahImpl instance) =>
    <String, dynamic>{
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'quantity': instance.quantity,
      'price': instance.price,
      'material_unit_id': instance.materialUnitId,
    };
