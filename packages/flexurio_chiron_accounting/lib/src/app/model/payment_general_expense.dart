import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_general_expense.freezed.dart';
part 'payment_general_expense.g.dart';

@freezed
class PaymentGeneralExpense with _$PaymentGeneralExpense {
  factory PaymentGeneralExpense({
    required String period,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'payment_no', defaultValue: '') required String paymentNo,
    required String supplier,
    @JsonKey(name: 'supplier_id') required String supplierId,
    required double total,
    @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
    DateTime? paymentDate,
    @JsonKey(name: 'payment_total') required double paymentTotal,
    @JsonKey(name: 'payment_remaining') required double paymentRemaining,
  }) = _PaymentGeneralExpense;
  const PaymentGeneralExpense._();

  factory PaymentGeneralExpense.empty() => PaymentGeneralExpense(
        period: '',
        transactionDate: DateTime(0),
        transactionNo: '',
        supplier: '',
        supplierId: '',
        total: 0,
        paymentTotal: 0,
        paymentNo: '',
        paymentRemaining: 0,
      );

  factory PaymentGeneralExpense.fromJson(Map<String, dynamic> json) =>
      _$PaymentGeneralExpenseFromJson(json);

  TransactionPayment toTransactionPayment() => TransactionPayment(
        transactionDate: transactionDate,
        orderId: '',
        transactionNo: transactionNo,
        invoiceNo: paymentNo,
        supplierName: supplier,
        total: total,
        paymentDate: paymentDate,
        paymentTotal: paymentTotal,
        paymentRemaining: paymentRemaining,
        period: '',
        supplierId: supplierId,
        isTypeTransaction: 1,
      );
}
