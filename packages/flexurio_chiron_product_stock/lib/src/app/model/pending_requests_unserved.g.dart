// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_requests_unserved.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRequestsUnservedImpl _$$PendingRequestsUnservedImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingRequestsUnservedImpl(
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
      initialSalesOrderId: json['initial_sales_order_id'] as String?,
      finalSalesOrderId: json['final_sales_order_id'] as String?,
      customerName: json['customer_name'] as String,
      customerId: json['customer_id'] as String,
      purchaseOrderDistributor: json['purchase_order_distributor'] as String,
      typeProduct: json['type_product'] as String,
      productPrice: (json['product_price'] as num).toInt(),
      productRequestQuantity: (json['product_request_quantity'] as num).toInt(),
      initialSalesOrderate:
          dateTimeNullable(json['initial_sales_order_date'] as String?),
      finalSalesOrderDate:
          dateTimeNullable(json['final_sales_order_date'] as String?),
    );

Map<String, dynamic> _$$PendingRequestsUnservedImplToJson(
        _$PendingRequestsUnservedImpl instance) =>
    <String, dynamic>{
      'ProductRequestId': instance.productRequestId,
      'product_request_date': instance.productRequestDate.toIso8601String(),
      'department_id': instance.departmentId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_id': instance.unitId,
      'total_product_request_price': instance.totalProductRequestPrice,
      'quantity_remaining': instance.quantityRemaining,
      'initial_sales_order_id': instance.initialSalesOrderId,
      'final_sales_order_id': instance.finalSalesOrderId,
      'customer_name': instance.customerName,
      'customer_id': instance.customerId,
      'purchase_order_distributor': instance.purchaseOrderDistributor,
      'type_product': instance.typeProduct,
      'product_price': instance.productPrice,
      'product_request_quantity': instance.productRequestQuantity,
      'initial_sales_order_date':
          instance.initialSalesOrderate?.toIso8601String(),
      'final_sales_order_date': instance.finalSalesOrderDate?.toIso8601String(),
    };
