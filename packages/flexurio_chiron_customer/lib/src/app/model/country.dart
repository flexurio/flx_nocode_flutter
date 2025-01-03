import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@freezed
class Country with _$Country {
  const factory Country({
    required int id,
    required String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _Country;
  const Country._();

  factory Country.fromJson(Map<String, Object?> json) =>
      _$CountryFromJson(json);

  factory Country.empty() => Country(
        id: 0,
        name: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}
