import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_note.freezed.dart';
part 'material_return_note.g.dart';

@freezed
class MaterialReturnNote with _$MaterialReturnNote {
  factory MaterialReturnNote({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required String id,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
    required Supplier supplier,
    @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
    required PurchaseOrder purchaseOrder,
    @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
    required DateTime returnDate,
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
    required DateTime invoiceDate,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo,
    @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
    required DateTime taxInvoiceDate,
    required String description,
    @JsonKey(name: 'is_received_document') required bool isReceivedDocument,
  }) = _MaterialReturnNote;
  const MaterialReturnNote._();

  factory MaterialReturnNote.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnNoteFromJson(json);
}
