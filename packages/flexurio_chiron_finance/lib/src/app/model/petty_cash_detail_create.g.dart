// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petty_cash_detail_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PettyCashDetailCreateImpl _$$PettyCashDetailCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$PettyCashDetailCreateImpl(
      materialId: json['material_id'] as String,
      materialUnitId: json['material_unit_id'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$PettyCashDetailCreateImplToJson(
        _$PettyCashDetailCreateImpl instance) =>
    <String, dynamic>{
      'material_id': instance.materialId,
      'material_unit_id': instance.materialUnitId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
