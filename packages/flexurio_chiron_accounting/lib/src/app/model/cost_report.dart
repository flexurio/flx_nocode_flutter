import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_report.freezed.dart';
part 'cost_report.g.dart';

@freezed
class CostReport with _$CostReport {
  const factory CostReport({
    @JsonKey(name: 'chart_of_account_id') required String chartOfAccountId,
    @JsonKey(name: 'chart_of_account_name') required String chartOfAccountName,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'department_name') required String departmentName,
    @JsonKey(name: 'debit') required double debit,
    @JsonKey(name: 'credit') required double credit,
    @JsonKey(name: 'description') required String description,
  }) = _CostReport;
  const CostReport._();

  factory CostReport.fromJson(Map<String, dynamic> json) =>
      _$CostReportFromJson(json);
}
