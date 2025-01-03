// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockImpl _$$MaterialStockImplFromJson(Map<String, dynamic> json) =>
    _$MaterialStockImpl(
      id: (json['id'] as num).toInt(),
      period: json['period'] as String,
      na: json['na'] as String,
      quantityIn: (json['quantity_in'] as num).toDouble(),
      quantityOut: (json['quantity_out'] as num).toDouble(),
      beginningBalance: (json['beginning_balance'] as num).toDouble(),
      endingBalance: (json['ending_balance'] as num).toDouble(),
      material: Material.fromJson(json['material'] as Map<String, dynamic>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, dynamic>),
      updatedById: (json['updated_by_id'] as num).toInt(),
      createdById: (json['created_by_id'] as num).toInt(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$MaterialStockImplToJson(_$MaterialStockImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'period': instance.period,
      'na': instance.na,
      'quantity_in': instance.quantityIn,
      'quantity_out': instance.quantityOut,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'material': instance.material,
      'material_group': instance.materialGroup,
      'updated_by_id': instance.updatedById,
      'created_by_id': instance.createdById,
      'expired_date': instance.expiredDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
