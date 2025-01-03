import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_sub_stage.freezed.dart';
part 'production_sub_stage.g.dart';

@freezed
class ProductionSubStage with _$ProductionSubStage {
  const factory ProductionSubStage(
    int id,
    String name,
    @JsonKey(name: 'production_stage') ProductionStage stage,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
  ) = _ProductionSubStage;
  const ProductionSubStage._();

  factory ProductionSubStage.fromJson(Map<String, Object?> json) =>
      _$ProductionSubStageFromJson(json);
}
