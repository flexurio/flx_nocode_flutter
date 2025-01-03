import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_line.freezed.dart';
part 'production_line.g.dart';

@freezed
class ProductionLine with _$ProductionLine {
  const factory ProductionLine(
    int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _ProductionLine;
  const ProductionLine._();

  factory ProductionLine.fromJson(Map<String, Object?> json) =>
      _$ProductionLineFromJson(json);
}
