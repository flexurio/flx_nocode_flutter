// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_mutation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivableMutationImpl _$$AccountsReceivableMutationImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsReceivableMutationImpl(
      customer: json['customer'] as String,
      beginningBalance: (json['beginning_balance'] as num).toInt(),
      debit: (json['debit'] as num).toInt(),
      credit: (json['credit'] as num).toInt(),
      endingBalance: (json['ending_balance'] as num).toInt(),
    );

Map<String, dynamic> _$$AccountsReceivableMutationImplToJson(
        _$AccountsReceivableMutationImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'beginning_balance': instance.beginningBalance,
      'debit': instance.debit,
      'credit': instance.credit,
      'ending_balance': instance.endingBalance,
    };
