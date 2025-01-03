// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_requests_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRequestsDetailImpl _$$PendingRequestsDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingRequestsDetailImpl(
      productRequestId: json['ProductRequestId'] as String,
      productRequestDate:
          isoDateToDateTime(json['product_request_date'] as String?),
      departmentId: json['department_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      unitId: json['unit_id'] as String,
      totalProductRequestPrice:
          (json['total_product_request_price'] as num).toInt(),
      quantityRemaining: (json['quantity_remaining'] as num).toInt(),
      salesOrderId: json['sales_order_id'] as String?,
      customerName: json['customer_name'] as String,
      customerId: json['customer_id'] as String,
    );

Map<String, dynamic> _$$PendingRequestsDetailImplToJson(
        _$PendingRequestsDetailImpl instance) =>
    <String, dynamic>{
      'ProductRequestId': instance.productRequestId,
      'product_request_date': instance.productRequestDate.toIso8601String(),
      'department_id': instance.departmentId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_id': instance.unitId,
      'total_product_request_price': instance.totalProductRequestPrice,
      'quantity_remaining': instance.quantityRemaining,
      'sales_order_id': instance.salesOrderId,
      'customer_name': instance.customerName,
      'customer_id': instance.customerId,
    };
