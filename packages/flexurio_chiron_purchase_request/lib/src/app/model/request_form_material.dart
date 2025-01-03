import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_form_material.freezed.dart';
part 'request_form_material.g.dart';

@freezed
class RequestFormMaterial with _$RequestFormMaterial {
  const factory RequestFormMaterial({
    required String id,
    required String name,
    @JsonKey(name: 'is_material_type') required bool isMaterialType,
  }) = _RequestFormMaterial;
  const RequestFormMaterial._();

  factory RequestFormMaterial.fromJson(Map<String, Object?> json) => _$RequestFormMaterialFromJson(json);

  factory RequestFormMaterial.empty() => const RequestFormMaterial(
    id: '', 
    name: '', 
    isMaterialType: false,
  );
}
