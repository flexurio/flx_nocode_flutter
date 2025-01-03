import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_machine.freezed.dart';
part 'production_machine.g.dart';

@freezed
class ProductionMachine with _$ProductionMachine {
  const factory ProductionMachine(
    int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'asset_no', defaultValue: '') String? assetNumber,
  ) = _ProductionMachine;
  const ProductionMachine._();

  factory ProductionMachine.fromJson(Map<String, Object?> json) =>
      _$ProductionMachineFromJson(json);
}
