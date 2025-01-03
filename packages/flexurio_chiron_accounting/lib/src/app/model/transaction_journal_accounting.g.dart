// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_journal_accounting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionJournalAccountingImpl _$$TransactionJournalAccountingImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionJournalAccountingImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      chartOfAccountId: json['chart_of_account_id'] as String,
      chartOfAccountName: json['chart_of_account_name'] as String,
      debit: (json['debit'] as num).toDouble(),
      credit: (json['credit'] as num).toDouble(),
      transactionNo: json['transaction_no'] as String,
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      reference: json['reference'] as String,
      unique: json['unique'] as String,
      value: json['value'] as String,
      username: json['username'] as String,
      description: json['description'] as String,
      saveDate: isoDateToDateTime(json['save_date'] as String?),
      count: (json['count'] as num).toDouble(),
      journalName: json['journal_name'] as String,
      trans: json['trans'] as String,
      tb: json['tb'] as bool,
      budgetType: (json['budget_type'] as num).toInt(),
      releaseDate: isoDateToDateTime(json['release_date'] as String?),
    );

Map<String, dynamic> _$$TransactionJournalAccountingImplToJson(
        _$TransactionJournalAccountingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'department': instance.department,
      'chart_of_account_id': instance.chartOfAccountId,
      'chart_of_account_name': instance.chartOfAccountName,
      'debit': instance.debit,
      'credit': instance.credit,
      'transaction_no': instance.transactionNo,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'reference': instance.reference,
      'unique': instance.unique,
      'value': instance.value,
      'username': instance.username,
      'description': instance.description,
      'save_date': instance.saveDate.toIso8601String(),
      'count': instance.count,
      'journal_name': instance.journalName,
      'trans': instance.trans,
      'tb': instance.tb,
      'budget_type': instance.budgetType,
      'release_date': instance.releaseDate.toIso8601String(),
    };
