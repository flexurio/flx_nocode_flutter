// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivableDetailImpl _$$AccountsReceivableDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsReceivableDetailImpl(
      transactionNo: json['transaction_no'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      customer: json['customer'] as String,
      cityCustomer: json['city_customer'] as String,
      addressCustomer: json['address_customer'] as String,
      amount: (json['amount'] as num).toInt(),
      totalCustomer: (json['total_customer'] as num).toInt(),
      customerId: json['customer_id'] as String,
      transactionType: json['transaction_type'] as String?,
    );

Map<String, dynamic> _$$AccountsReceivableDetailImplToJson(
        _$AccountsReceivableDetailImpl instance) =>
    <String, dynamic>{
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'customer': instance.customer,
      'city_customer': instance.cityCustomer,
      'address_customer': instance.addressCustomer,
      'amount': instance.amount,
      'total_customer': instance.totalCustomer,
      'customer_id': instance.customerId,
      'transaction_type': instance.transactionType,
    };
