import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketing_area.freezed.dart';
part 'marketing_area.g.dart';

@freezed
class MarketingArea with _$MarketingArea {
  factory MarketingArea({
    @JsonKey(name: 'area_kode') required String code,
  }) = _MarketingArea;
  const MarketingArea._();

  factory MarketingArea.fromJson(Map<String, dynamic> json) =>
      _$MarketingAreaFromJson(json);
}
