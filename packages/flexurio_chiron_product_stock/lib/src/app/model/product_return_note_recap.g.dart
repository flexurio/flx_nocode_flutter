// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_note_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnNoteRecapImpl _$$ProductReturnNoteRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnNoteRecapImpl(
      productReturnId: json['product_return_id'] as String,
      description: json['description'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      customer: json['customer'] as String,
      referenceNo: json['reference_no'] as String,
      warehouse: json['warehouse'] as String,
      product: json['product'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitId: json['unit_id'] as String,
      taxInvoiceNo: json['tax_invoice_no'] as String,
      productPrice: (json['product_price'] as num).toInt(),
      batchNo: json['batch_no'] as String,
      discountPercent: (json['discount_percent'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      expirationDate: isoDateToDateTime(json['expiration_date'] as String?),
    );

Map<String, dynamic> _$$ProductReturnNoteRecapImplToJson(
        _$ProductReturnNoteRecapImpl instance) =>
    <String, dynamic>{
      'product_return_id': instance.productReturnId,
      'description': instance.description,
      'delivery_order_id': instance.deliveryOrderId,
      'customer': instance.customer,
      'reference_no': instance.referenceNo,
      'warehouse': instance.warehouse,
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_id': instance.unitId,
      'tax_invoice_no': instance.taxInvoiceNo,
      'product_price': instance.productPrice,
      'batch_no': instance.batchNo,
      'discount_percent': instance.discountPercent,
      'created_at': instance.createdAt.toIso8601String(),
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'expiration_date': instance.expirationDate.toIso8601String(),
    };
