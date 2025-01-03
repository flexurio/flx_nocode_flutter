import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global.freezed.dart';
part 'invoice_recap_by_sales_global.g.dart';

@freezed
class InvoiceRecapBySalesGlobal with _$InvoiceRecapBySalesGlobal {
  const factory InvoiceRecapBySalesGlobal({
    @JsonKey(name: 'transaction_name') required String transactionName,
    @JsonKey(
      name: 'customer_delivery_address',
      defaultValue: '',
      includeIfNull: true,
    )
    required String customerDeliveryAddress,
    @JsonKey(name: 'subtotal') required double subtotal,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'additional_discount_value')
    required double additionalDiscountValue,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(name: 'total') required double total,
    @JsonKey(name: 'subtotal_transaction_type')
    required double subtotalTransactionType,
    @JsonKey(name: 'discount_value_transaction_type')
    required double discountValueTransactionType,
    @JsonKey(name: 'additional_discount_value_transaction_type')
    required double additionalDiscountValueTransactionType,
    @JsonKey(name: 'ppn_value_transaction_type')
    required double ppnValueTransactionType,
    @JsonKey(name: 'total_transaction_type')
    required double totalTransactionType,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
    @JsonKey(name: 'discount_value_summary')
    required double discountValueSummary,
    @JsonKey(name: 'additional_discount_value_summary')
    required double additionalDiscountValueSummary,
    @JsonKey(name: 'ppn_value_summary') required double ppnValueSummary,
    @JsonKey(name: 'total_summary') required double totalSummary,
  }) = _InvoiceRecapBySalesGlobal;
  const InvoiceRecapBySalesGlobal._();

  factory InvoiceRecapBySalesGlobal.fromJson(Map<String, dynamic> json) =>
      _$InvoiceRecapBySalesGlobalFromJson(json);

  factory InvoiceRecapBySalesGlobal.empty() => const InvoiceRecapBySalesGlobal(
        transactionName: '',
        customerDeliveryAddress: '',
        subtotal: 0,
        discountValue: 0,
        additionalDiscountValue: 0,
        ppnValue: 0,
        total: 0,
        subtotalTransactionType: 0,
        discountValueTransactionType: 0,
        additionalDiscountValueTransactionType: 0,
        ppnValueTransactionType: 0,
        totalTransactionType: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        additionalDiscountValueSummary: 0,
        ppnValueSummary: 0,
        totalSummary: 0,
      );
}
