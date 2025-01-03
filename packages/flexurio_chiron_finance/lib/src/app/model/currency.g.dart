// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyImpl _$$CurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      id: json['id'] as String,
      offline: json['offline'] == null
          ? null
          : Offline.fromJson(json['offline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CurrencyImplToJson(_$CurrencyImpl instance) =>
    <String, dynamic>{
      'created_at': dateTimeToIsoDate(instance.createdAt),
      'updated_at': dateTimeToIsoDate(instance.updatedAt),
      'id': instance.id,
      'offline': instance.offline,
    };

_$OfflineImpl _$$OfflineImplFromJson(Map<String, dynamic> json) =>
    _$OfflineImpl(
      host: json['host'] as String,
    );

Map<String, dynamic> _$$OfflineImplToJson(_$OfflineImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
    };
