import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_location.freezed.dart';
part 'asset_location.g.dart';

@freezed
class AssetLocation with _$AssetLocation {
  factory AssetLocation(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updateById,
    String id,
    @JsonKey(name: 'location_name') String locationName,
  ) = _AssetLocation;
  const AssetLocation._();

  factory AssetLocation.fromJson(Map<String, dynamic> json) =>
      _$AssetLocationFromJson(json);
}
