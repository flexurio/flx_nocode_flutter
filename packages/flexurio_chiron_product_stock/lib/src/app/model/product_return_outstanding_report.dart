import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_outstanding_report.freezed.dart';
part 'product_return_outstanding_report.g.dart';

@freezed
class ProductReturnOutstandingReport with _$ProductReturnOutstandingReport {
  factory ProductReturnOutstandingReport({
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'reference_no') required String referenceNo,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'qty') required String qty,
    @JsonKey(name: 'quantity_check') required int quantityCheck,
    @JsonKey(name: 'unit_id') required int unitId,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'subtotal') required int subtotal,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime) required DateTime expirationDate,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime) required DateTime qualityAssuranceCheckDate,
    @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
    @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson) DateTime? deliveryOrderDate,
    @JsonKey(name: 'product_return_delivery_order_date', fromJson: dateTimeNullableFromJson) DateTime? productReturnDeliveryOrderDate,
    @JsonKey(name: 'product_return_delivery_order_id') String? productReturnDeliveryOrderId,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime) required DateTime confirmPpicAt,
    @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime) required DateTime confirmMarketingAt,
    @JsonKey(name: 'transaction_type_id') required String transactionTypeId,    
  }) = _ProductReturnOutstandingReport;

  factory ProductReturnOutstandingReport.fromJson(Map<String, dynamic> json) => _$ProductReturnOutstandingReportFromJson(json);
  const ProductReturnOutstandingReport._();

  factory ProductReturnOutstandingReport.empty() {
    final productReturnOutstandingReport = ProductReturnOutstandingReport(
      transactionNo: '', 
      deliveryOrderId: '', 
      customerName: '', 
      referenceNo: '', 
      description: '', 
      productName: '', 
      productId: '', 
      qty: '', 
      quantityCheck: 0, 
      unitId: 0, 
      price: 0, 
      subtotal: 0, 
      batchNoId: '', 
      expirationDate: DateTime(0), 
      status: '', 
      qualityAssuranceCheckDate: DateTime(0), 
      taxInvoiceNo: '', 
      productReturnDeliveryOrderId: '', 
      createdAt: DateTime(0), 
      confirmPpicAt: DateTime(0), 
      confirmMarketingAt: DateTime(0), 
      transactionTypeId: '',
    );
    return productReturnOutstandingReport;
  }
}
