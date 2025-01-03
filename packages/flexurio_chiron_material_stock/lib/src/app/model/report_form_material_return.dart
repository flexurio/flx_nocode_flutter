import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_form_material_return.freezed.dart';
part 'report_form_material_return.g.dart';

@freezed
class ReportFormMaterialReturn with _$ReportFormMaterialReturn {
  factory ReportFormMaterialReturn({
    required int id,
    required double quantity,
    required String na,
    @JsonKey(name: 'design_code') String? designCode,
    @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
    required Warehouse warehouse,
    @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
    required MaterialReturn materialReturn,
    @JsonKey(name: 'material', fromJson: Material.fromJson)
    required Material material,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit materialUnit,
  }) = _ReportFormMaterialReturn;
  const ReportFormMaterialReturn._();

  factory ReportFormMaterialReturn.fromJson(Map<String, dynamic> json) =>
      _$ReportFormMaterialReturnFromJson(json);
}
