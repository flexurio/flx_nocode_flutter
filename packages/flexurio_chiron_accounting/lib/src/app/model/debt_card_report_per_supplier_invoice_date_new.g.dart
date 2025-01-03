// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_card_report_per_supplier_invoice_date_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebtCardReportPerSupplierInvoiceDateNewImpl
    _$$DebtCardReportPerSupplierInvoiceDateNewImplFromJson(
            Map<String, dynamic> json) =>
        _$DebtCardReportPerSupplierInvoiceDateNewImpl(
          invoiceNo: json['invoice_no'] as String,
          paymentId: json['payment_id'] as String,
          orderId: json['order_id'] as String,
          deliveryOrderId: json['delivery_order_id'] as String,
          transactionId: json['transaction_id'] as String,
          paymentRemaining: (json['payment_remaining'] as num).toInt(),
          paymentAmount: (json['payment_amount'] as num).toInt(),
          invoiceDate: isoDateToDateTime(json['invoice_date'] as String?),
          invoiceReceiveDate:
              isoDateToDateTime(json['invoice_receive_date'] as String?),
          dueDate: isoDateToDateTime(json['due_date'] as String?),
          transactionDate:
              isoDateToDateTime(json['transaction_date'] as String?),
          supplierName: json['supplier_name'] as String,
          supplierAddress: json['supplier_address'] as String,
          description: json['description'] as String?,
          receiveDate:
              dateTimeNullableFromJson(json['receive_date'] as String?),
        );

Map<String, dynamic> _$$DebtCardReportPerSupplierInvoiceDateNewImplToJson(
        _$DebtCardReportPerSupplierInvoiceDateNewImpl instance) =>
    <String, dynamic>{
      'invoice_no': instance.invoiceNo,
      'payment_id': instance.paymentId,
      'order_id': instance.orderId,
      'delivery_order_id': instance.deliveryOrderId,
      'transaction_id': instance.transactionId,
      'payment_remaining': instance.paymentRemaining,
      'payment_amount': instance.paymentAmount,
      'invoice_date': instance.invoiceDate.toIso8601String(),
      'invoice_receive_date': instance.invoiceReceiveDate.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'transaction_date': instance.transactionDate.toIso8601String(),
      'supplier_name': instance.supplierName,
      'supplier_address': instance.supplierAddress,
      'description': instance.description,
      'receive_date': instance.receiveDate?.toIso8601String(),
    };
