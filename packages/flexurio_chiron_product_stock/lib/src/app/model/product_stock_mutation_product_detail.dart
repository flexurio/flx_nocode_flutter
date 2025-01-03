import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_mutation_product_detail.freezed.dart';
part 'product_stock_mutation_product_detail.g.dart';

@freezed
class ProductStockMutationProductDetail with _$ProductStockMutationProductDetail {
  const factory ProductStockMutationProductDetail({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_division') required String productDivision,
    required String unit,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'qty_in') required int qtyIn,
    @JsonKey(name: 'qty_out') required int qtyOut,
    @JsonKey(name: 'qty_out_return') required int qtyOutReturn,
    @JsonKey(name: 'qty_out_another') required int qtyOutAnother,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime) required DateTime expiredDate,
  }) = _ProductStockMutationProductDetail;
  const ProductStockMutationProductDetail._();

  factory ProductStockMutationProductDetail.fromJson(Map<String, dynamic> json) => _$ProductStockMutationProductDetailFromJson(json);
}