import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_detail_receivable.freezed.dart';
part 'payment_detail_receivable.g.dart';

@freezed
class PaymentDetailReceivable with _$PaymentDetailReceivable {
  factory PaymentDetailReceivable({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    required int id,
    @JsonKey(name: 'payment_id') required String paymentId,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'invoice_no') required String? invoiceNo,
    @JsonKey(name: 'chart_of_account_id') required String? chartOfAccountId,
    @JsonKey(name: 'chart_of_account_name') required String? chartOfAccountName,
    required bool tb,
    required String description,
    @JsonKey(name: 'delivery_address_id') required String deliveryAddressId,
    @JsonKey(name: 'delivery_address_name') required String deliveryAddressName,
    @JsonKey(name: 'delivery_address') required String deliveryAddress,
    @JsonKey(name: 'delivery_address_city') required String deliveryAddressCity,
    @JsonKey(name: 'value') required double amount,
    @JsonKey(name: 'payment_total') required double paymentTotal,
    @JsonKey(name: 'payment_remark') required String paymentRemark,
    @JsonKey(name: 'payment_chart_of_account_repayment') required String paymentChartOfAccountRepayment,
  }) = _PaymentDetailReceivable;

  factory PaymentDetailReceivable.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailReceivableFromJson(json);

  factory PaymentDetailReceivable.empty() => PaymentDetailReceivable(
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        id: 0,
        transactionId: '',
        amount: 0,
        description: '',
        invoiceNo: '',
        chartOfAccountId: '',
        chartOfAccountName: '',
        tb: false,
        deliveryAddressId: '',
        deliveryAddressName: '',
        deliveryAddress: '',
        deliveryAddressCity: '',
        paymentId: '',
        paymentTotal: 0,
        paymentRemark: '',
        paymentChartOfAccountRepayment: '',
      );

  const PaymentDetailReceivable._();
}
