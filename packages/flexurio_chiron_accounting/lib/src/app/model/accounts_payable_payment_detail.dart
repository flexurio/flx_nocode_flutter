import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment_detail.freezed.dart';
part 'accounts_payable_payment_detail.g.dart';

@freezed
class AccountsPayablePaymentDetail with _$AccountsPayablePaymentDetail {
  const factory AccountsPayablePaymentDetail({
    @JsonKey(name: 'transaction_date') required String transactionDate, 
    required String remark, 
    required double total, 
    @JsonKey(name: 'total_summary') required double totalSummary, String? supplier,
    @JsonKey(name: 'transaction_no') String? transactionNo,
  }) = _AccountsPayablePaymentDetail;
  const AccountsPayablePaymentDetail._();

  factory AccountsPayablePaymentDetail.empty() => const AccountsPayablePaymentDetail(
    transactionDate: '', 
    remark: '', 
    total: 0, 
    totalSummary: 0,
  );
  
  factory AccountsPayablePaymentDetail.fromJson(Map<String, dynamic> json) => _$AccountsPayablePaymentDetailFromJson(json);
}
