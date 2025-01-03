import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_detail.freezed.dart';
part 'payment_detail.g.dart';

@freezed
class PaymentDetail with _$PaymentDetail {
  factory PaymentDetail({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    required int id,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'value') required double amount,
    @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
    required ChartOfAccountNumber chartOfAccount,
    required String description,
    @JsonKey(name: 'invoice_no') required String? invoiceNo,
  }) = _PaymentDetail;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailFromJson(json);

  factory PaymentDetail.empty() => PaymentDetail(
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        id: 0,
        transactionId: '',
        amount: 0,
        description: '',
        invoiceNo: '',
        chartOfAccount: ChartOfAccountNumber.empty(),
      );

  const PaymentDetail._();

  Transaction get transaction => Transaction.empty().copyWith(
        id: transactionId,
        total: amount,
      );
}
