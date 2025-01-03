// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      (json['user_id'] as num).toInt(),
      json['user_name'] as String,
      (json['office_id'] as num?)?.toInt(),
      json['office_name'] as String?,
      dateTimeNullableFromJson(json['in_date_time'] as String?),
      (json['in_radius_from_office'] as num?)?.toDouble(),
      dateTimeNullableFromJson(json['out_date_time'] as String?),
      (json['out_radius_from_office'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'office_id': instance.officeId,
      'office_name': instance.officeName,
      'in_date_time': instance.inDateTime?.toIso8601String(),
      'in_radius_from_office': instance.inRadiusFromOffice,
      'out_date_time': instance.outDateTime?.toIso8601String(),
      'out_radius_from_office': instance.outRadiusFromOffice,
    };
