// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReceiveImpl _$$ProductReceiveImplFromJson(Map<String, dynamic> json) =>
    _$ProductReceiveImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      description: json['description'] as String? ?? '',
      deliveryOrderId: json['delivery_order_id'] as String?,
      deliveryOrderDate:
          dateTimeNullableFromJson(json['delivery_order_date'] as String?),
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      status: ProductReceiveStatus.fromString(json['status'] as String),
      transactionType: TransactionType.fromJson(
          json['transaction_type'] as Map<String, dynamic>),
      purchaseOrder: PurchaseOrder.fromJson(
          json['purchase_order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductReceiveImplToJson(
        _$ProductReceiveImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'description': instance.description,
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate?.toIso8601String(),
      'supplier': instance.supplier,
      'status': _$ProductReceiveStatusEnumMap[instance.status]!,
      'transaction_type': instance.transactionType,
      'purchase_order': instance.purchaseOrder,
    };

const _$ProductReceiveStatusEnumMap = {
  ProductReceiveStatus.empty: 'empty',
  ProductReceiveStatus.input: 'input',
  ProductReceiveStatus.inProgress: 'inProgress',
  ProductReceiveStatus.close: 'close',
};
