import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_return_note.freezed.dart';
part 'recap_product_return_note.g.dart';

@freezed
class RecapProductReturnNote with _$RecapProductReturnNote {
  factory RecapProductReturnNote({
    @JsonKey(name: 'product_return_id') required String productReturnId,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'customer') required String customer,
    @JsonKey(name: 'reference_no') required String referenceNo,
    @JsonKey(name: 'warehouse') required String warehouse,
    @JsonKey(name: 'product') required String product,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo,
    @JsonKey(name: 'product_price') required int productPrice,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'discount_percent') required int discountPercent,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime) required DateTime deliveryOrderDate,
    @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime) required DateTime expirationDate,
  }) = _RecapProductReturnNote;

  factory RecapProductReturnNote.fromJson(Map<String, dynamic> json) => _$RecapProductReturnNoteFromJson(json);
  const RecapProductReturnNote._();

  factory RecapProductReturnNote.empty() {
    return RecapProductReturnNote(
      productReturnId: '', 
      description: '', 
      deliveryOrderId: '', 
      customer: '', 
      referenceNo: '', 
      warehouse: '', 
      product: '', 
      quantity: 0, 
      unitId: '', 
      taxInvoiceNo: '',
      productPrice: 0, 
      batchNo: '', 
      discountPercent: 0, 
      createdAt: DateTime(0), 
      deliveryOrderDate: DateTime(0), 
      expirationDate: DateTime(0), 
    );
  }
}
