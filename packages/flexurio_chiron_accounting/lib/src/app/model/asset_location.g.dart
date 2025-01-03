// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetLocationImpl _$$AssetLocationImplFromJson(Map<String, dynamic> json) =>
    _$AssetLocationImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      json['id'] as String,
      json['location_name'] as String,
    );

Map<String, dynamic> _$$AssetLocationImplToJson(_$AssetLocationImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'location_name': instance.locationName,
    };
