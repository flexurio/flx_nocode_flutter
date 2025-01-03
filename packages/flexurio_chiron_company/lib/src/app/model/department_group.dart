import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_group.freezed.dart';
part 'department_group.g.dart';

@freezed
class DepartmentGroup with _$DepartmentGroup {
  factory DepartmentGroup(
    String id,
    String name,
    String email,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _DepartmentGroup;

  factory DepartmentGroup.empty() => DepartmentGroup(
        '',
        '',
        '',
        DateTime.now(),
        DateTime.now(),
      );

  factory DepartmentGroup.fromJson(Map<String, dynamic> json) =>
      _$DepartmentGroupFromJson(json);
}
