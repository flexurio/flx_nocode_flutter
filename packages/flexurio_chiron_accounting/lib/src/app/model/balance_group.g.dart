// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceGroupImpl _$$BalanceGroupImplFromJson(Map<String, dynamic> json) =>
    _$BalanceGroupImpl(
      id: json['id'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      name: json['name'] as String,
      type: _balanceGroupTypeFromString(json['type'] as String),
      profitAndLossBalance:
          _balanceGroupCategoryFromString(json['category'] as String),
    );

Map<String, dynamic> _$$BalanceGroupImplToJson(_$BalanceGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'type': _$BalanceGroupTypeEnumMap[instance.type]!,
      'category': _$BalanceGroupCategoryEnumMap[instance.profitAndLossBalance]!,
    };

const _$BalanceGroupTypeEnumMap = {
  BalanceGroupType.empty: 'empty',
  BalanceGroupType.debt: 'debt',
  BalanceGroupType.debit: 'debit',
  BalanceGroupType.credit: 'credit',
};

const _$BalanceGroupCategoryEnumMap = {
  BalanceGroupCategory.empty: 'empty',
  BalanceGroupCategory.balanceSheet: 'balanceSheet',
  BalanceGroupCategory.profitAndLoss: 'profitAndLoss',
  BalanceGroupCategory.profitLoss: 'profitLoss',
};
