// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_non_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionNonOrderImpl _$$TransactionNonOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionNonOrderImpl(
      id: (json['ID'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      transactionNo: json['transaction_no'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      title: json['title'] as String,
      chartOfAccountNo: json['chart_of_account_id'] as String,
      unique: json['unique'] as String,
      value: (json['value'] as num).toDouble(),
      type: TransactionNonOrderType.fromString(json['type'] as String),
    );

Map<String, dynamic> _$$TransactionNonOrderImplToJson(
        _$TransactionNonOrderImpl instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'title': instance.title,
      'chart_of_account_id': instance.chartOfAccountNo,
      'unique': instance.unique,
      'value': instance.value,
      'type': _$TransactionNonOrderTypeEnumMap[instance.type]!,
    };

const _$TransactionNonOrderTypeEnumMap = {
  TransactionNonOrderType.empty: 'empty',
  TransactionNonOrderType.penjualan: 'penjualan',
  TransactionNonOrderType.pelunasan: 'pelunasan',
  TransactionNonOrderType.payment: 'payment',
  TransactionNonOrderType.pembelian: 'pembelian',
};
