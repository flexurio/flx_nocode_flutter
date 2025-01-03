import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global_special_all.freezed.dart';
part 'invoice_recap_by_sales_global_special_all.g.dart';

@freezed
class InvoiceRecapBySalesGlobalSpecialAll
    with _$InvoiceRecapBySalesGlobalSpecialAll {
  const factory InvoiceRecapBySalesGlobalSpecialAll({
    @JsonKey(name: 'transaction_name') required String transactionName,
    @JsonKey(name: 'customer',
    defaultValue: '',
      includeIfNull: true,
    ) required String customer,
    @JsonKey(name: 'subtotal_customer') required double subtotalCustomer,
    @JsonKey(name: 'discount_value_customer')
    required double discountValueCustomer,
    @JsonKey(name: 'additional_discount_value_customer')
    required double additionalDiscountValueCustomer,
    @JsonKey(name: 'ppn_value_customer') required double ppnValueCustomer,
    @JsonKey(name: 'pph22_value_customer') required double pph22ValueCustomer,
    @JsonKey(name: 'total_customer') required double totalCustomer,
    @JsonKey(name: 'subtotal_transaction_type')
    required double subtotalTransactionType,
    @JsonKey(name: 'discount_value_transaction_type')
    required double discountValueTransactionType,
    @JsonKey(name: 'additional_discount_value_transaction_type')
    required double additionalDiscountValueTransactionType,
    @JsonKey(name: 'ppn_value_transaction_type')
    required double ppnValueTransactionType,
    @JsonKey(name: 'pph22_value_transaction_type')
    required double pph22ValueTransactionType,
    @JsonKey(name: 'total_transaction_type')
    required double totalTransactionType,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
    @JsonKey(name: 'discount_value_summary')
    required double discountValueSummary,
    @JsonKey(name: 'additional_discount_value_summary')
    required double additionalDiscountValueSummary,
    @JsonKey(name: 'ppn_value_summary') required double ppnValueSummary,
    @JsonKey(name: 'pph22_value_summary') required double pph22ValueSummary,
    @JsonKey(name: 'total_summary') required double totalSummary,
  }) = _InvoiceRecapBySalesGlobalSpecialAll;
  const InvoiceRecapBySalesGlobalSpecialAll._();

  factory InvoiceRecapBySalesGlobalSpecialAll.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InvoiceRecapBySalesGlobalSpecialAllFromJson(json);

  factory InvoiceRecapBySalesGlobalSpecialAll.empty() =>
      const InvoiceRecapBySalesGlobalSpecialAll(
        transactionName: '',
        customer: '',
        subtotalCustomer: 0,
        discountValueCustomer: 0,
        additionalDiscountValueCustomer: 0,
        ppnValueCustomer: 0,
        pph22ValueCustomer: 0,
        totalCustomer: 0,
        subtotalTransactionType: 0,
        discountValueTransactionType: 0,
        additionalDiscountValueTransactionType: 0,
        ppnValueTransactionType: 0,
        pph22ValueTransactionType: 0,
        totalTransactionType: 0,
        subtotalSummary: 0,
        discountValueSummary: 0,
        additionalDiscountValueSummary: 0,
        ppnValueSummary: 0,
        pph22ValueSummary: 0,
        totalSummary: 0,
      );
}
