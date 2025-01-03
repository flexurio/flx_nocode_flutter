// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_mutation_loans_borrowings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialMutationLoansBorrowingsImpl
    _$$MaterialMutationLoansBorrowingsImplFromJson(Map<String, dynamic> json) =>
        _$MaterialMutationLoansBorrowingsImpl(
          materialName: json['material_name'] as String,
          materialId: json['material_id'] as String,
          quantityCredit: (json['quantity_credit'] as num).toInt(),
          valueCredit: (json['value_credit'] as num).toInt(),
          quantityDebit: (json['quantity_debit'] as num).toInt(),
          valueDebit: (json['value_debit'] as num).toInt(),
          quantityCreditSummary:
              (json['quantity_credit_summary'] as num).toInt(),
          valueCreditSummary: (json['value_credit_summary'] as num).toInt(),
          quantityDebitSummary: (json['quantity_debit_summary'] as num).toInt(),
          valueDebitSummary: (json['value_debit_summary'] as num).toInt(),
        );

Map<String, dynamic> _$$MaterialMutationLoansBorrowingsImplToJson(
        _$MaterialMutationLoansBorrowingsImpl instance) =>
    <String, dynamic>{
      'material_name': instance.materialName,
      'material_id': instance.materialId,
      'quantity_credit': instance.quantityCredit,
      'value_credit': instance.valueCredit,
      'quantity_debit': instance.quantityDebit,
      'value_debit': instance.valueDebit,
      'quantity_credit_summary': instance.quantityCreditSummary,
      'value_credit_summary': instance.valueCreditSummary,
      'quantity_debit_summary': instance.quantityDebitSummary,
      'value_debit_summary': instance.valueDebitSummary,
    };
