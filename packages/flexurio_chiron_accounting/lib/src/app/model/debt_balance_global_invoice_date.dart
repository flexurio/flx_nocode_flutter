import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_balance_global_invoice_date.freezed.dart';
part 'debt_balance_global_invoice_date.g.dart';

@freezed
class DebtBalanceGlobalInvoiceDate with _$DebtBalanceGlobalInvoiceDate {
  const factory DebtBalanceGlobalInvoiceDate({
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'account_value') required int accountValue,
    @JsonKey(name: 'account_value_summary') required double accountValueSummary,
  }) = _DebtBalanceGlobalInvoiceDate;
  const DebtBalanceGlobalInvoiceDate._();

  factory DebtBalanceGlobalInvoiceDate.empty() => const DebtBalanceGlobalInvoiceDate(
    supplierName: '', 
    accountValue: 0, 
    accountValueSummary: 0,
  );
  factory DebtBalanceGlobalInvoiceDate.fromJson(Map<String, dynamic> json) => _$DebtBalanceGlobalInvoiceDateFromJson(json);
}
