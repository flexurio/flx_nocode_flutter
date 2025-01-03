import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city.freezed.dart';
part 'city.g.dart';

@freezed
class City with _$City {
  const factory City({
    required String id,
    required String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _City;
  const City._();

  factory City.fromJson(Map<String, Object?> json) => _$CityFromJson(json);
  factory City.empty() {
    return City(
      id: '',
      name: '',
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
    );
  }
}
