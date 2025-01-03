// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceReceiptImpl _$$InvoiceReceiptImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceReceiptImpl(
      taxInvoiceNumber: json['tax_invoice_number'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      orderId: json['order_id'] as String,
      transactionNo: json['transaction_no'] as String,
      deliveryAddress: json['delivery_address'] as String?,
      total: (json['total'] as num).toDouble(),
      taxInvoice: json['tax_invoice'] as String?,
      division: json['division'] as String?,
    );

Map<String, dynamic> _$$InvoiceReceiptImplToJson(
        _$InvoiceReceiptImpl instance) =>
    <String, dynamic>{
      'tax_invoice_number': instance.taxInvoiceNumber,
      'date': instance.date.toIso8601String(),
      'order_id': instance.orderId,
      'transaction_no': instance.transactionNo,
      'delivery_address': instance.deliveryAddress,
      'total': instance.total,
      'tax_invoice': instance.taxInvoice,
      'division': instance.division,
    };
