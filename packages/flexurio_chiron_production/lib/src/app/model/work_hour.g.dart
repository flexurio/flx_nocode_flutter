// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkHourImpl _$$WorkHourImplFromJson(Map<String, dynamic> json) =>
    _$WorkHourImpl(
      (json['id'] as num).toInt(),
      timeOfDayFromString(json['start'] as String),
      timeOfDayFromString(json['end'] as String),
      dayFromString(json['day'] as String),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$WorkHourImplToJson(_$WorkHourImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': timeOfDayToString(instance.start),
      'end': timeOfDayToString(instance.end),
      'day': _$DayEnumMap[instance.day]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$DayEnumMap = {
  Day.monday: 'monday',
  Day.tuesday: 'tuesday',
  Day.wednesday: 'wednesday',
  Day.thursday: 'thursday',
  Day.friday: 'friday',
  Day.saturday: 'saturday',
  Day.sunday: 'sunday',
};
