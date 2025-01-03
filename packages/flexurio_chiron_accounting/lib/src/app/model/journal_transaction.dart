import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_transaction.freezed.dart';
part 'journal_transaction.g.dart';

@freezed
class JournalTransaction with _$JournalTransaction {
  const factory JournalTransaction({
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'chart_of_account_id') required String chartOfAccountId,
    @JsonKey(name: 'chart_of_account_name') required String chartOfAccountName,
    @JsonKey(name: 'debet') required double debet,
    @JsonKey(name: 'credit') required double credit,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'department_name') required String departmentName,
    @JsonKey(name: 'lpb') required String lpb,
    @JsonKey(name: 'period') required String period,
    @JsonKey(name: 'division') String? division,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'invoice') String? invoice,
    @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
    DateTime? invoiceDate,
    @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
    @JsonKey(name: 'supplier') String? supplier,
  }) = _JournalTransaction;
  const JournalTransaction._();

  factory JournalTransaction.fromJson(Map<String, dynamic> json) =>
      _$JournalTransactionFromJson(json);

  factory JournalTransaction.empty() => JournalTransaction(
        date: DateTime(0),
        transactionNo: '',
        chartOfAccountId: '',
        chartOfAccountName: '',
        debet: 0,
        credit: 0,
        description: '',
        departmentName: '',
        lpb: '',
        period: '',
      );
}
