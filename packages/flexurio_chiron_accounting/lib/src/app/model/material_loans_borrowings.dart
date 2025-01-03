import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_loans_borrowings.freezed.dart';
part 'material_loans_borrowings.g.dart';

@freezed
class MaterialLoansBorrowings with _$MaterialLoansBorrowings {
  const factory MaterialLoansBorrowings({
    @JsonKey(name: 'value_summary') required int valueSummary, @JsonKey(name: 'material_issue_type_id') String? materialIssueTypeId,
    @JsonKey(name: 'material_issue_type_name') String? materialIssueTypeName,
    int? value,
  }) = _MaterialLoansBorrowings;
  const MaterialLoansBorrowings._();

  factory MaterialLoansBorrowings.empty() =>
    const MaterialLoansBorrowings(
      valueSummary: 0,
    );
  factory MaterialLoansBorrowings.fromJson(Map<String, dynamic> json) => _$MaterialLoansBorrowingsFromJson(json);
}
