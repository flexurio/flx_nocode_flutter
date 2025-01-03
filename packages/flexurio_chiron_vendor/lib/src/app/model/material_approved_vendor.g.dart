// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_approved_vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialApprovedVendorImpl _$$MaterialApprovedVendorImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialApprovedVendorImpl(
      (json['id'] as num).toInt(),
      dateTimeNullable(json['halal_certificate_expired'] as String?),
      json['halal_institution'] as String? ?? '',
      json['halal_no_certificate'] as String,
      json['storage_procedure'] as String,
      json['description'] as String?,
      _categoryFromString(json['category'] as String),
      _typeFromString(json['type'] as String),
      Material.fromJson(json['material'] as Map<String, dynamic>),
      Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
      json['certificate_document'] as String,
      json['is_enable'] as bool? ?? false,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$MaterialApprovedVendorImplToJson(
        _$MaterialApprovedVendorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'halal_certificate_expired':
          instance.halalCertificateExpired?.toIso8601String(),
      'halal_institution': instance.halalInstitution,
      'halal_no_certificate': instance.halalNoCertificate,
      'storage_procedure': instance.storageProcedure,
      'description': instance.description,
      'category': _$MaterialApprovedVendorCategoryEnumMap[instance.category]!,
      'type': _$MaterialApprovedVendorTypeEnumMap[instance.type]!,
      'material': instance.material,
      'supplier': instance.supplier,
      'vendor': instance.vendor,
      'certificate_document': instance.sertificateDocument,
      'is_enable': instance.isEnable,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$MaterialApprovedVendorCategoryEnumMap = {
  MaterialApprovedVendorCategory.supplement: 'supplement',
  MaterialApprovedVendorCategory.drug: 'drug',
  MaterialApprovedVendorCategory.herbs: 'herbs',
  MaterialApprovedVendorCategory.cosmetics: 'cosmetics',
  MaterialApprovedVendorCategory.auxiliaryMaterial: 'auxiliaryMaterial',
  MaterialApprovedVendorCategory.kemasan: 'kemasan',
  MaterialApprovedVendorCategory.empty: 'empty',
};

const _$MaterialApprovedVendorTypeEnumMap = {
  MaterialApprovedVendorType.aslBahanPengemas: 'aslBahanPengemas',
  MaterialApprovedVendorType.aslBahanAwal: 'aslBahanAwal',
  MaterialApprovedVendorType.aslPenolong: 'aslPenolong',
  MaterialApprovedVendorType.aslBahanPenolong: 'aslBahanPenolong',
  MaterialApprovedVendorType.haaml: 'haaml',
  MaterialApprovedVendorType.apml: 'apml',
  MaterialApprovedVendorType.haml: 'haml',
  MaterialApprovedVendorType.empty: 'empty',
};
