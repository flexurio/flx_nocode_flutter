// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockRecapImpl _$$ProductStockRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockRecapImpl(
      period: json['period'] as String,
      warehouse: json['warehouse'] as String,
      unit: json['unit'] as String,
      division: json['division'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      releaseAt: isoDateToDateTime(json['release_at'] as String?),
      qtyIn: (json['qty_in'] as num).toInt(),
      qtyOut: (json['qty_out'] as num).toInt(),
      qtyOutMarketing: (json['qty_out_marketing'] as num).toInt(),
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      endingBalanceMarketing: (json['ending_balance_marketing'] as num).toInt(),
      qtyProductReceive: (json['qty_product_receive'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productReceivedId: json['product_received_id'] as String,
      batchNoId: json['batch_no_id'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      updatedById: (json['updated_by_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductStockRecapImplToJson(
        _$ProductStockRecapImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'warehouse': instance.warehouse,
      'unit': instance.unit,
      'division': instance.division,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'expired_date': instance.expiredDate.toIso8601String(),
      'release_at': instance.releaseAt.toIso8601String(),
      'qty_in': instance.qtyIn,
      'qty_out': instance.qtyOut,
      'qty_out_marketing': instance.qtyOutMarketing,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'ending_balance_marketing': instance.endingBalanceMarketing,
      'qty_product_receive': instance.qtyProductReceive,
      'product': instance.product,
      'product_received_id': instance.productReceivedId,
      'batch_no_id': instance.batchNoId,
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
    };
