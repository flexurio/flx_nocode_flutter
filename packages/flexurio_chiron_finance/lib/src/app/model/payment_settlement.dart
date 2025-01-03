import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement.freezed.dart';
part 'payment_settlement.g.dart';

@freezed
class PaymentSettlement with _$PaymentSettlement {
  const factory PaymentSettlement({
    @JsonKey(name: 'payment_no') required String paymentNo,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'value_transaction_type') required int valueTransactionType,
  }) = _PaymentSettlement;
  const PaymentSettlement._();

  factory PaymentSettlement.fromJson(Map<String, dynamic> json) =>
      _$PaymentSettlementFromJson(json);

  factory PaymentSettlement.empty() => PaymentSettlement(
        paymentNo: '',
        transactionNo: '',
        transactionDate: DateTime(0),
        customerName: '',
        customerId: '',
        valueTransactionType: 0,
      );
}
