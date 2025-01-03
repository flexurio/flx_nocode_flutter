// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebitda_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EbitdaRecapImpl _$$EbitdaRecapImplFromJson(Map<String, dynamic> json) =>
    _$EbitdaRecapImpl(
      json['area'] as String,
      (json['amount'] as num).toDouble(),
      (json['amount_ytd'] as num).toDouble(),
      (json['amount_percent'] as num).toDouble(),
      (json['amount_percent_ytd'] as num).toDouble(),
    );

Map<String, dynamic> _$$EbitdaRecapImplToJson(_$EbitdaRecapImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'amount': instance.amount,
      'amount_ytd': instance.amountYTD,
      'amount_percent': instance.amountPercent,
      'amount_percent_ytd': instance.amountPercentYTD,
    };
