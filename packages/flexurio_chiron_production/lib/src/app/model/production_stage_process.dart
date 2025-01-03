import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_line.dart';
import 'package:flexurio_chiron_production/src/app/model/production_machine.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_stage_process.freezed.dart';
part 'production_stage_process.g.dart';

enum ProductionStageProcessType implements ColorType {
  empty('', '', Colors.transparent),
  regular('REGULER', 'Reguler', Colors.blue),
  ruahan('RUAHAN', 'Ruahan', Colors.purple);

  const ProductionStageProcessType(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static ProductionStageProcessType fromString(String id) {
    if (id == ProductionStageProcessType.regular.id) {
      return ProductionStageProcessType.regular;
    }
    if (id == ProductionStageProcessType.ruahan.id) {
      return ProductionStageProcessType.ruahan;
    }
    return ProductionStageProcessType.empty;
  }
}

@freezed
class ProductionStageProcess with _$ProductionStageProcess {
  factory ProductionStageProcess({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required int ordinal,
    @JsonKey(name: 'lead_time') required double leadTime,
    @JsonKey(
      name: 'production_type',
      fromJson: ProductionStageProcessType.fromString,
    )
    required ProductionStageProcessType type,
    @JsonKey(name: 'product', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'machine', fromJson: ProductionMachine.fromJson)
    required ProductionMachine productionMachine,
    @JsonKey(name: 'line', fromJson: ProductionLine.fromJson)
    required ProductionLine productionLine,
    @JsonKey(
      name: 'production_substage',
      fromJson: ProductionSubStage.fromJson,
    )
    required ProductionSubStage productionSubStage,
  }) = _ProductionStageProcess;
  const ProductionStageProcess._();

  factory ProductionStageProcess.fromJson(Map<String, dynamic> json) =>
      _$ProductionStageProcessFromJson(json);
}
