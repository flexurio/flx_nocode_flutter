import 'package:equatable/equatable.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock.freezed.dart';
part 'material_stock.g.dart';

@freezed
class MaterialStock extends Equatable with _$MaterialStock {
  const factory MaterialStock({
    required int id,
    required String period,
    required String na,
    @JsonKey(name: 'quantity_in') required double quantityIn,
    @JsonKey(name: 'quantity_out') required double quantityOut,
    @JsonKey(name: 'beginning_balance') required double beginningBalance,
    @JsonKey(name: 'ending_balance') required double endingBalance,
    required Material material,
    @JsonKey(name: 'material_group') required MaterialGroup materialGroup,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _MaterialStock;

  const MaterialStock._();

  factory MaterialStock.empty() => MaterialStock(
        na: '',
        endingBalance: 0,
        id: 0,
        period: '',
        quantityIn: 0,
        quantityOut: 0,
        beginningBalance: 0,
        material: Material.empty(),
        materialGroup: MaterialGroup.empty(),
        updatedById: 0,
        createdById: 0,
        expiredDate: DateTime(0),
        createdAt: DateTime(0),
        updatedAt: DateTime(0),
      );

  factory MaterialStock.fromJson(Map<String, Object?> json) =>
      _$MaterialStockFromJson(json);

  @override
  List<Object?> get props => [material.name];
}
