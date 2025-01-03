// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_settlement_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentSettlementNewImpl _$$PaymentSettlementNewImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentSettlementNewImpl(
      remark: json['remark'] as String,
      customerName: json['customer_name'] as String,
      description: json['description'] as String?,
      transactionDate: json['transaction_date'] as String,
      value: (json['value'] as num).toInt(),
      valueTransaction: (json['value_transaction'] as num).toInt(),
      kuCost: (json['ku_cost'] as num).toInt(),
      stampCost: (json['stamp_cost'] as num).toInt(),
      rounding: (json['rounding'] as num).toInt(),
      artCost: (json['art_cost'] as num).toInt(),
      otherCost: (json['other_cost'] as num).toInt(),
      rateGap: (json['rate_gap'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaymentSettlementNewImplToJson(
        _$PaymentSettlementNewImpl instance) =>
    <String, dynamic>{
      'remark': instance.remark,
      'customer_name': instance.customerName,
      'description': instance.description,
      'transaction_date': instance.transactionDate,
      'value': instance.value,
      'value_transaction': instance.valueTransaction,
      'ku_cost': instance.kuCost,
      'stamp_cost': instance.stampCost,
      'rounding': instance.rounding,
      'art_cost': instance.artCost,
      'other_cost': instance.otherCost,
      'rate_gap': instance.rateGap,
      'total': instance.total,
    };
