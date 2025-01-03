import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_global.freezed.dart';
part 'material_usage_global.g.dart';

@freezed
class MaterialUsageGlobal with _$MaterialUsageGlobal {
  const factory MaterialUsageGlobal({
    @JsonKey(name: 'material_issue_id') required String materialIssueId,
    required String description,
    @JsonKey(name: 'material_issue_date', fromJson: isoDateToDateTime) required DateTime materialIssueDate,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'subtotal_summary') required double subtotalSummary,
  }) = _MaterialUsageGlobal;

  const MaterialUsageGlobal._();

  factory MaterialUsageGlobal.empty() => MaterialUsageGlobal(
      materialIssueId: '',
      description: '',
      totalPrice: 0,
      subtotalSummary: 0, 
      materialIssueDate: DateTime(0),
    );

  factory MaterialUsageGlobal.fromJson(Map<String, dynamic> json) => _$MaterialUsageGlobalFromJson(json);
}
