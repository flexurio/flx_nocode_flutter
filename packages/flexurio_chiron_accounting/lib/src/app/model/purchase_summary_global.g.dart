// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_summary_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseSummaryGlobalImpl _$$PurchaseSummaryGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseSummaryGlobalImpl(
      supplier: json['supplier'] as String,
      transactionId: json['transaction_id'] as String,
      currencyId: json['currency_id'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      subtotal: (json['subtotal'] as num).toInt(),
      rate: (json['rate'] as num).toInt(),
      subAfterPpn: (json['sub_after_ppn'] as num).toInt(),
      ppnValue: (json['ppn_value'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PurchaseSummaryGlobalImplToJson(
        _$PurchaseSummaryGlobalImpl instance) =>
    <String, dynamic>{
      'supplier': instance.supplier,
      'transaction_id': instance.transactionId,
      'currency_id': instance.currencyId,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'subtotal': instance.subtotal,
      'rate': instance.rate,
      'sub_after_ppn': instance.subAfterPpn,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
    };
