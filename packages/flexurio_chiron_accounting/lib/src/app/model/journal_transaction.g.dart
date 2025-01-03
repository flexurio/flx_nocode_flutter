// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalTransactionImpl _$$JournalTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalTransactionImpl(
      date: DateTime.parse(json['date'] as String),
      transactionNo: json['transaction_no'] as String,
      chartOfAccountId: json['chart_of_account_id'] as String,
      chartOfAccountName: json['chart_of_account_name'] as String,
      debet: (json['debet'] as num).toDouble(),
      credit: (json['credit'] as num).toDouble(),
      description: json['description'] as String,
      departmentName: json['department_name'] as String,
      lpb: json['lpb'] as String,
      period: json['period'] as String,
      division: json['division'] as String?,
      name: json['name'] as String?,
      invoice: json['invoice'] as String?,
      invoiceDate: dateTimeNullable(json['invoice_date'] as String?),
      taxInvoiceNo: json['tax_invoice_no'] as String?,
      supplier: json['supplier'] as String?,
    );

Map<String, dynamic> _$$JournalTransactionImplToJson(
        _$JournalTransactionImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'transaction_no': instance.transactionNo,
      'chart_of_account_id': instance.chartOfAccountId,
      'chart_of_account_name': instance.chartOfAccountName,
      'debet': instance.debet,
      'credit': instance.credit,
      'description': instance.description,
      'department_name': instance.departmentName,
      'lpb': instance.lpb,
      'period': instance.period,
      'division': instance.division,
      'name': instance.name,
      'invoice': instance.invoice,
      'invoice_date': instance.invoiceDate?.toIso8601String(),
      'tax_invoice_no': instance.taxInvoiceNo,
      'supplier': instance.supplier,
    };
