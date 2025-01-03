import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_stock_recap.freezed.dart';
part 'product_stock_recap.g.dart';

@freezed
class ProductStockRecap with _$ProductStockRecap {
  const factory ProductStockRecap({
    required String period,
    required String warehouse,
    required String unit,
    required String division,
    @JsonKey(name: 'created_at', 
    fromJson: isoDateToDateTime,) required DateTime createdAt,
    @JsonKey(name: 'updated_at', 
    fromJson: isoDateToDateTime,) required DateTime updatedAt,
    @JsonKey(name: 'expired_date', 
    fromJson: isoDateToDateTime,) required DateTime expiredDate,
    @JsonKey(name: 'release_at', 
    fromJson: isoDateToDateTime,) required DateTime releaseAt,
    @JsonKey(name: 'qty_in') required int qtyIn,
    @JsonKey(name: 'qty_out') required int qtyOut,
    @JsonKey(name: 'qty_out_marketing') required int qtyOutMarketing,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'ending_balance_marketing') required int endingBalanceMarketing,
    @JsonKey(name: 'qty_product_receive') required int qtyProductReceive,
    required Product product,
    @JsonKey(name: 'product_received_id') required String productReceivedId,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_by_id') required int updatedById,
  }) = _ProductStockRecap;

  const ProductStockRecap._();

  factory ProductStockRecap.empty() => ProductStockRecap(
    period: '', 
    warehouse: '', 
    unit: '', 
    division: '', 
    qtyIn: 0, 
    qtyOut: 0, 
    qtyOutMarketing: 0, 
    beginningBalance: 0, 
    endingBalance: 0, 
    endingBalanceMarketing: 0,
    qtyProductReceive: 0, 
    product: Product.empty(), 
    productReceivedId: '', 
    batchNoId: '', 
    createdById: 0, 
    updatedById: 0, 
    createdAt: DateTime(0), 
    updatedAt: DateTime(0),
    expiredDate: DateTime(0), 
    releaseAt: DateTime(0), 
  );

  factory ProductStockRecap.fromJson(Map<String, dynamic> json) => _$ProductStockRecapFromJson(json);
}
