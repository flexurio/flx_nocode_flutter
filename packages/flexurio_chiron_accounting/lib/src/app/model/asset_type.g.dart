// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetTypeImpl _$$AssetTypeImplFromJson(Map<String, dynamic> json) =>
    _$AssetTypeImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      json['id'] as String,
      json['name'] as String,
      (json['amount_of_depreciation'] as num?)?.toInt() ?? 0,
      ChartOfAccountNumber.fromJson(
          json['coa_invoice'] as Map<String, dynamic>),
      ChartOfAccountNumber.fromJson(json['coa'] as Map<String, dynamic>),
      ChartOfAccountNumber.fromJson(
          json['coa_accumulation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AssetTypeImplToJson(_$AssetTypeImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'name': instance.name,
      'amount_of_depreciation': instance.amountOfDepreciation,
      'coa_invoice': instance.coaInvoice,
      'coa': instance.coa,
      'coa_accumulation': instance.coaAccumulation,
    };
