// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockImpl _$$ProductStockImplFromJson(Map<String, dynamic> json) =>
    _$ProductStockImpl(
      id: json['id'] as String?,
      createAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      period: json['period'] as String,
      qtyIn: (json['qty_in'] as num).toInt(),
      qtyOut: (json['qty_out'] as num).toInt(),
      qtyOutMarketing: (json['qty_out_marketing'] as num).toInt(),
      warehouse: json['warehouse'] as String?,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      endingBalanceMarketing: (json['ending_balance_marketing'] as num).toInt(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      productGroup:
          ProductGroup.fromJson(json['product_group'] as Map<String, dynamic>),
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      batch: Batch.fromJson(json['batch_no'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductStockImplToJson(_$ProductStockImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'period': instance.period,
      'qty_in': instance.qtyIn,
      'qty_out': instance.qtyOut,
      'qty_out_marketing': instance.qtyOutMarketing,
      'warehouse': instance.warehouse,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'ending_balance_marketing': instance.endingBalanceMarketing,
      'expired_date': instance.expiredDate.toIso8601String(),
      'product_group': instance.productGroup,
      'unit': instance.unit,
      'batch_no': instance.batch,
      'product': instance.product,
    };

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      json['id'] as String,
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
