import 'package:freezed_annotation/freezed_annotation.dart';
part 'ebitda.freezed.dart';
part 'ebitda.g.dart';

@freezed
class Ebitda with _$Ebitda {
  const factory Ebitda(
    String period,
    @JsonKey(name: 'marketing_area_code') String marketingAreaCode,
    @JsonKey(name: 'coa_no') String coaNo,
    @JsonKey(name: 'coa_name') String coaName,
    double value,
    double percent,
    @JsonKey(name: 'value_ytd') double valueYTD,
    @JsonKey(name: 'percent_ytd') double percentYTD,
    @JsonKey(name: 'percent_result') double percentResult,
    @JsonKey(name: 'percent_result_ytd') double percentResultYTD,
    @JsonKey(name: 'coa_group') String coaGroup,
  ) = _Ebitda;
  const Ebitda._();

  factory Ebitda.fromJson(Map<String, Object?> json) => _$EbitdaFromJson(json);

  bool get isSales =>
      coaName.startsWith('SALES') ||
      coaNo == '401' ||
      coaGroup.startsWith('SALES');
}
