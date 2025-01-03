import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_detail.freezed.dart';
part 'material_return_detail.g.dart';

@freezed
class MaterialReturnDetail with _$MaterialReturnDetail {
  factory MaterialReturnDetail({
    required int id,
    required double quantity,
    required String na,
    @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
    required Warehouse warehouse,
    @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
    required MaterialReturn materialReturn,
    @JsonKey(name: 'material', fromJson: Material.fromJson)
    required Material material,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit materialUnit,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
  }) = _MaterialReturnDetail;
  const MaterialReturnDetail._();

  factory MaterialReturnDetail.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnDetailFromJson(json);
}
