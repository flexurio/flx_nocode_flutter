import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_journal_accounting.freezed.dart';
part 'transaction_journal_accounting.g.dart';

@freezed
class TransactionJournalAccounting with _$TransactionJournalAccounting {
  factory TransactionJournalAccounting({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'department', fromJson: Department.fromJson)
    required Department department,
    @JsonKey(name: 'chart_of_account_id') required String chartOfAccountId,
    @JsonKey(name: 'chart_of_account_name') required String chartOfAccountName,
    required double debit,
    required double credit,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    required String reference,
    required String unique,
    required String value,
    required String username,
    required String description,
    @JsonKey(name: 'save_date', fromJson: isoDateToDateTime)
    required DateTime saveDate,
    required double count,
    @JsonKey(name: 'journal_name') required String journalName,
    required String trans,
    required bool tb,
    @JsonKey(name: 'budget_type') required int budgetType,
    @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
    required DateTime releaseDate,
  }) = _TransactionJournalAccounting;
  const TransactionJournalAccounting._();

  factory TransactionJournalAccounting.fromJson(Map<String, dynamic> json) =>
      _$TransactionJournalAccountingFromJson(json);

  static TransactionJournalAccounting empty() => TransactionJournalAccounting(
      id: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      department: Department.empty(),
      chartOfAccountId: '',
      chartOfAccountName: '',
      debit: 0,
      credit: 0,
      transactionNo: '',
      transactionDate: DateTime.now(),
      reference: '',
      unique: '',
      value: '',
      username: '',
      description: '',
      saveDate: DateTime.now(),
      count: 0,
      journalName: '',
      trans: '',
      tb: false,
      budgetType: 0,
      releaseDate: DateTime.now());
}

enum TransactionJournalAccountingStatus implements ColorType {
  notBalanced('error.balance_not_equal', Color.fromARGB(255, 186, 59, 70)),
  balanced('error.balance_equal', Colors.green),
  empty('', Colors.transparent);

  const TransactionJournalAccountingStatus(this.status, this.color);

  @override
  String get label => status;

  @override
  final Color color;
  final String status;
}
