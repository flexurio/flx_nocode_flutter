// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_payment_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivablePaymentValueImpl
    _$$AccountsReceivablePaymentValueImplFromJson(Map<String, dynamic> json) =>
        _$AccountsReceivablePaymentValueImpl(
          partnerId: json['partner_id'] as String,
          customer: json['customer'] as String,
          paidReceivableNo: json['paid_receivable_no'] as String,
          remark: json['remark'] as String,
          date: json['date'] as String,
          accountValue: (json['account_value'] as num).toInt(),
          total: (json['total'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$AccountsReceivablePaymentValueImplToJson(
        _$AccountsReceivablePaymentValueImpl instance) =>
    <String, dynamic>{
      'partner_id': instance.partnerId,
      'customer': instance.customer,
      'paid_receivable_no': instance.paidReceivableNo,
      'remark': instance.remark,
      'date': instance.date,
      'account_value': instance.accountValue,
      'total': instance.total,
    };
