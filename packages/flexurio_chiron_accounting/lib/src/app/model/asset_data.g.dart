// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetDataImpl _$$AssetDataImplFromJson(Map<String, dynamic> json) =>
    _$AssetDataImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      json['id'] as String,
      Department.fromJson(json['department'] as Map<String, dynamic>),
      Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      AssetType.fromJson(json['asset_type'] as Map<String, dynamic>),
      AssetLocation.fromJson(json['location_asset'] as Map<String, dynamic>),
      AssetLocation.fromJson(json['location_current'] as Map<String, dynamic>),
      isoDateToDateTime(json['date'] as String?),
      json['asset_name'] as String,
      (json['quantity'] as num).toInt(),
      MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      (json['price'] as num).toDouble(),
      json['remark'] as String,
      (json['discount_percent'] as num).toDouble(),
      json['is_non_active'] as bool,
      (json['ppn_percent'] as num).toDouble(),
      json['pic'] as String? ?? '',
      json['asset_registration_id'] as String? ?? '',
      json['na_material'] as String? ?? '',
      json['serial_number'] as String? ?? '',
      (json['depreciation_value'] as num).toInt(),
      (json['monthly_depreciation_value'] as num).toInt(),
      (json['depreciation_count'] as num).toInt(),
    );

Map<String, dynamic> _$$AssetDataImplToJson(_$AssetDataImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'department': instance.department,
      'supplier': instance.supplier,
      'asset_type': instance.assetType,
      'location_asset': instance.assetLocation,
      'location_current': instance.assetLocationCurrent,
      'date': instance.date.toIso8601String(),
      'asset_name': instance.assetName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'price': instance.price,
      'remark': instance.remark,
      'discount_percent': instance.discountPercent,
      'is_non_active': instance.isNonActive,
      'ppn_percent': instance.ppnPercent,
      'pic': instance.pic,
      'asset_registration_id': instance.assetRegistrationId,
      'na_material': instance.naMaterial,
      'serial_number': instance.serialNumber,
      'depreciation_value': instance.depreciationValue,
      'monthly_depreciation_value': instance.monthlyDepreciationValue,
      'depreciation_count': instance.depreciationCount,
    };
