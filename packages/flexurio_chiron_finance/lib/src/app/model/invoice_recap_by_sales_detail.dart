import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_detail.freezed.dart';
part 'invoice_recap_by_sales_detail.g.dart';

@freezed
class InvoiceRecapBySalesDetail with _$InvoiceRecapBySalesDetail {
  const factory InvoiceRecapBySalesDetail({
    @JsonKey(name: 'customer',
      defaultValue: '',
      includeIfNull: true,
    ) required String customer,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date') required DateTime transactionDate,
    @JsonKey(name: 'subtotal') required double subtotal, @JsonKey(name: 'discount_value') required double discountValue, @JsonKey(name: 'additional_discount_value')
    required double additionalDiscountValue, @JsonKey(name: 'ppn_value') required double ppnValue, @JsonKey(name: 'total') required double total, @JsonKey(name: 'subtotal_customer') required double subtotalCustomer, @JsonKey(name: 'discount_value_customer')
    required double discountValueCustomer, @JsonKey(name: 'additional_discount_value_customer')
    required double additionalDiscountValueCustomer, @JsonKey(name: 'ppn_value_customer') required double ppnValueCustomer, @JsonKey(name: 'total_customer') required double totalCustomer, @JsonKey(name: 'subtotal_summary') required double subtotalSummary, @JsonKey(name: 'discount_value_summary')
    required double discountValueSummary, @JsonKey(name: 'additional_discount_value_summary')
    required double additionalDiscountValueSummary, @JsonKey(name: 'ppn_value_summary') required double ppnValueSummary, @JsonKey(name: 'total_summary') required double totalSummary, @JsonKey(name: 'tax_invoice') String? taxInvoice,
  }) = _InvoiceRecapBySalesDetail;
  const InvoiceRecapBySalesDetail._();

  factory InvoiceRecapBySalesDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceRecapBySalesDetailFromJson(json);

  factory InvoiceRecapBySalesDetail.empty() => InvoiceRecapBySalesDetail(
        customer: '',
        transactionNo: '',
        transactionDate: DateTime.now(),
        taxInvoice: '',
        subtotal: 0,
        discountValue: 0,
        additionalDiscountValue: 0,
        ppnValue: 0,
        total: 0,
        discountValueCustomer: 0,
        additionalDiscountValueCustomer: 0,
        ppnValueCustomer: 0,
        totalCustomer: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        additionalDiscountValueSummary: 0,
        ppnValueSummary: 0,
        totalSummary: 0,
        subtotalCustomer: 0,
      );
}
