import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_card_report_per_supplier_invoice_date.freezed.dart';
part 'debt_card_report_per_supplier_invoice_date.g.dart';

@freezed
class DebtCardReportPerSupplierInvoiceDate with _$DebtCardReportPerSupplierInvoiceDate {
  const factory DebtCardReportPerSupplierInvoiceDate({
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) 
    required DateTime transactionDate,
    required double value,
    @JsonKey(name: 'value_payment') required int valuePayment,
    @JsonKey(name: 'remaining_amount_paid') required int remainingAmountPaid,
    @JsonKey(name: 'remaining_amount') required int remainingAmount,
    @JsonKey(name: 'beginning_balance') required double beginningBalance,
    @JsonKey(name: 'ending_balance') required double endingBalance,
    @JsonKey(name: 'debit_balance') required int debitBalance,
    @JsonKey(name: 'credit_balance') required int creditBalance,ance,
    String? description,
    @JsonKey(name: 'payment_no') String? paymentNo,
    @JsonKey(name: 'transaction_no') String? transactionNo,
  }) = _DebtCardReportPerSupplierInvoiceDate;
  const DebtCardReportPerSupplierInvoiceDate._();

  factory DebtCardReportPerSupplierInvoiceDate.empty() =>
    DebtCardReportPerSupplierInvoiceDate(
      transactionDate: DateTime(0), 
      value: 0, 
      valuePayment: 0, 
      remainingAmountPaid: 0, 
      remainingAmount: 0, 
      beginningBalance: 0, 
      endingBalance: 0, 
      debitBalance: 0, 
      creditBalance: 0,
    );
  factory DebtCardReportPerSupplierInvoiceDate.fromJson(Map<String, dynamic> json) => _$DebtCardReportPerSupplierInvoiceDateFromJson(json);
}
