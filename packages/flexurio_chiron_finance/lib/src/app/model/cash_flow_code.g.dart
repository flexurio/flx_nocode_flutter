// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_flow_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashFlowCodeImpl _$$CashFlowCodeImplFromJson(Map<String, dynamic> json) =>
    _$CashFlowCodeImpl(
      date: json['date'] as String,
      noTransaction: json['no_transaction'] as String,
      invoice: json['invoice'] as String,
      recForm: json['rec_from'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
      code: json['code'] as String,
      subCode: json['sub_code'] as String,
      mutationDate: isoDateToDateTime(json['mutation_date'] as String?),
      transferFee: (json['transfer_fee'] as num).toInt(),
      totalTransfer: (json['total_transfer'] as num).toInt(),
      bank: json['bank'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$CashFlowCodeImplToJson(_$CashFlowCodeImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'no_transaction': instance.noTransaction,
      'invoice': instance.invoice,
      'rec_from': instance.recForm,
      'description': instance.description,
      'amount': instance.amount,
      'code': instance.code,
      'sub_code': instance.subCode,
      'mutation_date': instance.mutationDate.toIso8601String(),
      'transfer_fee': instance.transferFee,
      'total_transfer': instance.totalTransfer,
      'bank': instance.bank,
      'status': instance.status,
    };
