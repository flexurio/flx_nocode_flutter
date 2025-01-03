import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_customer.freezed.dart';
part 'accounts_receivable_customer.g.dart';

@freezed
class AccountsReceivableCustomer with _$AccountsReceivableCustomer {
  factory AccountsReceivableCustomer({
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'payment_no') required String paymentNo,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'value') required int value,
    @JsonKey(name: 'value_payment') required int valuePayment,
    @JsonKey(name: 'remaining_amount_paid') required int remainingAmountPaid,
    @JsonKey(name: 'remaining_amount') required int remainingAmount,
    @JsonKey(name: 'beginning_balance') required int id,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'debit_balance') required int debitBalance,
    @JsonKey(name: 'credit_balance') required int creditBalance,
  }) = _AccountsReceivableCustomer;

  const AccountsReceivableCustomer._();

  factory AccountsReceivableCustomer.empty() {
    return AccountsReceivableCustomer(
      description: '',
      paymentNo: '',
      transactionNo: '',
      transactionDate: DateTime(0),
      value: 0,
      valuePayment: 0,
      remainingAmountPaid: 0,
      remainingAmount: 0,
      id: 0,
      endingBalance: 0,
      debitBalance: 0,
      creditBalance: 0,
    );
  }

  factory AccountsReceivableCustomer.fromJson(Map<String, dynamic> json) =>
      _$AccountsReceivableCustomerFromJson(json);
}
