import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_discount.freezed.dart';
part 'invoice_discount.g.dart';

@freezed
class InvoiceDiscount with _$InvoiceDiscount {
  const factory InvoiceDiscount({
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'transaction_date') String? transactionDate,
    @JsonKey(name: 'tax_invoice_number') String? taxInvoiceNumber,
    @JsonKey(name: 'subtotal') double? subtotal,
    @JsonKey(name: 'discount_value') double? discountValue,
    @JsonKey(name: 'ppn_value') double? ppnValue,
    @JsonKey(name: 'total') double? total,
    @JsonKey(name: 'additional_discount_value') double? additionalDiscountValue,
    @JsonKey(name: 'subtotal_summary') double? subtotalSummary,
    @JsonKey(name: 'discount_value_summary') double? discountValueSummary,
    @JsonKey(name: 'ppn_value_summary') double? ppnValueSummary,
    @JsonKey(name: 'total_summary') double? totalSummary,
    @JsonKey(name: 'additional_discount_value_summary')
    double? additionalDiscountValueSummary,
  }) = _InvoiceDiscount;
  const InvoiceDiscount._();

  factory InvoiceDiscount.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDiscountFromJson(json);

  factory InvoiceDiscount.empty() => const InvoiceDiscount(
        transactionId: '',
        transactionDate: '',
        taxInvoiceNumber: '',
        subtotal: 0,
        discountValue: 0,
        ppnValue: 0,
        total: 0,
        additionalDiscountValue: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        ppnValueSummary: 0,
        totalSummary: 0,
        additionalDiscountValueSummary: 0,
      );
}
