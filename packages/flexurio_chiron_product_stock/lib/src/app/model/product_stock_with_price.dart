import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_with_price.freezed.dart';
part 'product_stock_with_price.g.dart';

@freezed
class ProductStockWithPrice with _$ProductStockWithPrice {
  factory ProductStockWithPrice({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'product_no') required String productNo,
    @JsonKey(name: 'batch_no') required String batch,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'quantity_stock') required double quantityStock,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'product_group') required String productGroup,
    @JsonKey(name: 'unit') required String unit,
    @JsonKey(name: 'warehouse') required String warehouse,
  }) = _ProductStockWithPrice;
  factory ProductStockWithPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductStockWithPriceFromJson(json);

  const ProductStockWithPrice._();
}
