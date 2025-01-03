import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_batch.freezed.dart';
part 'material_usage_batch.g.dart';

@freezed
class MaterialUsageBatch with _$MaterialUsageBatch {
  const factory MaterialUsageBatch({
    @JsonKey(name: 'batch_no') String? batchNo,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'material_group_id') String? materialGroupId,
    @JsonKey(name: 'material_id') String? materialId,
    @JsonKey(name: 'material_name') String? materialName,
    double? quantity,
    String? unit,
    int? price,
    @JsonKey(name: 'total_price') double? totalPrice,
    @JsonKey(name: 'total_price_summary') double? totalPriceSummary,
  }) = _MaterialUsageBatch;
  const MaterialUsageBatch._();
  
  factory MaterialUsageBatch.fromJson(Map<String, dynamic> json) => _$MaterialUsageBatchFromJson(json);
}
