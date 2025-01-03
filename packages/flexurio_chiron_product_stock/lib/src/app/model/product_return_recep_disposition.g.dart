// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_recep_disposition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnRecapDispositionImpl
    _$$ProductReturnRecapDispositionImplFromJson(Map<String, dynamic> json) =>
        _$ProductReturnRecapDispositionImpl(
          id: (json['id'] as num).toInt(),
          createdById: (json['created_by_id'] as num).toInt(),
          updatedById: (json['updated_by_id'] as num).toInt(),
          createdAt: DateTime.parse(json['created_at'] as String),
          updatedAt: json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
          batchNo: json['batch_no'] as String,
          status: json['status'] as String,
          quantity: (json['quantity'] as num).toDouble(),
          description: json['description'] as String,
          qualityAssuranceCheckById:
              (json['quality_assurance_check_by_id'] as num).toInt(),
          qualityAssuranceCheckDate:
              DateTime.parse(json['quality_assurance_check_date'] as String),
          quantityWarehouseReturn:
              (json['quantity_warehouse_return'] as num).toDouble(),
          quantityWarehouseRemaining:
              (json['quantity_warehouse_remaining'] as num).toDouble(),
          quantityOutReturn: (json['quantity_out_return'] as num).toDouble(),
          quantityOutRemaining:
              (json['quantity_out_remaining'] as num).toDouble(),
          deliveryOrderId: json['delivery_order_id'] as String,
          deliveryOrderDate:
              dateTimeNullableFromJson(json['delivery_order_date'] as String?),
          unitId: json['unit_id'] as String,
          product: Product.fromJson(json['product_id'] as Map<String, dynamic>),
          productReturn: ProductReturn.fromJson(
              json['product_return_id'] as Map<String, dynamic>),
          confirmPpicAt:
              dateTimeNullableFromJson(json['confirm_ppic_at'] as String?),
          productIssueDate:
              dateTimeNullableFromJson(json['product_issue_date'] as String?),
        );

Map<String, dynamic> _$$ProductReturnRecapDispositionImplToJson(
        _$ProductReturnRecapDispositionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'batch_no': instance.batchNo,
      'status': instance.status,
      'quantity': instance.quantity,
      'description': instance.description,
      'quality_assurance_check_by_id': instance.qualityAssuranceCheckById,
      'quality_assurance_check_date':
          instance.qualityAssuranceCheckDate.toIso8601String(),
      'quantity_warehouse_return': instance.quantityWarehouseReturn,
      'quantity_warehouse_remaining': instance.quantityWarehouseRemaining,
      'quantity_out_return': instance.quantityOutReturn,
      'quantity_out_remaining': instance.quantityOutRemaining,
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate?.toIso8601String(),
      'unit_id': instance.unitId,
      'product_id': instance.product,
      'product_return_id': instance.productReturn,
      'confirm_ppic_at': instance.confirmPpicAt?.toIso8601String(),
      'product_issue_date': instance.productIssueDate?.toIso8601String(),
    };
