import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_mutation_recap.freezed.dart';
part 'product_stock_mutation_recap.g.dart';

@freezed
class ProductStockMutationRecap with _$ProductStockMutationRecap {
  const factory ProductStockMutationRecap({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String? productName,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'quantity_in') required int quantityIn,
    @JsonKey(name: 'quantity_out') required int quantityOut,
    @JsonKey(name: 'total') required int total,
  }) = _ProductStockMutationRecap;

  const ProductStockMutationRecap._();

  factory ProductStockMutationRecap.fromJson(Map<String, dynamic> json) =>
      _$ProductStockMutationRecapFromJson(json);
}
