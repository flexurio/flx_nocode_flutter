import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_report.freezed.dart';
part 'material_issue_report.g.dart';

enum MaterialIssueReportType implements ColorType {
  byAnalysisNumber('by_analysis_number', Colors.blueAccent),
  byBatch('by_batch', Colors.purpleAccent);

  const MaterialIssueReportType(this.label, this.color);

  @override
  final String label;

  @override
  final Color color;

  static List<MaterialIssueReportType> get list => [
        MaterialIssueReportType.byAnalysisNumber,
        MaterialIssueReportType.byBatch,
      ];
}

@freezed
class MaterialIssueReport with _$MaterialIssueReport {
  const factory MaterialIssueReport({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'expired_date') required String expiredDate,
    required String unit,
    @JsonKey(name: 'qty') required int quantity,
  }) = _MaterialIssueReport;
  const MaterialIssueReport._();

  factory MaterialIssueReport.fromJson(Map<String, Object?> json) =>
      _$MaterialIssueReportFromJson(json);
}
