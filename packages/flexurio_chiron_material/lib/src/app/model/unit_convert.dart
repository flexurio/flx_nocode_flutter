import 'package:equatable/equatable.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_convert.freezed.dart';
part 'unit_convert.g.dart';

@freezed
class UnitConvert extends Equatable with _$UnitConvert {
  const factory UnitConvert({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'convert_formula') required String formula,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit materialUnit,
    @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit convertUnit,
  }) = _UnitConvert;
  const UnitConvert._();

  factory UnitConvert.fromJson(Map<String, Object?> json) =>
      _$UnitConvertFromJson(json);

  @override
  List<Object> get props => [id];
}

// @freezed
// class Unit with _$Unit {
//   const factory Unit({
//     required String id,
//     required String type,
//   }) = _Unit;
//   const Unit._();

//   factory Unit.fromJson(Map<String, Object?> json) => _$UnitFromJson(json);
// }
