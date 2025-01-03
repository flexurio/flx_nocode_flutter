// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_general_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentGeneralExpenseImpl _$$PaymentGeneralExpenseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentGeneralExpenseImpl(
      period: json['period'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      transactionNo: json['transaction_no'] as String,
      paymentNo: json['payment_no'] as String? ?? '',
      supplier: json['supplier'] as String,
      supplierId: json['supplier_id'] as String,
      total: (json['total'] as num).toDouble(),
      paymentDate: dateTimeNullable(json['payment_date'] as String?),
      paymentTotal: (json['payment_total'] as num).toDouble(),
      paymentRemaining: (json['payment_remaining'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentGeneralExpenseImplToJson(
        _$PaymentGeneralExpenseImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'transaction_no': instance.transactionNo,
      'payment_no': instance.paymentNo,
      'supplier': instance.supplier,
      'supplier_id': instance.supplierId,
      'total': instance.total,
      'payment_date': instance.paymentDate?.toIso8601String(),
      'payment_total': instance.paymentTotal,
      'payment_remaining': instance.paymentRemaining,
    };
