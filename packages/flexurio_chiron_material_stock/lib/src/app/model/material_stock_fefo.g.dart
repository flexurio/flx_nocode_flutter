// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock_fefo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockFefoImpl _$$MaterialStockFefoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockFefoImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedById: (json['updated_by_id'] as num).toInt(),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, dynamic>),
      period: json['period'] as String,
      na: json['na'] as String,
      quantityIn: (json['quantity_in'] as num).toInt(),
      quantityOut: (json['quantity_out'] as num).toInt(),
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      releasedDate: isoDateToDateTime(json['released_date'] as String?),
    );

Map<String, dynamic> _$$MaterialStockFefoImplToJson(
        _$MaterialStockFefoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
      'material': instance.material,
      'material_group': instance.materialGroup,
      'period': instance.period,
      'na': instance.na,
      'quantity_in': instance.quantityIn,
      'quantity_out': instance.quantityOut,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'expired_date': instance.expiredDate.toIso8601String(),
      'released_date': instance.releasedDate.toIso8601String(),
    };
