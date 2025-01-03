// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_mutation_report_invoice_due_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebtMutationReportInvoiceDueDateImpl
    _$$DebtMutationReportInvoiceDueDateImplFromJson(
            Map<String, dynamic> json) =>
        _$DebtMutationReportInvoiceDueDateImpl(
          supplierName: json['supplier_name'] as String,
          supplierId: json['supplier_id'] as String,
          beginningBalance: (json['beginning_balance'] as num).toDouble(),
          debit: (json['debit'] as num).toDouble(),
          credit: (json['credit'] as num).toInt(),
          endingBalance: (json['ending_balance'] as num).toDouble(),
        );

Map<String, dynamic> _$$DebtMutationReportInvoiceDueDateImplToJson(
        _$DebtMutationReportInvoiceDueDateImpl instance) =>
    <String, dynamic>{
      'supplier_name': instance.supplierName,
      'supplier_id': instance.supplierId,
      'beginning_balance': instance.beginningBalance,
      'debit': instance.debit,
      'credit': instance.credit,
      'ending_balance': instance.endingBalance,
    };
