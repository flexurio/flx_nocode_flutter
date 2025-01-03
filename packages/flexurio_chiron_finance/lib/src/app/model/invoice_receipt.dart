import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receipt.freezed.dart';
part 'invoice_receipt.g.dart';

@freezed
class InvoiceReceipt with _$InvoiceReceipt {
  const factory InvoiceReceipt({
    @JsonKey(name: 'tax_invoice_number') required String taxInvoiceNumber,
    @JsonKey(fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'delivery_address') required String? deliveryAddress,
    required double total,
    @JsonKey(name: 'tax_invoice') required String? taxInvoice,
    @JsonKey(name: 'division') required String? division,
  }) = _InvoiceReceipt;
  const InvoiceReceipt._();

  factory InvoiceReceipt.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReceiptFromJson(json);

  factory InvoiceReceipt.empty() => InvoiceReceipt(
        taxInvoiceNumber: '',
        date: DateTime(0),
        orderId: '',
        transactionNo: '',
        deliveryAddress: '',
        total: 0,
        taxInvoice: null,
        division: null,
      );
}
