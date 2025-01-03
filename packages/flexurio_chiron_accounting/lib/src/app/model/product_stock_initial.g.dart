// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_initial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockInitialImpl _$$ProductStockInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockInitialImpl(
      period: json['period'] as String,
      warehouse: json['warehouse'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      unitId: json['unit_id'] as String,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      totalEndingBalance: (json['total_ending_balance'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      batchNoId: json['batch_no_id'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      updatedById: (json['updated_by_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductStockInitialImplToJson(
        _$ProductStockInitialImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'warehouse': instance.warehouse,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'expired_date': instance.expiredDate.toIso8601String(),
      'unit_id': instance.unitId,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'total_ending_balance': instance.totalEndingBalance,
      'product': instance.product,
      'batch_no_id': instance.batchNoId,
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
    };
