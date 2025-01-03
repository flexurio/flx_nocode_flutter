import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate.freezed.dart';
part 'rate.g.dart';

@freezed
class Rate with _$Rate {
  factory Rate(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'validity_date', fromJson: isoDateToDateTime)
    DateTime validityDate,
    Currency currency,
    int id,
    double rate,
  ) = _Rate;
  const Rate._();

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}
