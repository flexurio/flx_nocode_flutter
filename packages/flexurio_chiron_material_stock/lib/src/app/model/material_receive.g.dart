// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiveImpl _$$MaterialReceiveImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReceiveImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      transactionType: TransactionType.fromJson(
          json['transaction_type'] as Map<String, dynamic>),
      purchaseOrder: PurchaseOrder.fromJson(
          json['purchase_order'] as Map<String, dynamic>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      vendor: Vendor.fromJson(json['vendor'] as Map<String, Object?>),
      deliveryOrderId: json['delivery_order_id'] as String,
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      description: json['description'] as String,
      warehouse:
          WarehouseMaterialReceive.fromString(json['warehouse'] as String),
      isInvoiceReceive: json['is_invoice_receive'] as bool? ?? false,
    );

Map<String, dynamic> _$$MaterialReceiveImplToJson(
        _$MaterialReceiveImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'transaction_type': instance.transactionType,
      'purchase_order': instance.purchaseOrder,
      'material_group': instance.materialGroup,
      'department': instance.department,
      'vendor': instance.vendor,
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'description': instance.description,
      'warehouse': _$WarehouseMaterialReceiveEnumMap[instance.warehouse]!,
      'is_invoice_receive': instance.isInvoiceReceive,
    };

const _$WarehouseMaterialReceiveEnumMap = {
  WarehouseMaterialReceive.empty: 'empty',
  WarehouseMaterialReceive.ppic: 'ppic',
  WarehouseMaterialReceive.alkes: 'alkes',
  WarehouseMaterialReceive.engineering: 'engineering',
  WarehouseMaterialReceive.cs: 'cs',
  WarehouseMaterialReceive.rnd: 'rnd',
};
