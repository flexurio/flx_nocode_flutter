import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_fifo.freezed.dart';
part 'material_stock_fifo.g.dart';

@freezed
class MaterialStockFifo with _$MaterialStockFifo {
  const factory MaterialStockFifo({
    required int id,
    @JsonKey(name: 'material', fromJson: Material.fromJson) required Material material,
    @JsonKey(name: 'material_group') required MaterialGroup materialGroup,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) required DateTime updatedAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    required String period,
    required String na,
    @JsonKey(name: 'quantity_in') required int quantityIn,
    @JsonKey(name: 'quantity_out') required int quantityOut,
    @JsonKey(name: 'beginning_balance') required int beginningBalance,
    @JsonKey(name: 'ending_balance') required int endingBalance,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime) required DateTime expiredDate,
    @JsonKey(name: 'released_date', fromJson: isoDateToDateTime) required DateTime releasedDate,
  }) = _MaterialStockFifo;

  const MaterialStockFifo._();

  factory MaterialStockFifo.empty() => MaterialStockFifo(
    id: 0, 
    material: Material.empty(),
    materialGroup: MaterialGroup.empty(),
    createdAt: DateTime(0), 
    updatedAt: DateTime(0), 
    createdById: 0, 
    updatedById: 0, 
    period: '', 
    na: '', 
    quantityIn: 0, 
    quantityOut: 0, 
    beginningBalance: 0, 
    endingBalance: 0, 
    expiredDate: DateTime(0), 
    releasedDate: DateTime(0)
  );

  factory MaterialStockFifo.fromJson(Map<String, Object?> json) => _$MaterialStockFifoFromJson(json);
}
