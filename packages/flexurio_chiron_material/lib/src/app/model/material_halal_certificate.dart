import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_halal_certificate.freezed.dart';
part 'material_halal_certificate.g.dart';

@freezed
class MaterialHalalCertificate with _$MaterialHalalCertificate {
  const factory MaterialHalalCertificate({
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
    required DateTime? halalCertificateExpired,
    @JsonKey(name: 'is_active', defaultValue: false) required bool isActive,
  }) = _MaterialHalalCertificate;
  const MaterialHalalCertificate._();

  factory MaterialHalalCertificate.empty() => MaterialHalalCertificate(
        isActive: false,
        materialGroupId: '',
        materialId: '',
        materialName: '',
        materialUnitId: '',
        halalCertificateExpired: DateTime(0),
      );

  factory MaterialHalalCertificate.fromJson(Map<String, Object?> json) =>
      _$MaterialHalalCertificateFromJson(json);
}
