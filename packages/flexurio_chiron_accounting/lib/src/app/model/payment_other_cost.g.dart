// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_other_cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentOtherCostImpl _$$PaymentOtherCostImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentOtherCostImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      amount: (json['value'] as num).toDouble(),
      typeCost: TypeCost.fromJson(json['type_cost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentOtherCostImplToJson(
        _$PaymentOtherCostImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'value': instance.amount,
      'type_cost': instance.typeCost,
    };
