import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_note_invoice.freezed.dart';
part 'delivery_note_invoice.g.dart';

@freezed
class DeliveryNoteInvoice with _$DeliveryNoteInvoice {
  factory DeliveryNoteInvoice({
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'period') required String period,
    @JsonKey(name: 'code_invoice') required String codeInvoice,
    @JsonKey(name: 'code_sales_invoice') required String codeSalesInvoice,
    @JsonKey(name: 'sales_invoice_id') required String salesInvoiceId,
    @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
    required DateTime dateSalesOrder,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
    required DateTime dateTransaction,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'qty') required int qty,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'subtotal_after_discount')
    required int subTotalAfterDiscount,
    @JsonKey(name: 'ppn_value') required int ppnValue,
    @JsonKey(name: 'price') required int price,
  }) = _DeliveryNoteInvoice;

  const DeliveryNoteInvoice._();

  factory DeliveryNoteInvoice.empty() {
    return DeliveryNoteInvoice(
      year: 0,
      period: '',
      codeInvoice: '',
      codeSalesInvoice: '',
      salesInvoiceId: '',
      dateSalesOrder: DateTime(0),
      deliveryOrderId: '',
      invoiceId: '',
      dateTransaction: DateTime(0),
      taxInvoiceNo: '',
      customerId: '',
      productId: '',
      productName: '',
      batchNoId: '',
      qty: 0,
      discountPercent: 0,
      subTotalAfterDiscount: 0,
      ppnValue: 0,
      price: 0,
    );
  }

  factory DeliveryNoteInvoice.fromJson(Map<String, dynamic> json) =>
      _$DeliveryNoteInvoiceFromJson(json);
}
