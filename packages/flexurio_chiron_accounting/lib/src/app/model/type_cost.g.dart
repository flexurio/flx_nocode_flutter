// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeCostImpl _$$TypeCostImplFromJson(Map<String, dynamic> json) =>
    _$TypeCostImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      name: json['name'] as String,
      chartOfAccountNumber: ChartOfAccountNumber.fromJson(
          json['chart_of_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TypeCostImplToJson(_$TypeCostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'chart_of_account': instance.chartOfAccountNumber,
    };
