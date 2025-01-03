import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petty_cash_detail.freezed.dart';
part 'petty_cash_detail.g.dart';

@freezed
class PettyCashDetail with _$PettyCashDetail {
  const factory PettyCashDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(fromJson: Material.fromJson) required Material material,
    required double quantity,
    required double price,
    @JsonKey(name: 'realization_price') required double realizationPrice,
    @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
    required PettyCash pettyCash,
  }) = _PettyCashDetail;
  const PettyCashDetail._();

  factory PettyCashDetail.fromJson(Map<String, dynamic> json) =>
      _$PettyCashDetailFromJson(json);

  factory PettyCashDetail.empty() => PettyCashDetail(
        id: 0,
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        unit: MaterialUnit.empty(),
        material: Material.empty(),
        quantity: 0,
        price: 0,
        realizationPrice: 0,
        pettyCash: PettyCash.empty(),
      );

  double get subtotal => realizationPrice * quantity;

  PurchaseOrderDetail get toPurchaseOrderDetail =>
      PurchaseOrderDetail.empty().copyWith(
        material: material,
        quantity: quantity,
        price: price,
      );
}
