import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_type.freezed.dart';
part 'asset_type.g.dart';

@freezed
class AssetType with _$AssetType {
  factory AssetType(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updateById,
    String id,
    String name,
    @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
    int? amountOfDepreciation,
    @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
    ChartOfAccountNumber coaInvoice,
    @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
    ChartOfAccountNumber coa,
    @JsonKey(name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
    ChartOfAccountNumber coaAccumulation,
  ) = _AssetType;
  const AssetType._();

  factory AssetType.fromJson(Map<String, dynamic> json) =>
      _$AssetTypeFromJson(json);
}
