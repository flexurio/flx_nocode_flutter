// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_settlement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSettlementImpl _$$PaymentSettlementImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSettlementImpl(
      paymentNo: json['payment_no'] as String,
      transactionNo: json['transaction_no'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      customerName: json['customer_name'] as String,
      customerId: json['customer_id'] as String,
      valueTransactionType: (json['value_transaction_type'] as num).toInt(),
    );

Map<String, dynamic> _$$PaymentSettlementImplToJson(
        _$PaymentSettlementImpl instance) =>
    <String, dynamic>{
      'payment_no': instance.paymentNo,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'customer_name': instance.customerName,
      'customer_id': instance.customerId,
      'value_transaction_type': instance.valueTransactionType,
    };
