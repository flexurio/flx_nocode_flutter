import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_approved_vendor.freezed.dart';
part 'material_approved_vendor.g.dart';

enum MaterialApprovedVendorCategory implements ColorType {
  supplement('SUPLEMEN', flutter.Colors.orange),
  drug('OBAT', flutter.Colors.green),
  herbs('HERBAL', flutter.Colors.blueAccent),
  cosmetics('KOSMETIK', flutter.Colors.grey),
  auxiliaryMaterial('BAHAN PENOLONG', flutter.Colors.lime),
  kemasan('KEMASAN', flutter.Colors.teal),
  empty('', flutter.Colors.transparent);

  const MaterialApprovedVendorCategory(this.status, this.color);

  @override
  String get label => status;

  @override
  final flutter.Color color;
  final String status;
}

enum MaterialApprovedVendorType implements ColorType {
  aslBahanPengemas('ASL Bahan Pengemas', flutter.Colors.teal),
  aslBahanAwal('ASL Bahan Awal', flutter.Colors.blue),
  aslPenolong('ASL Penolong', flutter.Colors.indigo),
  aslBahanPenolong('ASL Bahan Penolong', flutter.Colors.indigo),
  haaml('HAAML', flutter.Colors.orange),
  apml('APML', flutter.Colors.green),
  haml('HAML', flutter.Colors.blueAccent),
  empty('', flutter.Colors.transparent);

  const MaterialApprovedVendorType(this.status, this.color);

  @override
  String get label => status;

  @override
  final flutter.Color color;
  final String status;
}

@freezed
class MaterialApprovedVendor with _$MaterialApprovedVendor {
  const factory MaterialApprovedVendor(
    int id,
    @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
    DateTime? halalCertificateExpired,
    @JsonKey(name: 'halal_institution', defaultValue: '')
    String halalInstitution,
    @JsonKey(name: 'halal_no_certificate') String halalNoCertificate,
    @JsonKey(name: 'storage_procedure') String storageProcedure,
    String? description,
    @JsonKey(fromJson: _categoryFromString)
    MaterialApprovedVendorCategory category,
    @JsonKey(fromJson: _typeFromString) MaterialApprovedVendorType type,
    Material material,
    Supplier supplier,
    Vendor vendor,
    @JsonKey(name: 'certificate_document') String sertificateDocument,
    @JsonKey(name: 'is_enable', defaultValue: false) bool isEnable,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _MaterialApprovedVendor;
  const MaterialApprovedVendor._();

  factory MaterialApprovedVendor.fromJson(Map<String, Object?> json) =>
      _$MaterialApprovedVendorFromJson(json);
}

MaterialApprovedVendorCategory _categoryFromString(String category) {
  if (category == MaterialApprovedVendorCategory.supplement.status) {
    return MaterialApprovedVendorCategory.supplement;
  }
  if (category == MaterialApprovedVendorCategory.drug.status) {
    return MaterialApprovedVendorCategory.drug;
  }
  if (category == MaterialApprovedVendorCategory.herbs.status) {
    return MaterialApprovedVendorCategory.herbs;
  }
  if (category == MaterialApprovedVendorCategory.cosmetics.status) {
    return MaterialApprovedVendorCategory.cosmetics;
  }
  if (category == MaterialApprovedVendorCategory.auxiliaryMaterial.status) {
    return MaterialApprovedVendorCategory.auxiliaryMaterial;
  }
  if (category == MaterialApprovedVendorCategory.kemasan.status) {
    return MaterialApprovedVendorCategory.kemasan;
  }
  return MaterialApprovedVendorCategory.empty;
}

MaterialApprovedVendorType _typeFromString(String type) {
  if (type == MaterialApprovedVendorType.aslBahanPengemas.status) {
    return MaterialApprovedVendorType.aslBahanPengemas;
  }
  if (type == MaterialApprovedVendorType.aslBahanAwal.status) {
    return MaterialApprovedVendorType.aslBahanAwal;
  }
  if (type == MaterialApprovedVendorType.aslBahanPenolong.status) {
    return MaterialApprovedVendorType.aslBahanPenolong;
  }
  if (type == MaterialApprovedVendorType.aslPenolong.status) {
    return MaterialApprovedVendorType.aslPenolong;
  }
  if (type == MaterialApprovedVendorType.haaml.status) {
    return MaterialApprovedVendorType.haaml;
  }
  if (type == MaterialApprovedVendorType.apml.status) {
    return MaterialApprovedVendorType.apml;
  }
  if (type == MaterialApprovedVendorType.haml.status) {
    return MaterialApprovedVendorType.haml;
  }
  return MaterialApprovedVendorType.empty;
}
