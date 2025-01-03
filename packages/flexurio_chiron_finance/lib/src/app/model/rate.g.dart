// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RateImpl _$$RateImplFromJson(Map<String, dynamic> json) => _$RateImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      isoDateToDateTime(json['validity_date'] as String?),
      Currency.fromJson(json['currency'] as Map<String, dynamic>),
      (json['id'] as num).toInt(),
      (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$RateImplToJson(_$RateImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'validity_date': instance.validityDate.toIso8601String(),
      'currency': instance.currency,
      'id': instance.id,
      'rate': instance.rate,
    };
