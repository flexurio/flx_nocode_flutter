// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_receive_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnReceiveReportImpl _$$ProductReturnReceiveReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnReceiveReportImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      productPrice: (json['product_price'] as num).toInt(),
      batchNo: json['batch_no'] as String,
      quantity: (json['quantity'] as num).toInt(),
      quantityRemaining: (json['quantity_remaining'] as num).toInt(),
      quantityCheck: (json['quantity_check'] as num).toInt(),
      totalProductPrice: (json['total_product_price'] as num).toInt(),
      checkQcById: (json['check_qc_by_id'] as num).toInt(),
      repackAt: dateTimeNullable(json['repack_at'] as String?),
      repackById: (json['repack_by_id'] as num).toInt(),
      status: json['status'] as String,
      quantityQualityAssuranceCheck:
          (json['quantity_quality_assurance_check'] as num).toInt(),
      description: json['description'] as String,
      qualityAssuranceCheckById:
          (json['quality_assurance_check_by_id'] as num).toInt(),
      qualityAssuranceCheckDate:
          isoDateToDateTime(json['quality_assurance_check_date'] as String?),
      quantityWarehouseReturn:
          (json['quantity_warehouse_return'] as num).toInt(),
      quantityWarehouseRemaining:
          (json['quantity_warehouse_remaining'] as num).toInt(),
      quantityOutReturn: (json['quantity_out_return'] as num).toInt(),
      quantityOutRemaining: (json['quantity_out_remaining'] as num).toInt(),
      unitId: json['unit_id'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      productReturn: ProductReturn.fromJson(
          json['product_return_id'] as Map<String, dynamic>),
      productId: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      expirationDate: dateTimeNullable(json['expiration_date'] as String?),
      checkQcAt: dateTimeNullable(json['check_qc_at'] as String?),
      deliveryOrderDate:
          dateTimeNullable(json['delivery_order_date'] as String?),
    );

Map<String, dynamic> _$$ProductReturnReceiveReportImplToJson(
        _$ProductReturnReceiveReportImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product_price': instance.productPrice,
      'batch_no': instance.batchNo,
      'quantity': instance.quantity,
      'quantity_remaining': instance.quantityRemaining,
      'quantity_check': instance.quantityCheck,
      'total_product_price': instance.totalProductPrice,
      'check_qc_by_id': instance.checkQcById,
      'repack_at': instance.repackAt?.toIso8601String(),
      'repack_by_id': instance.repackById,
      'status': instance.status,
      'quantity_quality_assurance_check':
          instance.quantityQualityAssuranceCheck,
      'description': instance.description,
      'quality_assurance_check_by_id': instance.qualityAssuranceCheckById,
      'quality_assurance_check_date':
          instance.qualityAssuranceCheckDate.toIso8601String(),
      'quantity_warehouse_return': instance.quantityWarehouseReturn,
      'quantity_warehouse_remaining': instance.quantityWarehouseRemaining,
      'quantity_out_return': instance.quantityOutReturn,
      'quantity_out_remaining': instance.quantityOutRemaining,
      'unit_id': instance.unitId,
      'delivery_order_id': instance.deliveryOrderId,
      'product_return_id': instance.productReturn,
      'product_id': instance.productId,
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'check_qc_at': instance.checkQcAt?.toIso8601String(),
      'delivery_order_date': instance.deliveryOrderDate?.toIso8601String(),
    };
