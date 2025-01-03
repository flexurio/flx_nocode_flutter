import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_mutation_report_invoice_due_date.freezed.dart';
part 'debt_mutation_report_invoice_due_date.g.dart';

@freezed
class DebtMutationReportInvoiceDueDate with _$DebtMutationReportInvoiceDueDate {
  const factory DebtMutationReportInvoiceDueDate({
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'supplier_id') required String supplierId,
    @JsonKey(name: 'beginning_balance') required double beginningBalance,
    required double debit,
    required int credit,
    @JsonKey(name: 'ending_balance') required double endingBalance,
  }) = _DebtMutationReportInvoiceDueDate;
  const DebtMutationReportInvoiceDueDate._();

  factory DebtMutationReportInvoiceDueDate.empty() =>
    const DebtMutationReportInvoiceDueDate(
      supplierName: '',
      supplierId: '',
      beginningBalance: 0,
      debit: 0,
      credit: 0,
      endingBalance: 0,
    );
  factory DebtMutationReportInvoiceDueDate.fromJson(Map<String, dynamic> json) => _$DebtMutationReportInvoiceDueDateFromJson(json);
}
