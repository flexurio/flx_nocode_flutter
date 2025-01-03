import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketing_position.freezed.dart';
part 'marketing_position.g.dart';

@freezed
class MarketingPosition with _$MarketingPosition {
  factory MarketingPosition(
    String id,
  ) = _MarketingPosition;
  const MarketingPosition._();

  factory MarketingPosition.fromJson(Map<String, dynamic> json) =>
      _$MarketingPositionFromJson(json);
}
