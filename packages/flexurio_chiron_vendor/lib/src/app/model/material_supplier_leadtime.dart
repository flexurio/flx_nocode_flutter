import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_supplier_leadtime.freezed.dart';
part 'material_supplier_leadtime.g.dart';

@freezed
class MaterialSupplierLeadTime with _$MaterialSupplierLeadTime {
  const factory MaterialSupplierLeadTime(
    int? id,
    @JsonKey(name: 'lead_time') int leadTime,
    Vendor vendor,
    Material material,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _MaterialSupplierLeadTime;
  const MaterialSupplierLeadTime._();

  factory MaterialSupplierLeadTime.fromJson(Map<String, Object?> json) =>
      _$MaterialSupplierLeadTimeFromJson(json);
}
