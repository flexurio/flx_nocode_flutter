import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global_special.freezed.dart';
part 'invoice_recap_by_sales_global_special.g.dart';

@freezed
class InvoiceRecapBySalesGlobalSpecial with _$InvoiceRecapBySalesGlobalSpecial {
  const factory InvoiceRecapBySalesGlobalSpecial({
    @JsonKey(
      name: 'customer',
      defaultValue: '',
      includeIfNull: true,
    )
    required String customer,
    @JsonKey(name: 'subtotal') required double subtotal,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'additional_discount_value')
    required double additionalDiscountValue,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(name: 'pph22_value') required double pph22Value,
    @JsonKey(name: 'total') required double total,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
    @JsonKey(name: 'discount_value_summary')
    required double discountValueSummary,
    @JsonKey(name: 'additional_discount_value_summary')
    required double additionalDiscountValueSummary,
    @JsonKey(name: 'ppn_value_summary') required double ppnValueSummary,
    @JsonKey(name: 'pph22_value_summary') required double pph22ValueSummary,
    @JsonKey(name: 'total_summary') required double totalSummary,
  }) = _InvoiceRecapBySalesGlobalSpecial;
  const InvoiceRecapBySalesGlobalSpecial._();

  factory InvoiceRecapBySalesGlobalSpecial.fromJson(
          Map<String, dynamic> json,) =>
      _$InvoiceRecapBySalesGlobalSpecialFromJson(json);

  factory InvoiceRecapBySalesGlobalSpecial.empty() =>
      const InvoiceRecapBySalesGlobalSpecial(
        customer: '',
        subtotal: 0,
        discountValue: 0,
        additionalDiscountValue: 0,
        ppnValue: 0,
        pph22Value: 0,
        total: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        additionalDiscountValueSummary: 0,
        ppnValueSummary: 0,
        pph22ValueSummary: 0,
        totalSummary: 0,
      );
}
