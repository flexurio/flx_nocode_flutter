// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivableCustomerImpl _$$AccountsReceivableCustomerImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsReceivableCustomerImpl(
      description: json['description'] as String,
      paymentNo: json['payment_no'] as String,
      transactionNo: json['transaction_no'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      value: (json['value'] as num).toInt(),
      valuePayment: (json['value_payment'] as num).toInt(),
      remainingAmountPaid: (json['remaining_amount_paid'] as num).toInt(),
      remainingAmount: (json['remaining_amount'] as num).toInt(),
      id: (json['beginning_balance'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
      debitBalance: (json['debit_balance'] as num).toInt(),
      creditBalance: (json['credit_balance'] as num).toInt(),
    );

Map<String, dynamic> _$$AccountsReceivableCustomerImplToJson(
        _$AccountsReceivableCustomerImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'payment_no': instance.paymentNo,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'value': instance.value,
      'value_payment': instance.valuePayment,
      'remaining_amount_paid': instance.remainingAmountPaid,
      'remaining_amount': instance.remainingAmount,
      'beginning_balance': instance.id,
      'ending_balance': instance.endingBalance,
      'debit_balance': instance.debitBalance,
      'credit_balance': instance.creditBalance,
    };
