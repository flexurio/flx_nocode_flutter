// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetTypeImpl _$$BudgetTypeImplFromJson(Map<String, dynamic> json) =>
    _$BudgetTypeImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['level'] as num).toInt(),
      BudgetTypeDepartmentType.fromString(json['department_type'] as String),
      BudgetTypeUsageType.fromString(json['usage_type'] as String),
      (json['parent'] as num).toInt(),
    );

Map<String, dynamic> _$$BudgetTypeImplToJson(_$BudgetTypeImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'department_type':
          _$BudgetTypeDepartmentTypeEnumMap[instance.departmentType]!,
      'usage_type': _$BudgetTypeUsageTypeEnumMap[instance.usageType]!,
      'parent': instance.parent,
    };

const _$BudgetTypeDepartmentTypeEnumMap = {
  BudgetTypeDepartmentType.plant: 'plant',
  BudgetTypeDepartmentType.marketing: 'marketing',
  BudgetTypeDepartmentType.general: 'general',
  BudgetTypeDepartmentType.all: 'all',
  BudgetTypeDepartmentType.empty: 'empty',
  BudgetTypeDepartmentType.unset: 'unset',
};

const _$BudgetTypeUsageTypeEnumMap = {
  BudgetTypeUsageType.group: 'group',
  BudgetTypeUsageType.individual: 'individual',
  BudgetTypeUsageType.masing: 'masing',
  BudgetTypeUsageType.empty: 'empty',
  BudgetTypeUsageType.nonBudget: 'nonBudget',
  BudgetTypeUsageType.unset: 'unset',
};

_$BudgetTypeSummaryImpl _$$BudgetTypeSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetTypeSummaryImpl(
      coa: json['coa'] as String,
      departmentType: json['department_type'] as String,
      subtypeId: (json['id_subtype'] as num).toInt(),
      subtypeName: json['subtype'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$BudgetTypeSummaryImplToJson(
        _$BudgetTypeSummaryImpl instance) =>
    <String, dynamic>{
      'coa': instance.coa,
      'department_type': instance.departmentType,
      'id_subtype': instance.subtypeId,
      'subtype': instance.subtypeName,
      'type': instance.type,
    };
