import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_request_hit.freezed.dart';
part 'material_request_hit.g.dart';

@freezed
class MaterialRequestHit with _$MaterialRequestHit {
  factory MaterialRequestHit({
    required String id,
    required String description,
    required String status,
  }) = _MaterialRequestHit;
  const MaterialRequestHit._();

  factory MaterialRequestHit.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestHitFromJson(json);
}
