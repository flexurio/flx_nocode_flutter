import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_type.freezed.dart';
part 'department_type.g.dart';

@freezed
class DepartmentType with _$DepartmentType {
  factory DepartmentType(
    String id,
    String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _DepartmentType;
  const DepartmentType._();

  factory DepartmentType.empty() => DepartmentType(
        '',
        '',
        DateTime.now(),
        DateTime.now(),
      );

  factory DepartmentType.fromJson(Map<String, dynamic> json) =>
      _$DepartmentTypeFromJson(json);
}
