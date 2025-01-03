// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_supplier_leadtime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialSupplierLeadTimeImpl _$$MaterialSupplierLeadTimeImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialSupplierLeadTimeImpl(
      (json['id'] as num?)?.toInt(),
      (json['lead_time'] as num).toInt(),
      Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
      Material.fromJson(json['material'] as Map<String, dynamic>),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$MaterialSupplierLeadTimeImplToJson(
        _$MaterialSupplierLeadTimeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_time': instance.leadTime,
      'vendor': instance.vendor,
      'material': instance.material,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
