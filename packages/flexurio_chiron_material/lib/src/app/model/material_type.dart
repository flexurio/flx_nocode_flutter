import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_type.freezed.dart';
part 'material_type.g.dart';

@freezed
class MaterialType with _$MaterialType {
  factory MaterialType({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup? materialGroup,
    String? type,
  }) = _MaterialType;

  const MaterialType._();

  factory MaterialType.empty() {
    return MaterialType(
      id: '',
      updatedAt: DateTime(0),
      createAt: DateTime(0),
      materialGroup: MaterialGroup.empty(),
    );
  }

  factory MaterialType.fromJson(Map<String, dynamic> json) =>
      _$MaterialTypeFromJson(json);

  static MaterialType? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$MaterialTypeFromJson(json as Map<String, dynamic>);
  }
}
