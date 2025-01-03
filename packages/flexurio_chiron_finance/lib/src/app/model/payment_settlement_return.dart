import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_settlement_return.freezed.dart';
part 'payment_settlement_return.g.dart';

@freezed
class PaymentSettlementReturn with _$PaymentSettlementReturn {
  const factory PaymentSettlementReturn({
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'discount_percent') required int discountPercent,
  }) = _PaymentSettlementReturn;
  const PaymentSettlementReturn._();

  factory PaymentSettlementReturn.fromJson(Map<String, dynamic> json) =>
      _$PaymentSettlementReturnFromJson(json);

  factory PaymentSettlementReturn.empty() => const PaymentSettlementReturn(
        invoiceId: '',
        batchNoId: '',
        taxInvoiceNo: '',
        customerId: '',
        productName: '',
        price: 0,
        quantity: 0,
        discountPercent: 0,
      );
}
