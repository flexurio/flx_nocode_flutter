// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_of_account_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartOfAccountGroupImpl _$$ChartOfAccountGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartOfAccountGroupImpl(
      (json['created_by_id'] as num?)?.toInt(),
      (json['updated_by_id'] as num?)?.toInt(),
      json['forecast_number'] as String,
      BalanceGroup.fromJson(json['balance_group'] as Map<String, dynamic>),
      json['name'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$$ChartOfAccountGroupImplToJson(
        _$ChartOfAccountGroupImpl instance) =>
    <String, dynamic>{
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updateById,
      'forecast_number': instance.forecastNumber,
      'balance_group': instance.balanceGroup,
      'name': instance.name,
      'id': instance.id,
    };
