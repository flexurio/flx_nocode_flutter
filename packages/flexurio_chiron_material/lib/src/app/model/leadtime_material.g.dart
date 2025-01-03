// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leadtime_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadtimeMaterialImpl _$$LeadtimeMaterialImplFromJson(
        Map<String, dynamic> json) =>
    _$LeadtimeMaterialImpl(
      materialGroupId: json['material_group_id'] as String,
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      vendorId: json['vendor_id'] as String,
      vendorName: json['vendor_name'] as String,
      leadTime: (json['lead_time'] as num).toInt(),
      packSize: (json['pack_size'] as num).toInt(),
      materialUnitId: json['material_unit_id'] as String,
      stockUnitId: json['stock_unit_id'] as String,
    );

Map<String, dynamic> _$$LeadtimeMaterialImplToJson(
        _$LeadtimeMaterialImpl instance) =>
    <String, dynamic>{
      'material_group_id': instance.materialGroupId,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
      'lead_time': instance.leadTime,
      'pack_size': instance.packSize,
      'material_unit_id': instance.materialUnitId,
      'stock_unit_id': instance.stockUnitId,
    };
