import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request_detail.freezed.dart';
part 'product_request_detail.g.dart';

@freezed
class ProductRequestDetail with _$ProductRequestDetail {
  const factory ProductRequestDetail({
    required int? id,
    required int? quantity,
    required double? price,
    required double? subtotal,
    @JsonKey(name: 'discount_percent') required double? discountPercent,
    @JsonKey(name: 'discount_value') required double? discountValue,
    @JsonKey(name: 'price_after_discount') required double? priceAfterDiscount,
    @JsonKey(name: 'product_price') required double? productPrice,
    @JsonKey(name: 'total_product_price') required double? totalProductPrice,
    @JsonKey(name: 'quantity_delivery') required int? quantityDelivery,
    @JsonKey(name: 'quantity_remaining', defaultValue: 0)
    required int? quantityRemaining,
    @JsonKey(name: 'product_id', fromJson: Product.fromJson)
    required Product? product,
    @JsonKey(name: 'unit_id') required String unit,
  }) = _ProductRequestDetail;
  const ProductRequestDetail._();

  factory ProductRequestDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestDetailFromJson(json);

  String get temporaryKey => product!.id;
}
