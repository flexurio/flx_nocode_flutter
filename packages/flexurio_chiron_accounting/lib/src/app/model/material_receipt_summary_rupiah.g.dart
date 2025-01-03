// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receipt_summary_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiptSummaryRupiahImpl _$$MaterialReceiptSummaryRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReceiptSummaryRupiahImpl(
      transactionTypeId: json['transaction_type_id'] as String,
      transactionTypeName: json['transaction_type_name'] as String,
      value: (json['value'] as num).toInt(),
      valueSummary: (json['value_summary'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialReceiptSummaryRupiahImplToJson(
        _$MaterialReceiptSummaryRupiahImpl instance) =>
    <String, dynamic>{
      'transaction_type_id': instance.transactionTypeId,
      'transaction_type_name': instance.transactionTypeName,
      'value': instance.value,
      'value_summary': instance.valueSummary,
    };
