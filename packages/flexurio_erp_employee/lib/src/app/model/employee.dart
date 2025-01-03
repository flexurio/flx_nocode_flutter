import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee extends HiveObject with _$Employee {
  @HiveType(typeId: 0)
  factory Employee(
    @HiveField(0) String nip,
    @HiveField(1) String name,
    @HiveField(2) String email,
  ) = _Employee;
  Employee._();

  factory Employee.fromJson(Map<String, Object?> json) =>
      _$EmployeeFromJson(json);

  factory Employee.empty() {
    return Employee(
      '',
      '',
      '',
    );
  }
}
