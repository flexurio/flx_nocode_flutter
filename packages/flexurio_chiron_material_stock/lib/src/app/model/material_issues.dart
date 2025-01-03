import 'package:freezed_annotation/freezed_annotation.dart';
part 'material_issues.freezed.dart';
part 'material_issues.g.dart';

@freezed
class MaterialIssues with _$MaterialIssues {
  const factory MaterialIssues({
    required String id,
  }) = _MaterialIssues;

  const MaterialIssues._();

  factory MaterialIssues.fromJson(Map<String, Object?> json) =>
      _$MaterialIssuesFromJson(json);
}
