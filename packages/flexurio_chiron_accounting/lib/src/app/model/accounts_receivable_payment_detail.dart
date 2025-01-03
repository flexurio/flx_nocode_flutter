import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_payment_detail.freezed.dart';
part 'accounts_receivable_payment_detail.g.dart';

@freezed
class AccountsReceivablePaymentDetail with _$AccountsReceivablePaymentDetail {
  const factory AccountsReceivablePaymentDetail({
    @JsonKey(name: 'partner_id') required String partnerId,
    required String customer,
    @JsonKey(name: 'paid_receivable_no') required String paidReceivableNo,
    required String remark,
    required String date,
    @JsonKey(name: 'account_value') required int accountValue,
    int? total,
  }) = _AccountsReceivablePaymentDetail;
  const AccountsReceivablePaymentDetail._();

  factory AccountsReceivablePaymentDetail.empty() => const AccountsReceivablePaymentDetail(
      partnerId: '',
      customer: '',
      paidReceivableNo: '',
      remark: '',
      date: '',
      accountValue: 0,
  );
  factory AccountsReceivablePaymentDetail.fromJson(Map<String, dynamic> json) => _$AccountsReceivablePaymentDetailFromJson(json);
}
