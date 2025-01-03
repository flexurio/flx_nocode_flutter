import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_tax_report.freezed.dart';
part 'sales_tax_report.g.dart';



@freezed
class SalesTaxReport with _$SalesTaxReport {
  const factory SalesTaxReport({
        @JsonKey(name: 'product_id') required String productID,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'tax_invoice_number') required String taxInvoiceNumber,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'quantity') required double quantity,
    @JsonKey(name: 'period') required String period,
    @JsonKey(name: 'subtotal') required double subTotal,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'value_discount') required double valueDiscount,
    @JsonKey(name: 'customer_npwp_number') required String customerNpwpNumber,
    @JsonKey(name: 'subtotal_after_additional_discount') required double subTotalAfterAdditionalDiscount,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_address') required String customerAddress,
    @JsonKey(name: 'grand_total') required double grandTotal,
    @JsonKey(name: 'subtotal_after_discount') required double subTotalAfterDiscount,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(name: 'transaction_no') required String transactionNo,
  }) = _SalesTaxReport;
  const SalesTaxReport._();

  factory SalesTaxReport.fromJson(Map<String, dynamic> json) =>
      _$SalesTaxReportFromJson(json);

  factory SalesTaxReport.empty() => SalesTaxReport(
      productID:'',
      productName:'',
      taxInvoiceNumber:'',
      price:0,
      quantity:0,
      period:'',
      subTotal:0,
      transactionDate:DateTime(0),
      valueDiscount: 0,
      customerNpwpNumber:'',
      subTotalAfterAdditionalDiscount:0,
      customerName:'',
      customerAddress:'',
      grandTotal:0,
      subTotalAfterDiscount:0,
      ppnValue:0,
      transactionNo:'',
      );
}
