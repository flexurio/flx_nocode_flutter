// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_card_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockCardBatchImpl _$$ProductStockCardBatchImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockCardBatchImpl(
      transactionId: json['transaction_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      batchNo: json['batch_no'] as String,
      unit: json['unit'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      description: json['description'] as String,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      debit: (json['debit'] as num).toInt(),
      credit: (json['credit'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductStockCardBatchImplToJson(
        _$ProductStockCardBatchImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'batch_no': instance.batchNo,
      'unit': instance.unit,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
      'beginning_balance': instance.beginningBalance,
      'debit': instance.debit,
      'credit': instance.credit,
    };
