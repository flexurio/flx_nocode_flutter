// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recap_expired_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecapExpiredProductImpl _$$RecapExpiredProductImplFromJson(
        Map<String, dynamic> json) =>
    _$RecapExpiredProductImpl(
      period: json['period'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      qtyIn: (json['qty_in'] as num).toInt(),
      qtyOut: (json['qty_out'] as num).toInt(),
      qtyOutMarketing: (json['qty_out_marketing'] as num).toInt(),
      warehouse: json['warehouse'] as String,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      endingBalanceMarketing: (json['ending_balance_marketing'] as num).toInt(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      productReceivedId: json['product_received_id'] as String,
      batchNoId: json['batch_no_id'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      unit: json['unit'] as String,
      division: json['division'] as String,
      qtyProductReceive: (json['qty_product_receive'] as num).toInt(),
      releaseAt: isoDateToDateTime(json['release_at'] as String?),
    );

Map<String, dynamic> _$$RecapExpiredProductImplToJson(
        _$RecapExpiredProductImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'qty_in': instance.qtyIn,
      'qty_out': instance.qtyOut,
      'qty_out_marketing': instance.qtyOutMarketing,
      'warehouse': instance.warehouse,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'ending_balance_marketing': instance.endingBalanceMarketing,
      'expired_date': instance.expiredDate.toIso8601String(),
      'product_received_id': instance.productReceivedId,
      'batch_no_id': instance.batchNoId,
      'product': instance.product,
      'unit': instance.unit,
      'division': instance.division,
      'qty_product_receive': instance.qtyProductReceive,
      'release_at': instance.releaseAt.toIso8601String(),
    };
