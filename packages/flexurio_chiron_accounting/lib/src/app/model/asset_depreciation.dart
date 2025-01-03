import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_depreciation.freezed.dart';
part 'asset_depreciation.g.dart';

@freezed
class AssetDepreciation with _$AssetDepreciation {
  const factory AssetDepreciation({
    required String remark,
    @JsonKey(name: 'asset_code') required String assetCode,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
    required DateTime acquisitionDate,
    @JsonKey(name: 'acquisition_value_plus')
    required double acquisitionValuePlus,
    @JsonKey(name: 'acquisition_value_min') required double acquisitionValueMin,
    @JsonKey(name: 'acquisition_value') required double acquisitionValue,
    @JsonKey(name: 'formula') required double formula,
    @JsonKey(name: 'depreciation_value') required double depreciationValue,
    @JsonKey(name: 'total_formula') required double totalFormula,
    @JsonKey(name: 'final_value') required double finalValue,
  }) = _AssetDepreciation;
  const AssetDepreciation._();

  factory AssetDepreciation.fromJson(Map<String, dynamic> json) =>
      _$AssetDepreciationFromJson(json);
}
