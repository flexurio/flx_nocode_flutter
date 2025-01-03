// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petty_cash_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PettyCashDetailImpl _$$PettyCashDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PettyCashDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      unit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      realizationPrice: (json['realization_price'] as num).toDouble(),
      pettyCash: PettyCash.fromJson(json['petty_cash'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PettyCashDetailImplToJson(
        _$PettyCashDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'material_unit': instance.unit,
      'material': instance.material,
      'quantity': instance.quantity,
      'price': instance.price,
      'realization_price': instance.realizationPrice,
      'petty_cash': instance.pettyCash,
    };
