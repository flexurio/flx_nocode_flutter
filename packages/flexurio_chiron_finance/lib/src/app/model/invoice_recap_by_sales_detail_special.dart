import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_detail_special.freezed.dart';
part 'invoice_recap_by_sales_detail_special.g.dart';

@freezed
class InvoiceRecapBySalesDetailSpecial with _$InvoiceRecapBySalesDetailSpecial {
  const factory InvoiceRecapBySalesDetailSpecial({
    @JsonKey(
      name: 'customer',
      defaultValue: '',
      includeIfNull: true,
    )
    required String customer,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    @JsonKey(name: 'subtotal') required double subtotalSales,
    @JsonKey(name: 'discount_value') required double discountValueSales,
    @JsonKey(name: 'additional_discount_value')
    required double additionalDiscountValueSales,
    @JsonKey(name: 'ppn_value') required double ppnValueSales,
    @JsonKey(name: 'pph22_value') required double pph22ValueSales,
    @JsonKey(name: 'total') required double total,
    @JsonKey(name: 'subtotal_customer') required double subtotalCustomer,
    @JsonKey(name: 'discount_value_customer')
    required double discountValueCustomer,
    @JsonKey(name: 'additional_discount_value_customer')
    required double additionalDiscountValueCustomer,
    @JsonKey(name: 'ppn_value_customer') required double ppnValueCustomer,
    @JsonKey(name: 'pph22_value_customer') required double pph22ValueCustomer,
    @JsonKey(name: 'total_customer') required double totalCustomer,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
    @JsonKey(name: 'discount_value_summary')
    required double discountValueSummary,
    @JsonKey(name: 'additional_discount_value_summary')
    required double additionalDiscountValueSummary,
    @JsonKey(name: 'ppn_value_summary') required double ppnValueSummary,
    @JsonKey(name: 'pph22_value_summary') required double pph22ValueSummary,
    @JsonKey(name: 'total_summary') required double totalSummary,
    @JsonKey(name: 'tax_invoice') String? taxInvoice,
  }) = _InvoiceRecapBySalesDetailSpecial;
  const InvoiceRecapBySalesDetailSpecial._();

  factory InvoiceRecapBySalesDetailSpecial.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InvoiceRecapBySalesDetailSpecialFromJson(json);

  factory InvoiceRecapBySalesDetailSpecial.empty() =>
      InvoiceRecapBySalesDetailSpecial(
        customer: '',
        transactionNo: '',
        transactionDate: DateTime.now(),
        taxInvoice: '',
        subtotalSales: 0,
        discountValueSales: 0,
        additionalDiscountValueSales: 0,
        ppnValueSales: 0,
        pph22ValueSales: 0,
        total: 0,
        subtotalCustomer: 0,
        discountValueCustomer: 0,
        additionalDiscountValueCustomer: 0,
        ppnValueCustomer: 0,
        pph22ValueCustomer: 0,
        totalCustomer: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        additionalDiscountValueSummary: 0,
        ppnValueSummary: 0,
        pph22ValueSummary: 0,
        totalSummary: 0,
      );
}
