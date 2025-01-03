import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_global.freezed.dart';
part 'accounts_receivable_payment_global.g.dart';

@freezed
class AccountsReceivablePaymentGlobal with _$AccountsReceivablePaymentGlobal {
  const factory AccountsReceivablePaymentGlobal({
    @JsonKey(name: 'partner_id') required String partnerId,
    required String customer,
    @JsonKey(name: 'paid_receivable_no') String? paidReceivableNo,
    String? remark,
    String? date,
    @JsonKey(name: 'account_value') int? accountValue,
    int? total,
  }) = _AccountsReceivablePaymentGlobal;
  const AccountsReceivablePaymentGlobal._();

  factory AccountsReceivablePaymentGlobal.empty() => const AccountsReceivablePaymentGlobal(
    partnerId: '',
    customer: '',
  );
  factory AccountsReceivablePaymentGlobal.fromJson(Map<String, dynamic> json) => _$AccountsReceivablePaymentGlobalFromJson(json);
}
