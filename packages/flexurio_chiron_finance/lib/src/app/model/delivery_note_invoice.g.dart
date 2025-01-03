// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_note_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryNoteInvoiceImpl _$$DeliveryNoteInvoiceImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryNoteInvoiceImpl(
      year: (json['year'] as num).toInt(),
      period: json['period'] as String,
      codeInvoice: json['code_invoice'] as String,
      codeSalesInvoice: json['code_sales_invoice'] as String,
      salesInvoiceId: json['sales_invoice_id'] as String,
      dateSalesOrder: isoDateToDateTime(json['date_sales_order'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String,
      invoiceId: json['invoice_id'] as String,
      dateTransaction: isoDateToDateTime(json['date_transaction'] as String?),
      taxInvoiceNo: json['tax_invoice_no'] as String,
      customerId: json['customer_id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      batchNoId: json['batch_no_id'] as String,
      qty: (json['qty'] as num).toInt(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      subTotalAfterDiscount: (json['subtotal_after_discount'] as num).toInt(),
      ppnValue: (json['ppn_value'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$$DeliveryNoteInvoiceImplToJson(
        _$DeliveryNoteInvoiceImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'period': instance.period,
      'code_invoice': instance.codeInvoice,
      'code_sales_invoice': instance.codeSalesInvoice,
      'sales_invoice_id': instance.salesInvoiceId,
      'date_sales_order': instance.dateSalesOrder.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'invoice_id': instance.invoiceId,
      'date_transaction': instance.dateTransaction.toIso8601String(),
      'tax_invoice_no': instance.taxInvoiceNo,
      'customer_id': instance.customerId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'batch_no_id': instance.batchNoId,
      'qty': instance.qty,
      'discount_percent': instance.discountPercent,
      'subtotal_after_discount': instance.subTotalAfterDiscount,
      'ppn_value': instance.ppnValue,
      'price': instance.price,
    };
