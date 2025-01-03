import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  factory Role(
    int id,
    String name,
    String description,
  ) = _Role;
  const Role._();

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  factory Role.empty() {
    return Role(
      0,
      '',
      '',
    );
  }
}
