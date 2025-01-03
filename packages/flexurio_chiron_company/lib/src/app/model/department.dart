import 'package:flexurio_chiron_company/src/app/model/department_group.dart';
import 'package:flexurio_chiron_company/src/app/model/department_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.freezed.dart';
part 'department.g.dart';

@freezed
class Department with _$Department {
  factory Department(
    String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updatedById,
    @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
    DepartmentGroup departmentGroup,
    @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
    DepartmentType departmentType,
    String name,
    String email,
  ) = _Department;
  const Department._();

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  factory Department.empty() {
    return Department(
      '',
      DateTime(0),
      0,
      DateTime(0),
      0,
      DepartmentGroup.empty(),
      DepartmentType.empty(),
      '',
      '',
    );
  }
}
