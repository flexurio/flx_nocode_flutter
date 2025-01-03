// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_date_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryDateRecapImpl _$$DeliveryDateRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryDateRecapImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String,
      invoiceId: json['invoice_id'] as String,
      invoiceDate: isoDateToDateTime(json['invoice_date'] as String?),
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      deliveryDate: isoDateToDateTime(json['delivery_date'] as String?),
      batchNoId: json['batch_no_id'] as String,
      qty: (json['qty'] as num).toInt(),
      productName: json['product_name'] as String,
      expirationDate: isoDateToDateTime(json['expiration_date'] as String?),
      deliveryOrderReceived:
          dateTimeNullable(json['delivery_order_received'] as String?),
      poInputDate: dateTimeNullable(json['po_input_date'] as String?),
      soInputDate: dateTimeNullable(json['so_input_date'] as String?),
      endPackingDate: dateTimeNullable(json['end_packing_date'] as String?),
      shipmentInputDate:
          dateTimeNullable(json['shipment_input_date'] as String?),
      remark: json['remark'] as String?,
      expedition: json['expedition'] as String?,
      customerId: json['customer_id'] as String?,
      customerName: json['customer_name'] as String?,
      customerCity: json['customer_city'] as String?,
    );

Map<String, dynamic> _$$DeliveryDateRecapImplToJson(
        _$DeliveryDateRecapImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'invoice_id': instance.invoiceId,
      'invoice_date': instance.invoiceDate.toIso8601String(),
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'batch_no_id': instance.batchNoId,
      'qty': instance.qty,
      'product_name': instance.productName,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'delivery_order_received':
          instance.deliveryOrderReceived?.toIso8601String(),
      'po_input_date': instance.poInputDate?.toIso8601String(),
      'so_input_date': instance.soInputDate?.toIso8601String(),
      'end_packing_date': instance.endPackingDate?.toIso8601String(),
      'shipment_input_date': instance.shipmentInputDate?.toIso8601String(),
      'remark': instance.remark,
      'expedition': instance.expedition,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'customer_city': instance.customerCity,
    };
