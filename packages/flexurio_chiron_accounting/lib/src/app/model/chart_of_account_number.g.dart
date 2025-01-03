// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_of_account_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartOfAccountNumberImpl _$$ChartOfAccountNumberImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartOfAccountNumberImpl(
      json['id'] as String,
      json['name'] as String,
      json['is_factory_overhead'] as bool? ?? false,
      ChartOfAccountNumberStatus.fromString(json['status'] as String),
      ChartOfAccountGroup.fromJson(
          json['chart_of_account_group'] as Map<String, dynamic>),
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ChartOfAccountNumberImplToJson(
        _$ChartOfAccountNumberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_factory_overhead': instance.isFactoryOverhead,
      'status': _$ChartOfAccountNumberStatusEnumMap[instance.status]!,
      'chart_of_account_group': instance.chartOfAccountGroup,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
    };

const _$ChartOfAccountNumberStatusEnumMap = {
  ChartOfAccountNumberStatus.empty: 'empty',
  ChartOfAccountNumberStatus.journal: 'journal',
  ChartOfAccountNumberStatus.nonJournal: 'nonJournal',
  ChartOfAccountNumberStatus.zero: 'zero',
  ChartOfAccountNumberStatus.one: 'one',
};
