// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionPaymentImpl _$$TransactionPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionPaymentImpl(
      period: json['period'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      orderId: json['order_id'] as String,
      transactionNo: json['transaction_no'] as String,
      invoiceNo: json['invoice_no'] as String?,
      supplierName: json['supplier'] as String,
      supplierId: json['supplier_id'] as String,
      total: (json['total'] as num).toDouble(),
      paymentId: json['payment_id'] as String?,
      paymentDate: dateTimeNullable(json['payment_date'] as String?),
      paymentTotal: (json['payment_total'] as num).toDouble(),
      isTypeTransaction: (json['is_type_transaction'] as num).toInt(),
      paymentRemaining: (json['payment_remaining'] as num).toDouble(),
    );

Map<String, dynamic> _$$TransactionPaymentImplToJson(
        _$TransactionPaymentImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'order_id': instance.orderId,
      'transaction_no': instance.transactionNo,
      'invoice_no': instance.invoiceNo,
      'supplier': instance.supplierName,
      'supplier_id': instance.supplierId,
      'total': instance.total,
      'payment_id': instance.paymentId,
      'payment_date': instance.paymentDate?.toIso8601String(),
      'payment_total': instance.paymentTotal,
      'is_type_transaction': instance.isTypeTransaction,
      'payment_remaining': instance.paymentRemaining,
    };
