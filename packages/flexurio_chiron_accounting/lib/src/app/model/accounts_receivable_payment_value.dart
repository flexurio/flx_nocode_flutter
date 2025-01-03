import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_value.freezed.dart';
part 'accounts_receivable_payment_value.g.dart';

@freezed
class AccountsReceivablePaymentValue with _$AccountsReceivablePaymentValue {
  const factory AccountsReceivablePaymentValue({
    @JsonKey(name: 'partner_id') required String partnerId,
    required String customer,
    @JsonKey(name: 'paid_receivable_no') required String paidReceivableNo,
    required String remark,
    required String date,
    @JsonKey(name: 'account_value') required int accountValue,
    int? total,
  }) = _AccountsReceivablePaymentValue;
  const AccountsReceivablePaymentValue._();

  factory AccountsReceivablePaymentValue.empty() => const AccountsReceivablePaymentValue(
    partnerId: '',
    customer: '',
    paidReceivableNo: '',
    remark: '',
    date: '',
    accountValue: 0,
  );
  factory AccountsReceivablePaymentValue.fromJson(Map<String, dynamic> json) => _$AccountsReceivablePaymentValueFromJson(json);
}
