import 'package:freezed_annotation/freezed_annotation.dart';

part 'leadtime_material.freezed.dart';
part 'leadtime_material.g.dart';

@freezed
class LeadtimeMaterial with _$LeadtimeMaterial {
  const factory LeadtimeMaterial({
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'vendor_id') required String vendorId,
    @JsonKey(name: 'vendor_name') required String vendorName,
    @JsonKey(name: 'lead_time') required int leadTime,
    @JsonKey(name: 'pack_size') required int packSize,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    @JsonKey(name: 'stock_unit_id') required String stockUnitId,
  }) = _LeadtimeMaterial;
  const LeadtimeMaterial._();

  factory LeadtimeMaterial.empty() => const LeadtimeMaterial(
    materialGroupId: '', 
    materialId: '', 
    materialName: '', 
    vendorId: '', 
    vendorName: '', 
    leadTime: 0, 
    packSize: 0, 
    materialUnitId: '', 
    stockUnitId: '',
  );

  factory LeadtimeMaterial.fromJson(Map<String, Object?> json) => _$LeadtimeMaterialFromJson(json);
}
