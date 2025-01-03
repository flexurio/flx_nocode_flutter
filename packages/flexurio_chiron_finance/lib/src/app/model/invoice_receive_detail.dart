import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_detail.freezed.dart';
part 'invoice_receive_detail.g.dart';

@freezed
class InvoiceReceiveDetail with _$InvoiceReceiveDetail {
  factory InvoiceReceiveDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'purchase_order_invoice_id') required String invoiceId,
    @JsonKey(name: 'unit_id') required String unitId,
    required Material material,
    required Product product,
    @JsonKey(name: 'quantity_invoice') required int qtyInvoice,
    required double price,
    required double total,
  }) = _InvoiceReceiveDetail;
  const InvoiceReceiveDetail._();

  factory InvoiceReceiveDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReceiveDetailFromJson(json);
}

enum InvoiceReceiveType {
  product('Product'),
  material('Material');

  const InvoiceReceiveType(this.value);
  final String value;
}
