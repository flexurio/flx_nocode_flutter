// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductIssueImpl _$$ProductIssueImplFromJson(Map<String, dynamic> json) =>
    _$ProductIssueImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String,
      invoiceId: json['invoice_id'] as String,
      invoiceDate: isoDateToDateTime(json['invoice_date'] as String?),
      remark: json['remark'] as String? ?? '',
      expedition: json['expedition'] as String? ?? '',
      shippingNo: json['shipping_no'] as String? ?? '',
      shipmentVia: json['shipment_via'] == null
          ? ProductIssueShipmentVia.empty
          : ProductIssueShipmentVia.fromString(json['shipment_via'] as String),
      deliveryOrderDate:
          dateTimeNullable(json['delivery_order_date'] as String?),
      deliveryOrderReceived:
          dateTimeNullable(json['delivery_order_received'] as String?),
      deliveryDate: isoDateToDateTime(json['delivery_date'] as String?),
      shippingCharge: (json['shipping_charge'] as num?)?.toInt() ?? 0,
      packageQty: (json['package_qty'] as num?)?.toInt() ?? 0,
      kilogramQty: (json['kilogram_qty'] as num?)?.toInt() ?? 0,
      endPackingDate: dateTimeNullable(json['end_packing_date'] as String?),
      salesOrderId: json['sales_order_id'] as String? ?? '',
      noReferenceOthers: json['no_reference_others'] as String? ?? '',
      soInputDate: dateTimeNullable(json['so_input_date'] as String?),
    );

Map<String, dynamic> _$$ProductIssueImplToJson(_$ProductIssueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'invoice_id': instance.invoiceId,
      'invoice_date': instance.invoiceDate.toIso8601String(),
      'remark': instance.remark,
      'expedition': instance.expedition,
      'shipping_no': instance.shippingNo,
      'shipment_via': _$ProductIssueShipmentViaEnumMap[instance.shipmentVia]!,
      'delivery_order_date': instance.deliveryOrderDate?.toIso8601String(),
      'delivery_order_received':
          instance.deliveryOrderReceived?.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'shipping_charge': instance.shippingCharge,
      'package_qty': instance.packageQty,
      'kilogram_qty': instance.kilogramQty,
      'end_packing_date': instance.endPackingDate?.toIso8601String(),
      'sales_order_id': instance.salesOrderId,
      'no_reference_others': instance.noReferenceOthers,
      'so_input_date': instance.soInputDate?.toIso8601String(),
    };

const _$ProductIssueShipmentViaEnumMap = {
  ProductIssueShipmentVia.empty: 'empty',
  ProductIssueShipmentVia.darat: 'darat',
  ProductIssueShipmentVia.laut: 'laut',
  ProductIssueShipmentVia.udara: 'udara',
  ProductIssueShipmentVia.daratLaut: 'daratLaut',
  ProductIssueShipmentVia.daratUdara: 'daratUdara',
};
