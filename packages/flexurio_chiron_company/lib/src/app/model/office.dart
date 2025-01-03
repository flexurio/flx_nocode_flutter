import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'office.freezed.dart';
part 'office.g.dart';

@freezed
class Office with _$Office {
  const factory Office(
    int id,
    String name,
    double latitude,
    double longitude,
    double radius,
    String description,
    String address,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _Office;
  const Office._();

  factory Office.fromJson(Map<String, Object?> json) => _$OfficeFromJson(json);
}
