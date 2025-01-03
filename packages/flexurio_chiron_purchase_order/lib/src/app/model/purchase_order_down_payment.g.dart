// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_down_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderDownPaymentImpl _$$PurchaseOrderDownPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderDownPaymentImpl(
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      id: json['id'] as String,
      purchaseOrderId: json['purchase_order_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      isUsed: json['is_used'] as bool,
      dpUsage: (json['dp_usage'] as num).toInt(),
      dpRemaining: (json['dp_remaining'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PurchaseOrderDownPaymentImplToJson(
        _$PurchaseOrderDownPaymentImpl instance) =>
    <String, dynamic>{
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'purchase_order_id': instance.purchaseOrderId,
      'amount': instance.amount,
      'due_date': instance.dueDate.toIso8601String(),
      'is_used': instance.isUsed,
      'dp_usage': instance.dpUsage,
      'dp_remaining': instance.dpRemaining,
    };
