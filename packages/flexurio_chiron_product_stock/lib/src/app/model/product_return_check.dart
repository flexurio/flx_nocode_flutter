import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_check.freezed.dart';
part 'product_return_check.g.dart';

@freezed
class ProductReturnCheck with _$ProductReturnCheck {
  factory ProductReturnCheck({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson) required ProductReturn productReturnId,
    @JsonKey(name: 'product_id',fromJson: Product.fromJson) required Product productId,
    @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson) required ProductionOrder batch,
    @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson) required MaterialUnit unitId,
    required int quantity,
    required String description,
    @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
    required ProductReturnCheckStatus status,
    @JsonKey(name: 'quantity_warehouse_return') required int qtyWarehouseReturn,
    @JsonKey(name: 'quantity_warehouse_remaining')
    required int qtyWarehouseRemaining,
    @JsonKey(name: 'quantity_out_return') required int qtyOutReturn,
    @JsonKey(name: 'quantity_out_remaining') required int qtyOutRemaining,
    @JsonKey(name: 'quality_assurance_check_by_id')
    required int qualityCheckById,
    @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
    required DateTime qualityCheckDate,
  }) = _ProductReturnCheck;

  factory ProductReturnCheck.empty() => ProductReturnCheck(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productReturnId: ProductReturn.empty(),
        productId: Product.empty(),
        batch: ProductionOrder.empty(),
        unitId: MaterialUnit.empty(),
        quantity: 0,
        description: '',
        status: ProductReturnCheckStatus.empty,
        qtyWarehouseReturn: 0,
        qtyWarehouseRemaining: 0,
        qtyOutReturn: 0,
        qtyOutRemaining: 0,
        qualityCheckById: 0,
        qualityCheckDate: DateTime.now(),
      );
  const ProductReturnCheck._();

  factory ProductReturnCheck.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnCheckFromJson(json);
}

enum ProductReturnCheckStatus implements ColorType {
  empty('', Colors.transparent),
  shouldNotReturn('MUSNAHKAN', Colors.red),
  qcCheck('CHECK QC', Colors.orange),
  releaseToClinic('RELEASE KLINIK', Colors.green),
  releaseToLab('RELEASE GOJ', Colors.blue);

  const ProductReturnCheckStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<ProductReturnCheckStatus> get list =>
      values.where((e) => e != empty).toList();

  static ProductReturnCheckStatus fromString(String id) {
    for (final type in list) {
      if (type.id == id) {
        return type;
      }
    }
    return ProductReturnCheckStatus.empty;
  }
}
