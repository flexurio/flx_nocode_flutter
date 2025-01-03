// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock_card_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockCardRupiahImpl _$$MaterialStockCardRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockCardRupiahImpl(
      transactionId: json['transaction_id'] as String,
      na: json['na'] as String?,
      materialDate: isoDateToDateTime(json['material_date'] as String?),
      materialId: json['material_id'] as String,
      quantityCredit: (json['quantity_credit'] as num).toInt(),
      priceCredit: (json['price_credit'] as num).toInt(),
      valueCredit: (json['value_credit'] as num).toInt(),
      quantityDebit: (json['quantity_debit'] as num).toInt(),
      priceDebit: (json['price_debit'] as num).toInt(),
      valueDebit: (json['value_debit'] as num).toInt(),
      quantityCreditSummary: (json['quantity_credit_summary'] as num).toInt(),
      priceCreditSummary: (json['price_credit_summary'] as num).toInt(),
      valueCreditSummary: (json['value_credit_summary'] as num).toInt(),
      quantityDebitSummary: (json['quantity_debit_summary'] as num).toInt(),
      priceDebitSummary: (json['price_debit_summary'] as num).toInt(),
      valueDebitSummary: (json['value_debit_summary'] as num).toInt(),
      materialName: json['material_name'] as String?,
      quantityBalance: (json['quantity_balance'] as num?)?.toInt(),
      priceBalance: (json['price_balance'] as num?)?.toInt(),
      valueBalance: (json['value_balance'] as num?)?.toInt(),
      quantityBalanceSummary:
          (json['quantity_balance_summary'] as num?)?.toInt(),
      priceBalanceSummary: (json['price_balance_summary'] as num?)?.toInt(),
      valueBalanceSummary: (json['value_balance_summary'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaterialStockCardRupiahImplToJson(
        _$MaterialStockCardRupiahImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'na': instance.na,
      'material_date': instance.materialDate.toIso8601String(),
      'material_id': instance.materialId,
      'quantity_credit': instance.quantityCredit,
      'price_credit': instance.priceCredit,
      'value_credit': instance.valueCredit,
      'quantity_debit': instance.quantityDebit,
      'price_debit': instance.priceDebit,
      'value_debit': instance.valueDebit,
      'quantity_credit_summary': instance.quantityCreditSummary,
      'price_credit_summary': instance.priceCreditSummary,
      'value_credit_summary': instance.valueCreditSummary,
      'quantity_debit_summary': instance.quantityDebitSummary,
      'price_debit_summary': instance.priceDebitSummary,
      'value_debit_summary': instance.valueDebitSummary,
      'material_name': instance.materialName,
      'quantity_balance': instance.quantityBalance,
      'price_balance': instance.priceBalance,
      'value_balance': instance.valueBalance,
      'quantity_balance_summary': instance.quantityBalanceSummary,
      'price_balance_summary': instance.priceBalanceSummary,
      'value_balance_summary': instance.valueBalanceSummary,
    };
