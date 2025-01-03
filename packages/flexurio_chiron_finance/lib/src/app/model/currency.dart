import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.freezed.dart';
part 'currency.g.dart';

@freezed
class Currency with _$Currency {
  factory Currency({
    @JsonKey(
      name: 'created_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate,
    )
    required DateTime createdAt,
    @JsonKey(
      name: 'updated_at',
      fromJson: isoDateToDateTime,
      toJson: dateTimeToIsoDate,
    )
    required DateTime updatedAt,
    @JsonKey(name: 'id') required String id,
    Offline? offline,
  }) = _Currency;
  const Currency._();

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  factory Currency.empty() => Currency(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: '',
      );

  factory Currency.idr() => Currency(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: 'IDR',
      );
}

@freezed
class Offline with _$Offline {
  factory Offline({
    required String host,
  }) = _Offline;
  const Offline._();

  factory Offline.fromJson(Map<String, dynamic> json) =>
      _$OfflineFromJson(json);
}
