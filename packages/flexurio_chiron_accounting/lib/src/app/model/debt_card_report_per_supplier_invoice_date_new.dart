import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'debt_card_report_per_supplier_invoice_date_new.freezed.dart';
part 'debt_card_report_per_supplier_invoice_date_new.g.dart';

@freezed
class DebtCardReportPerSupplierInvoiceDateNew with _$DebtCardReportPerSupplierInvoiceDateNew {
  const factory DebtCardReportPerSupplierInvoiceDateNew({
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'payment_id') required String paymentId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'payment_remaining') required int paymentRemaining,
    @JsonKey(name: 'payment_amount') required int paymentAmount,
    @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime) 
    required DateTime invoiceDate,
    @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime) 
    required DateTime invoiceReceiveDate,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) 
    required DateTime dueDate,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) 
    required DateTime transactionDate,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'supplier_address') required String supplierAddress,
    String? description,
    @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
    DateTime? receiveDate,
  }) = _DebtCardReportPerSupplierInvoiceDateNew;
  const DebtCardReportPerSupplierInvoiceDateNew._();

  factory DebtCardReportPerSupplierInvoiceDateNew.empty() =>
    DebtCardReportPerSupplierInvoiceDateNew(
      invoiceNo: '', 
      paymentId: '', 
      orderId: '', 
      deliveryOrderId: '', 
      transactionId: '', 
      paymentRemaining: 0, 
      paymentAmount: 0, 
      invoiceDate: DateTime(0), 
      invoiceReceiveDate: DateTime(0), 
      dueDate: DateTime(0), 
      transactionDate: DateTime(0), 
      supplierName: '', 
      supplierAddress: '',
    );
  factory DebtCardReportPerSupplierInvoiceDateNew.fromJson(Map<String, dynamic> json) => _$DebtCardReportPerSupplierInvoiceDateNewFromJson(json);
}
