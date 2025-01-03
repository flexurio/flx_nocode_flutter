import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_detail.freezed.dart';
part 'product_return_note_detail.g.dart';

@freezed
class ProductReturnNoteDetail with _$ProductReturnNoteDetail {
  factory ProductReturnNoteDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'product_return_note', fromJson: ProductReturnNote.fromJson) required ProductReturnNote productReturnNote,
    @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson) required ProductReturn productReturn,
    @JsonKey(name: 'product', fromJson: Product.fromJson) required Product product,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'unit_id') required String unitId,
    required int quantity,
    required double price,
    required double total,
  }) = _ProductReturnNoteDetail;
  const ProductReturnNoteDetail._();

  factory ProductReturnNoteDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnNoteDetailFromJson(json);
}
