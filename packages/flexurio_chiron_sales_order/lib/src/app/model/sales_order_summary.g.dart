// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderSummaryImpl _$$SalesOrderSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderSummaryImpl(
      productType: json['product_type'] as String,
      purchaseOrderDistributor: json['purchase_order_distributor'] as String,
      salesOrderId: json['sales_order_id'] as String,
      salesOrderDate: isoDateToDateTime(json['sales_order_date'] as String?),
      batchNoId: json['batch_no_id'] as String?,
      expiredDate: dateTimeNullable(json['expired_date'] as String?),
      deliveryOrderReceived: json['delivery_order_received'] as String?,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      salesOrderQuantity: (json['sales_order_quantity'] as num).toInt(),
      salesOrderQuantityDelivery:
          (json['sales_order_quantity_delivery'] as num).toInt(),
      unitId: json['unit_id'] as String,
      productPrice: (json['product_price'] as num).toInt(),
      valueSalesOrder: (json['value_sales_order'] as num).toInt(),
      valueRealization: (json['value_realization'] as num).toInt(),
    );

Map<String, dynamic> _$$SalesOrderSummaryImplToJson(
        _$SalesOrderSummaryImpl instance) =>
    <String, dynamic>{
      'product_type': instance.productType,
      'purchase_order_distributor': instance.purchaseOrderDistributor,
      'sales_order_id': instance.salesOrderId,
      'sales_order_date': instance.salesOrderDate.toIso8601String(),
      'batch_no_id': instance.batchNoId,
      'expired_date': instance.expiredDate?.toIso8601String(),
      'delivery_order_received': instance.deliveryOrderReceived,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'sales_order_quantity': instance.salesOrderQuantity,
      'sales_order_quantity_delivery': instance.salesOrderQuantityDelivery,
      'unit_id': instance.unitId,
      'product_price': instance.productPrice,
      'value_sales_order': instance.valueSalesOrder,
      'value_realization': instance.valueRealization,
    };
