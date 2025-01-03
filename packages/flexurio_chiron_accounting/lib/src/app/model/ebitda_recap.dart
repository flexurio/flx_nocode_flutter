import 'package:freezed_annotation/freezed_annotation.dart';
part 'ebitda_recap.freezed.dart';
part 'ebitda_recap.g.dart';

@freezed
class EbitdaRecap with _$EbitdaRecap {
  const factory EbitdaRecap(
    String area,
    double amount,
    @JsonKey(name: 'amount_ytd') double amountYTD,
    @JsonKey(name: 'amount_percent') double amountPercent,
    @JsonKey(name: 'amount_percent_ytd') double amountPercentYTD,
  ) = _EbitdaRecap;
  const EbitdaRecap._();

  factory EbitdaRecap.fromJson(Map<String, Object?> json) =>
      _$EbitdaRecapFromJson(json);
}
