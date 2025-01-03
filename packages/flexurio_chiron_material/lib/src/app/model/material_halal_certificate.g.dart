// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_halal_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialHalalCertificateImpl _$$MaterialHalalCertificateImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialHalalCertificateImpl(
      materialGroupId: json['material_group_id'] as String,
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      materialUnitId: json['material_unit_id'] as String,
      halalCertificateExpired:
          dateTimeNullable(json['halal_certificate_expired'] as String?),
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$$MaterialHalalCertificateImplToJson(
        _$MaterialHalalCertificateImpl instance) =>
    <String, dynamic>{
      'material_group_id': instance.materialGroupId,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'material_unit_id': instance.materialUnitId,
      'halal_certificate_expired':
          instance.halalCertificateExpired?.toIso8601String(),
      'is_active': instance.isActive,
    };
