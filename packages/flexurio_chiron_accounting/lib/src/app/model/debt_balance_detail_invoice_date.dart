import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_balance_detail_invoice_date.freezed.dart';
part 'debt_balance_detail_invoice_date.g.dart';

@freezed
class DebtBalanceDetailInvoiceDate with _$DebtBalanceDetailInvoiceDate {
  const factory DebtBalanceDetailInvoiceDate({
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'currency_id') required String currencyId,
    required int rate,
    @JsonKey(name: 'account_value') required int accountValue,
    @JsonKey(name: 'account_value_summary') required double accountValueSummary,
  }) = _DebtBalanceDetailInvoiceDate;
  const DebtBalanceDetailInvoiceDate._();

  factory DebtBalanceDetailInvoiceDate.empty() =>
    DebtBalanceDetailInvoiceDate(
      supplierName: '',
      transactionId: '',
      transactionDate: DateTime(0),
      dueDate: DateTime(0),
      currencyId: '',
      rate: 0,
      accountValue: 0,
      accountValueSummary: 0,
    );
  factory DebtBalanceDetailInvoiceDate.fromJson(Map<String, dynamic> json) => _$DebtBalanceDetailInvoiceDateFromJson(json);
}
