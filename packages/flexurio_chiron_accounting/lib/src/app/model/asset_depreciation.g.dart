// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_depreciation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetDepreciationImpl _$$AssetDepreciationImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetDepreciationImpl(
      remark: json['remark'] as String,
      assetCode: json['asset_code'] as String,
      quantity: (json['quantity'] as num).toInt(),
      acquisitionDate: isoDateToDateTime(json['acquisition_date'] as String?),
      acquisitionValuePlus: (json['acquisition_value_plus'] as num).toDouble(),
      acquisitionValueMin: (json['acquisition_value_min'] as num).toDouble(),
      acquisitionValue: (json['acquisition_value'] as num).toDouble(),
      formula: (json['formula'] as num).toDouble(),
      depreciationValue: (json['depreciation_value'] as num).toDouble(),
      totalFormula: (json['total_formula'] as num).toDouble(),
      finalValue: (json['final_value'] as num).toDouble(),
    );

Map<String, dynamic> _$$AssetDepreciationImplToJson(
        _$AssetDepreciationImpl instance) =>
    <String, dynamic>{
      'remark': instance.remark,
      'asset_code': instance.assetCode,
      'quantity': instance.quantity,
      'acquisition_date': instance.acquisitionDate.toIso8601String(),
      'acquisition_value_plus': instance.acquisitionValuePlus,
      'acquisition_value_min': instance.acquisitionValueMin,
      'acquisition_value': instance.acquisitionValue,
      'formula': instance.formula,
      'depreciation_value': instance.depreciationValue,
      'total_formula': instance.totalFormula,
      'final_value': instance.finalValue,
    };
