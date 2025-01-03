// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_malk_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderMalkSummaryImpl _$$SalesOrderMalkSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderMalkSummaryImpl(
      salesOrderId: json['sales_order_id'] as String,
      salesOrderDate: isoDateToDateTime(json['sales_order_date'] as String?),
      description: json['description'] as String,
      productType: json['product_type'] as String,
      purchaseOrderDistributor: json['purchase_order_distributor'] as String,
      batchNoId: json['batch_no_id'] as String,
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      customerDeliveryAddress: json['customer_delivery_address'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      qty: (json['qty'] as num).toInt(),
      qtyDelivery: (json['qty_delivery'] as num).toInt(),
      unitId: json['unit_id'] as String,
      price: (json['price'] as num).toInt(),
      productDiscountPercent: (json['product_discount_percent'] as num).toInt(),
      additionalDiscountPercent:
          (json['additional_discount_percent'] as num).toInt(),
      valueSalesOrder: (json['value_sales_order'] as num).toInt(),
      valueRealization: (json['value_realization'] as num).toInt(),
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
    );

Map<String, dynamic> _$$SalesOrderMalkSummaryImplToJson(
        _$SalesOrderMalkSummaryImpl instance) =>
    <String, dynamic>{
      'sales_order_id': instance.salesOrderId,
      'sales_order_date': instance.salesOrderDate.toIso8601String(),
      'description': instance.description,
      'product_type': instance.productType,
      'purchase_order_distributor': instance.purchaseOrderDistributor,
      'batch_no_id': instance.batchNoId,
      'expired_date': instance.expiredDate.toIso8601String(),
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'customer_delivery_address': instance.customerDeliveryAddress,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'qty': instance.qty,
      'qty_delivery': instance.qtyDelivery,
      'unit_id': instance.unitId,
      'price': instance.price,
      'product_discount_percent': instance.productDiscountPercent,
      'additional_discount_percent': instance.additionalDiscountPercent,
      'value_sales_order': instance.valueSalesOrder,
      'value_realization': instance.valueRealization,
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
    };
