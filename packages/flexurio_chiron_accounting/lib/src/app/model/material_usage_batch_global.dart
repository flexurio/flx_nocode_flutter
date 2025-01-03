import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_batch_global.freezed.dart';
part 'material_usage_batch_global.g.dart';

@freezed
class MaterialUsageBatchGlobal with _$MaterialUsageBatchGlobal {
  const factory MaterialUsageBatchGlobal({
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'batch_no') String? batchNo,
    required double total,
    @JsonKey(name: 'total_summary') required double totalSummary,
  }) = _MaterialUsageBatchGlobal;
  const MaterialUsageBatchGlobal._();
  
  factory MaterialUsageBatchGlobal.fromJson(Map<String, dynamic> json) => _$MaterialUsageBatchGlobalFromJson(json);
}