// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_tax_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesTaxReportImpl _$$SalesTaxReportImplFromJson(Map<String, dynamic> json) =>
    _$SalesTaxReportImpl(
      productID: json['product_id'] as String,
      productName: json['product_name'] as String,
      taxInvoiceNumber: json['tax_invoice_number'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      period: json['period'] as String,
      subTotal: (json['subtotal'] as num).toDouble(),
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      valueDiscount: (json['value_discount'] as num).toDouble(),
      customerNpwpNumber: json['customer_npwp_number'] as String,
      subTotalAfterAdditionalDiscount:
          (json['subtotal_after_additional_discount'] as num).toDouble(),
      customerName: json['customer_name'] as String,
      customerAddress: json['customer_address'] as String,
      grandTotal: (json['grand_total'] as num).toDouble(),
      subTotalAfterDiscount:
          (json['subtotal_after_discount'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      transactionNo: json['transaction_no'] as String,
    );

Map<String, dynamic> _$$SalesTaxReportImplToJson(
        _$SalesTaxReportImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productID,
      'product_name': instance.productName,
      'tax_invoice_number': instance.taxInvoiceNumber,
      'price': instance.price,
      'quantity': instance.quantity,
      'period': instance.period,
      'subtotal': instance.subTotal,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'value_discount': instance.valueDiscount,
      'customer_npwp_number': instance.customerNpwpNumber,
      'subtotal_after_additional_discount':
          instance.subTotalAfterAdditionalDiscount,
      'customer_name': instance.customerName,
      'customer_address': instance.customerAddress,
      'grand_total': instance.grandTotal,
      'subtotal_after_discount': instance.subTotalAfterDiscount,
      'ppn_value': instance.ppnValue,
      'transaction_no': instance.transactionNo,
    };
