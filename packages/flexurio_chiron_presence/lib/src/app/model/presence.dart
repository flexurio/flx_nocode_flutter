import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class Presence with _$Presence {
  const factory Presence(
    @JsonKey(name: 'user_id') int userId,
    @JsonKey(name: 'user_name') String userName,
    @JsonKey(name: 'office_id') int? officeId,
    @JsonKey(name: 'office_name') String? officeName,
    @JsonKey(name: 'in_date_time', fromJson: dateTimeNullableFromJson)
    DateTime? inDateTime,
    @JsonKey(name: 'in_radius_from_office') double? inRadiusFromOffice,
    @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
    DateTime? outDateTime,
    @JsonKey(name: 'out_radius_from_office') double? outRadiusFromOffice,
  ) = _Presence;
  const Presence._();

  factory Presence.fromJson(Map<String, Object?> json) =>
      _$PresenceFromJson(json);

  String? get inTime {
    if (inDateTime == null) return null;
    return DateFormat('HH:mm').format(inDateTime!);
  }

  String? get outTime {
    if (outDateTime == null) return null;
    return DateFormat('HH:mm').format(outDateTime!);
  }
}
