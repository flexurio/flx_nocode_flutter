// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_mutation_product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockMutationProductDetailImpl
    _$$ProductStockMutationProductDetailImplFromJson(
            Map<String, dynamic> json) =>
        _$ProductStockMutationProductDetailImpl(
          productId: json['product_id'] as String,
          productName: json['product_name'] as String,
          productDivision: json['product_division'] as String,
          unit: json['unit'] as String,
          beginningBalance: (json['beginning_balance'] as num).toInt(),
          qtyIn: (json['qty_in'] as num).toInt(),
          qtyOut: (json['qty_out'] as num).toInt(),
          qtyOutReturn: (json['qty_out_return'] as num).toInt(),
          qtyOutAnother: (json['qty_out_another'] as num).toInt(),
          endingBalance: (json['ending_balance'] as num).toInt(),
          expiredDate: isoDateToDateTime(json['expired_date'] as String?),
        );

Map<String, dynamic> _$$ProductStockMutationProductDetailImplToJson(
        _$ProductStockMutationProductDetailImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_division': instance.productDivision,
      'unit': instance.unit,
      'beginning_balance': instance.beginningBalance,
      'qty_in': instance.qtyIn,
      'qty_out': instance.qtyOut,
      'qty_out_return': instance.qtyOutReturn,
      'qty_out_another': instance.qtyOutAnother,
      'ending_balance': instance.endingBalance,
      'expired_date': instance.expiredDate.toIso8601String(),
    };
