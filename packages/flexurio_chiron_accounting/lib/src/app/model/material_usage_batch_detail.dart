import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_batch_detail.freezed.dart';
part 'material_usage_batch_detail.g.dart';

@freezed
class MaterialUsageBatchDetail with _$MaterialUsageBatchDetail {
  const factory MaterialUsageBatchDetail({
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'batch_no') String? batchNo,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'transaction_type_name') required String transactionTypeName,
    required double quantity,
    String? unit,
    required double price,
    @JsonKey(name: 'total_price') required double totalPrice,
    @JsonKey(name: 'total_price_summary') required double totalPriceSummary,
    @JsonKey(name: 'total_price_material_group') required double totalPriceMaterialGroup,
  }) = _MaterialUsageBatchDetail;
  const MaterialUsageBatchDetail._();
  
  factory MaterialUsageBatchDetail.fromJson(Map<String, dynamic> json) => _$MaterialUsageBatchDetailFromJson(json);
}