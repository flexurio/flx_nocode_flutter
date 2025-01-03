import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'presence_employee.freezed.dart';
part 'presence_employee.g.dart';

@freezed
class PresenceEmployee with _$PresenceEmployee {
  const factory PresenceEmployee({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(fromJson: Office.fromJson) required Office office,
    @JsonKey(name: 'in_date_time', fromJson: _dateTimeFromJson)
    required DateTime inDateTime,
    @JsonKey(name: 'in_latitude') required double inLatitude,
    @JsonKey(name: 'in_longitude') required double inLongitude,
    @JsonKey(name: 'in_accuracy') required double inAccuracy,
    @JsonKey(name: 'in_altitude') required double inAltitude,
    @JsonKey(name: 'in_radius_from_office') required double inRadiusFromOffice,
    @JsonKey(name: 'out_date_time', fromJson: dateTimeNullableFromJson)
    required DateTime? outDateTime,
    @JsonKey(name: 'out_latitude') required double? outLatitude,
    @JsonKey(name: 'out_longitude') required double? outLongitude,
    @JsonKey(name: 'out_accuracy') required double? outAccuracy,
    @JsonKey(name: 'out_altitude') required double? outAltitude,
    @JsonKey(name: 'out_radius_from_office')
    required double? outRadiusFromOffice,
  }) = _PresenceEmployee;
  const PresenceEmployee._();

  factory PresenceEmployee.fromJson(Map<String, Object?> json) =>
      _$PresenceEmployeeFromJson(json);

  String get status {
    if (outDateTime == null) {
      return 'In';
    } else {
      return 'Out';
    }
  }

  Duration get inLate {
    final officeInTime =
        DateTime(inDateTime.year, inDateTime.month, inDateTime.day, 8);
    return inDateTime.difference(officeInTime);
  }

  Duration? get total {
    if (outDateTime != null) {
      return outDateTime!.difference(inDateTime);
    }
    return null;
  }

  bool get isInLate => inLate.inMinutes <= 0;
  bool? get isOutEarly {
    if (outEarly != null) {
      return !(outEarly!.inMinutes <= 0);
    }
    return null;
  }

  Duration? get outEarly {
    if (outDateTime != null) {
      final officeOutTime =
          DateTime(inDateTime.year, inDateTime.month, inDateTime.day, 17);
      return officeOutTime.difference(outDateTime!);
    }
    return null;
  }

  String get inTime {
    return DateFormat('HH:mm').format(inDateTime);
  }

  String? get outTime {
    if (outDateTime == null) return null;
    return DateFormat('HH:mm').format(outDateTime!);
  }
}

DateTime _dateTimeFromJson(String dateTime) {
  return DateTime.parse(dateTime).toLocal();
}
