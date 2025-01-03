import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_expired_product.freezed.dart';
part 'recap_expired_product.g.dart';

@freezed
class RecapExpiredProduct with _$RecapExpiredProduct {
  const factory RecapExpiredProduct({
    @JsonKey(name: 'period') required String period,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) 
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) 
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'qty_in') required int qtyIn,
    @JsonKey(name: 'qty_out') required int qtyOut,
    @JsonKey(name: 'qty_out_marketing') required int qtyOutMarketing,
    @JsonKey(name: 'warehouse') required String warehouse,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'ending_balance_marketing') 
    required int endingBalanceMarketing,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime) 
    required DateTime expiredDate,
    @JsonKey(name: 'product_received_id') required String productReceivedId,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'product', fromJson: Product.fromJson) 
    required Product product,
    @JsonKey(name: 'unit') required String unit,
    @JsonKey(name: 'division') required String division,
    @JsonKey(name: 'qty_product_receive') required int qtyProductReceive,
    @JsonKey(name: 'release_at', fromJson: isoDateToDateTime) 
    required DateTime releaseAt,
  }) = _RecapExpiredProduct;
  const RecapExpiredProduct._();

  factory RecapExpiredProduct.fromJson(Map<String, dynamic> json) =>
      _$RecapExpiredProductFromJson(json);

  factory RecapExpiredProduct.empty() => RecapExpiredProduct(
      period:'',
      createdAt:DateTime(0),
      createdById:0,
      updatedAt:DateTime(0),
      updateById:0,
      qtyIn:0,
      qtyOut:0,
      qtyOutMarketing:0,
      warehouse:'',
      beginningBalance:0,
      endingBalance:0,
      endingBalanceMarketing:0,
      expiredDate:DateTime(0),
      productReceivedId:'',
      batchNoId:'',
      product:Product.empty(),
      unit:'',
      division:'',
      qtyProductReceive:0,
      releaseAt:DateTime(0),
  );
}
