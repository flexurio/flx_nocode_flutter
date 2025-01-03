import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_data.freezed.dart';
part 'asset_data.g.dart';

@freezed
class AssetData with _$AssetData {
  factory AssetData(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updateById,
    String id,
    @JsonKey(name: 'department', fromJson: Department.fromJson)
    Department department,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
    @JsonKey(name: 'asset_type', fromJson: AssetType.fromJson)
    AssetType assetType,
    @JsonKey(name: 'location_asset', fromJson: AssetLocation.fromJson)
    AssetLocation assetLocation,
    @JsonKey(name: 'location_current', fromJson: AssetLocation.fromJson)
    AssetLocation assetLocationCurrent,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
    @JsonKey(name: 'asset_name') String assetName,
    int quantity,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
    double price,
    String remark,
    @JsonKey(name: 'discount_percent') double discountPercent,
    @JsonKey(name: 'is_non_active') bool isNonActive,
    @JsonKey(name: 'ppn_percent') double ppnPercent,
    @JsonKey(name: 'pic', defaultValue: '') String? pic,
    @JsonKey(name: 'asset_registration_id', defaultValue: '')
    String? assetRegistrationId,
    @JsonKey(name: 'na_material', defaultValue: '') String? naMaterial,
    @JsonKey(name: 'serial_number', defaultValue: '') String serialNumber,
    @JsonKey(name: 'depreciation_value') int depreciationValue,
    @JsonKey(name: 'monthly_depreciation_value') int monthlyDepreciationValue,
    @JsonKey(name: 'depreciation_count') int depreciationCount,
  ) = _AssetData;
  const AssetData._();

  factory AssetData.fromJson(Map<String, dynamic> json) =>
      _$AssetDataFromJson(json);
}
