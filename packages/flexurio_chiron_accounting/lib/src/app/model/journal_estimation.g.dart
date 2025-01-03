// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_estimation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEstimationImpl _$$JournalEstimationImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEstimationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: JournalEstimationType.fromString(json['type'] as String),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      upudatedById: (json['updated_by_id'] as num).toInt(),
    );

Map<String, dynamic> _$$JournalEstimationImplToJson(
        _$JournalEstimationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$JournalEstimationTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.upudatedById,
    };

const _$JournalEstimationTypeEnumMap = {
  JournalEstimationType.empty: 'empty',
  JournalEstimationType.journal: 'journal',
  JournalEstimationType.umum: 'umum',
  JournalEstimationType.hpp: 'hpp',
};
