import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_hour.freezed.dart';
part 'work_hour.g.dart';

enum Day {
  monday('Monday'),
  tuesday('Tuesday'),
  wednesday('Wednesday'),
  thursday('Thursday'),
  friday('Friday'),
  saturday('Saturday'),
  sunday('Sunday');

  const Day(this.day);
  final String day;
}

@freezed
class WorkHour with _$WorkHour {
  const factory WorkHour(
    int id,
    @JsonKey(
      fromJson: timeOfDayFromString,
      toJson: timeOfDayToString,
    )
    TimeOfDay start,
    @JsonKey(
      fromJson: timeOfDayFromString,
      toJson: timeOfDayToString,
    )
    TimeOfDay end,
    @JsonKey(fromJson: dayFromString) Day day,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _WorkHour;
  const WorkHour._();

  factory WorkHour.fromJson(Map<String, Object?> json) =>
      _$WorkHourFromJson(json);
}

String timeOfDayToString(TimeOfDay time) {
  return time.toTime;
}

Day dayFromString(String day) {
  if (day == Day.monday.day) {
    return Day.monday;
  } else if (day == Day.tuesday.day) {
    return Day.tuesday;
  } else if (day == Day.wednesday.day) {
    return Day.wednesday;
  } else if (day == Day.thursday.day) {
    return Day.thursday;
  } else if (day == Day.friday.day) {
    return Day.friday;
  } else if (day == Day.saturday.day) {
    return Day.saturday;
  } else if (day == Day.sunday.day) {
    return Day.sunday;
  } else {
    throw ArgumentError();
  }
}
