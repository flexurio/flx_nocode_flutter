import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_stock.freezed.dart';
part 'recap_product_stock.g.dart';

enum RecapProductStockWarehouse implements ColorType {
  empty('', Colors.transparent),
  ppic('PPIC', Colors.blueGrey),
  ruahan('RUAHAN', Colors.teal),
  produkJadi('PRODUK JADI', Colors.blue),
  alkes('ALKES', Colors.green);

  const RecapProductStockWarehouse(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static RecapProductStockWarehouse fromString(String id) {
    if (id == RecapProductStockWarehouse.ppic.id) {
      return RecapProductStockWarehouse.ppic;
    }
    if (id == RecapProductStockWarehouse.alkes.id) {
      return RecapProductStockWarehouse.alkes;
    }
    if (id == RecapProductStockWarehouse.ruahan.id) {
      return RecapProductStockWarehouse.ruahan;
    }
    if (id == RecapProductStockWarehouse.produkJadi.id) {
      return RecapProductStockWarehouse.produkJadi;
    }
    return RecapProductStockWarehouse.empty;
  }
}

@freezed
class RecapProductStock with _$RecapProductStock {
  factory RecapProductStock(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(
      name: 'period',
      fromJson: periodFromJson,
    )
    DateTime period,
    @JsonKey(name: 'qty_quarantine') int qtyQuarantine,
    @JsonKey(name: 'qty_release') int qtyRelease,
    @JsonKey(name: 'qty_reject') int qtyReject,
    @JsonKey(name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
    RecapProductStockWarehouse warehouse,
    @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
    ProductGroup productGroup,
    Product product,
    @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
    ProductionOrder productionOrder,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
  ) = _RecapProductStock;
  const RecapProductStock._();

  factory RecapProductStock.fromJson(Map<String, dynamic> json) =>
      _$RecapProductStockFromJson(json);
}
