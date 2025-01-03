import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_payment.freezed.dart';
part 'transaction_payment.g.dart';

@freezed
class TransactionPayment with _$TransactionPayment {
  factory TransactionPayment({
    required String period,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'invoice_no') String? invoiceNo,
    @JsonKey(name: 'supplier') required String supplierName,
    @JsonKey(name: 'supplier_id') required String supplierId,
    required double total,
    @JsonKey(name: 'payment_id') String? paymentId,
    @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
    DateTime? paymentDate,
    @JsonKey(name: 'payment_total') required double paymentTotal,
    @JsonKey(name: 'is_type_transaction') required int isTypeTransaction,
    @JsonKey(name: 'payment_remaining') required double paymentRemaining,
  }) = _TransactionPayment;
  const TransactionPayment._();

  factory TransactionPayment.empty() => TransactionPayment(
        period: '',
        transactionDate: DateTime(0),
        orderId: '',
        transactionNo: '',
        supplierName: '',
        supplierId: '',
        total: 0,
        paymentTotal: 0,
        isTypeTransaction: 0,
        paymentRemaining: 0,
      );

  factory TransactionPayment.fromJson(Map<String, dynamic> json) =>
      _$TransactionPaymentFromJson(json);

  bool get isPayable => isTypeTransaction == 1;
  bool get isReceivable => isTypeTransaction == 0;
}

enum TransactionJournalType {
  payable(1, 'payable'),
  receivable(0, 'receivable');

  final int value;
  final String label;

  const TransactionJournalType(this.value, this.label);

  static List<TransactionJournalType> get list => [
        TransactionJournalType.payable,
        TransactionJournalType.receivable,
      ];

  static TransactionJournalType fromValue(int value) {
    return list.firstWhere((element) => element.value == value);
  }

  bool get isReceivable => value == 0;
  bool get isPayable => value == 1;
}

enum TransactionJournalPaidType {
  paidOff('paid_off'),
  notYetPaidOff('not_yet_paid_off');

  final String value;

  const TransactionJournalPaidType(this.value);

  static List<TransactionJournalPaidType> get list => [
        TransactionJournalPaidType.paidOff,
        TransactionJournalPaidType.notYetPaidOff,
      ];
}
