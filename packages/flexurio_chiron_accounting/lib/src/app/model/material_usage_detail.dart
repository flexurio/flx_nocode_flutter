import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_detail.freezed.dart';
part 'material_usage_detail.g.dart';

@freezed
class MaterialUsageDetail with _$MaterialUsageDetail {
  const factory MaterialUsageDetail({
    @JsonKey(name: 'material_issue_id') required String materialIssueId,
    required String description,
    @JsonKey(name: 'material_name') required String materialName,
    required int quantity,
    required int price,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'mi_type') required String miType,
    @JsonKey(name: 'mi_type_name') required String miTypeName,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
  }) = _MaterialUsageDetail;

  const MaterialUsageDetail._();

  factory MaterialUsageDetail.empty() => const MaterialUsageDetail(
      materialIssueId: '',
      description: '',
      materialName: '',
      quantity: 0,
      price: 0,
      totalPrice: 0,
      miType: '',
      miTypeName: '',
      subtotalSummary: 0,
    );

  factory MaterialUsageDetail.fromJson(Map<String, dynamic> json) => _$MaterialUsageDetailFromJson(json);
}
