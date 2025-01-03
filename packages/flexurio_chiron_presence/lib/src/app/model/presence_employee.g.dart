// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceEmployeeImpl _$$PresenceEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$PresenceEmployeeImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      office: Office.fromJson(json['office'] as Map<String, Object?>),
      inDateTime: _dateTimeFromJson(json['in_date_time'] as String),
      inLatitude: (json['in_latitude'] as num).toDouble(),
      inLongitude: (json['in_longitude'] as num).toDouble(),
      inAccuracy: (json['in_accuracy'] as num).toDouble(),
      inAltitude: (json['in_altitude'] as num).toDouble(),
      inRadiusFromOffice: (json['in_radius_from_office'] as num).toDouble(),
      outDateTime: dateTimeNullableFromJson(json['out_date_time'] as String?),
      outLatitude: (json['out_latitude'] as num?)?.toDouble(),
      outLongitude: (json['out_longitude'] as num?)?.toDouble(),
      outAccuracy: (json['out_accuracy'] as num?)?.toDouble(),
      outAltitude: (json['out_altitude'] as num?)?.toDouble(),
      outRadiusFromOffice: (json['out_radius_from_office'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PresenceEmployeeImplToJson(
        _$PresenceEmployeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'office': instance.office,
      'in_date_time': instance.inDateTime.toIso8601String(),
      'in_latitude': instance.inLatitude,
      'in_longitude': instance.inLongitude,
      'in_accuracy': instance.inAccuracy,
      'in_altitude': instance.inAltitude,
      'in_radius_from_office': instance.inRadiusFromOffice,
      'out_date_time': instance.outDateTime?.toIso8601String(),
      'out_latitude': instance.outLatitude,
      'out_longitude': instance.outLongitude,
      'out_accuracy': instance.outAccuracy,
      'out_altitude': instance.outAltitude,
      'out_radius_from_office': instance.outRadiusFromOffice,
    };
