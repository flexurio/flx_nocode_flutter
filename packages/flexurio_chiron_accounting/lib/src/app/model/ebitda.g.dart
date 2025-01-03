// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebitda.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EbitdaImpl _$$EbitdaImplFromJson(Map<String, dynamic> json) => _$EbitdaImpl(
      json['period'] as String,
      json['marketing_area_code'] as String,
      json['coa_no'] as String,
      json['coa_name'] as String,
      (json['value'] as num).toDouble(),
      (json['percent'] as num).toDouble(),
      (json['value_ytd'] as num).toDouble(),
      (json['percent_ytd'] as num).toDouble(),
      (json['percent_result'] as num).toDouble(),
      (json['percent_result_ytd'] as num).toDouble(),
      json['coa_group'] as String,
    );

Map<String, dynamic> _$$EbitdaImplToJson(_$EbitdaImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'marketing_area_code': instance.marketingAreaCode,
      'coa_no': instance.coaNo,
      'coa_name': instance.coaName,
      'value': instance.value,
      'percent': instance.percent,
      'value_ytd': instance.valueYTD,
      'percent_ytd': instance.percentYTD,
      'percent_result': instance.percentResult,
      'percent_result_ytd': instance.percentResultYTD,
      'coa_group': instance.coaGroup,
    };
