// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      total: (json['total'] as num).toDouble(),
      date: isoDateToDateTime(json['date'] as String?),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      transactionTypeId: json['transaction_type_id'] as String?,
      isTypeTransaction: (json['is_type_transaction'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'order_id': instance.orderId,
      'total': instance.total,
      'date': instance.date.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'transaction_type_id': instance.transactionTypeId,
      'is_type_transaction': instance.isTypeTransaction,
    };
