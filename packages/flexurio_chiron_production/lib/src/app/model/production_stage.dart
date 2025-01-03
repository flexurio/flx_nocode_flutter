import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_stage.freezed.dart';
part 'production_stage.g.dart';

@freezed
class ProductionStage with _$ProductionStage {
  const factory ProductionStage(
    int id,
    String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _ProductionStage;
  const ProductionStage._();

  factory ProductionStage.fromJson(Map<String, Object?> json) =>
      _$ProductionStageFromJson(json);
}
