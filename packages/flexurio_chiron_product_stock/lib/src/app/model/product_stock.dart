import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';

part 'product_stock.freezed.dart';
part 'product_stock.g.dart';

@freezed
class ProductStock with _$ProductStock {
  const factory ProductStock({
    required String? id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    required String period,
    @JsonKey(name: 'qty_in') required int qtyIn,
    @JsonKey(name: 'qty_out') required int qtyOut,
    @JsonKey(name: 'qty_out_marketing') required int qtyOutMarketing,
    required String? warehouse,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'ending_balance_marketing')
    required int endingBalanceMarketing,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
    @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
    required ProductGroup productGroup,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(name: 'batch_no') required Batch batch,
    @JsonKey(fromJson: Product.fromJson) required Product product,
  }) = _ProductStock;
  const ProductStock._();

  factory ProductStock.fromJson(Map<String, dynamic> json) =>
      _$ProductStockFromJson(json);

  factory ProductStock.empty() {
    return ProductStock(
      id: '',
      createAt: DateTime(0),
      updatedAt: DateTime(0),
      createdById: 0,
      updateById: 0,
      period: '',
      qtyIn: 0,
      qtyOut: 0,
      qtyOutMarketing: 0,
      warehouse: '',
      beginningBalance: 0,
      endingBalance: 0,
      endingBalanceMarketing: 0,
      expiredDate: DateTime(0),
      productGroup: ProductGroup.empty(),
      unit: MaterialUnit.empty(),
      batch: Batch(''),
      product: Product.empty(),
    );
  }
}

@freezed
class Batch with _$Batch {
  factory Batch(
    String id,
  ) = _Batch;
  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}
