import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_rupiah.freezed.dart';
part 'product_stock_rupiah.g.dart';

@freezed
class ProductStockRupiah with _$ProductStockRupiah {
  const factory ProductStockRupiah({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'unit_id') required String unitId,
    required int qty,
    @JsonKey(name: 'primary_price') required int primaryPrice,
  }) = _ProductStockRupiah;
  const ProductStockRupiah._();

  factory ProductStockRupiah.empty() => ProductStockRupiah(
    productId: '', 
    productName: '', 
    unitId: '', 
    qty: 0, 
    primaryPrice: 0,
  );
  factory ProductStockRupiah.fromJson(Map<String, dynamic> json) => _$ProductStockRupiahFromJson(json);
}
