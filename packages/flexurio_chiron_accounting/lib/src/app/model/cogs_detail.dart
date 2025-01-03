import 'package:freezed_annotation/freezed_annotation.dart';

part 'cogs_detail.freezed.dart';
part 'cogs_detail.g.dart';

@freezed
class CogsDetail with _$CogsDetail {
  const factory CogsDetail(
    @JsonKey(name: 'transaction_no') String transaction,
    @JsonKey(name: 'purchase_order_no') String purchaseOrder,
    @JsonKey(name: 'batch_no') String batch,
    @JsonKey(name: 'product_id') String productId,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(name: 'material_id') String materialId,
    @JsonKey(name: 'material_name') String materialName,
    @JsonKey(name: 'na') String na,
    @JsonKey(name: 'qty') num quantity,
    num price,
    num value,
    @JsonKey(name: 'remark') String remark,
  ) = _CogsDetail;
  const CogsDetail._();

  factory CogsDetail.fromJson(Map<String, Object?> json) =>
      _$CogsDetailFromJson(json);
}
