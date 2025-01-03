import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement_new.freezed.dart';
part 'payment_settlement_new.g.dart';

@freezed
class PaymentSettlementNew with _$PaymentSettlementNew {
  const factory PaymentSettlementNew({
    @JsonKey(name: 'remark') required String remark,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'transaction_date') required String transactionDate,
    @JsonKey(name: 'value') required int value,
    @JsonKey(name: 'value_transaction') required int valueTransaction,
    @JsonKey(name: 'ku_cost') required int kuCost,
    @JsonKey(name: 'stamp_cost') required int stampCost,
    @JsonKey(name: 'rounding') required int rounding,
    @JsonKey(name: 'art_cost') required int artCost,
    @JsonKey(name: 'other_cost') required int otherCost,
    @JsonKey(name: 'rate_gap') required int rateGap,
    @JsonKey(name: 'total') required int total,
  }) = _PaymentSettlementNew;
  const PaymentSettlementNew._();

  factory PaymentSettlementNew.fromJson(Map<String, dynamic> json) =>
      _$PaymentSettlementNewFromJson(json);

  factory PaymentSettlementNew.empty() => const PaymentSettlementNew(
        remark: '',
        customerName: '',
        description: '',
        transactionDate: '',
        value: 0,
        valueTransaction: 0,
        kuCost: 0,
        stampCost: 0,
        rounding: 0,
        artCost: 0,
        otherCost: 0,
        rateGap: 0,
        total: 0,
      );
}
