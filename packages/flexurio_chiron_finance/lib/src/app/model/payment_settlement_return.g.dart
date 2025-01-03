// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_settlement_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSettlementReturnImpl _$$PaymentSettlementReturnImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSettlementReturnImpl(
      invoiceId: json['invoice_id'] as String,
      batchNoId: json['batch_no_id'] as String,
      taxInvoiceNo: json['tax_invoice_no'] as String,
      customerId: json['customer_id'] as String,
      productName: json['product_name'] as String,
      price: (json['price'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      discountPercent: (json['discount_percent'] as num).toInt(),
    );

Map<String, dynamic> _$$PaymentSettlementReturnImplToJson(
        _$PaymentSettlementReturnImpl instance) =>
    <String, dynamic>{
      'invoice_id': instance.invoiceId,
      'batch_no_id': instance.batchNoId,
      'tax_invoice_no': instance.taxInvoiceNo,
      'customer_id': instance.customerId,
      'product_name': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
      'discount_percent': instance.discountPercent,
    };
