import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_usage_summary_rupiah.freezed.dart';
part 'material_usage_summary_rupiah.g.dart';

@freezed
class MaterialUsageSummaryRupiah with _$MaterialUsageSummaryRupiah {
  const factory MaterialUsageSummaryRupiah({
    @JsonKey(name: 'material_issue_type_id') required String materialIssueTypeId,
    @JsonKey(name: 'material_issue_type_name') required String materialIssueTypeName,
    @JsonKey(name: 'value') required int value,
    @JsonKey(name: 'value_summary') required int valueSummary,
  }) = _MaterialUsageSummaryRupiah;
  const MaterialUsageSummaryRupiah._();

  factory MaterialUsageSummaryRupiah.empty() => const MaterialUsageSummaryRupiah(
    materialIssueTypeId: '', 
    materialIssueTypeName: '', 
    value: 0, 
    valueSummary: 0,
  );
  factory MaterialUsageSummaryRupiah.fromJson(Map<String, dynamic> json) => _$MaterialUsageSummaryRupiahFromJson(json);
}
