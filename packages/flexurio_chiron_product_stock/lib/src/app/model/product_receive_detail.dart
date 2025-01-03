import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_detail.freezed.dart';
part 'product_receive_detail.g.dart';

@freezed
class ProductReceiveDetail with _$ProductReceiveDetail {
  factory ProductReceiveDetail({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'expired_date') required DateTime expiredDate,
    @JsonKey(name: 'qty') required int quantity,
    @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
    required ProductReceive productReceive,
    @JsonKey(fromJson: Warehouse.fromString) required Warehouse warehouse,
    @JsonKey(fromJson: MaterialUnit.fromJson) required MaterialUnit unit,
    @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
    required ProductReceiveDetailStatus status,
    @JsonKey(name: 'product', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
    required ProductionOrder productionOrder,
    @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
    DateTime? releaseAt,
    @JsonKey(name: 'release_by_id') int? releaseById,
  }) = _ProductReceiveDetail;
  factory ProductReceiveDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductReceiveDetailFromJson(json);

  const ProductReceiveDetail._();
}

enum ProductReceiveDetailStatus implements ColorType {
  empty('', '', Colors.transparent),
  reject('REJECT', 'Reject', Colors.red),
  quarantine('KARANTINA', 'Quarantine', Colors.orange),
  release('RELEASE', 'Release', Colors.green);

  static List<ProductReceiveDetailStatus> get list => [
        ProductReceiveDetailStatus.reject,
        ProductReceiveDetailStatus.release,
        ProductReceiveDetailStatus.quarantine,
      ];

  final String id;

  @override
  final String label;

  @override
  final Color color;

  const ProductReceiveDetailStatus(this.id, this.label, this.color);

  static ProductReceiveDetailStatus fromString(String id) {
    if (id == ProductReceiveDetailStatus.reject.id) {
      return ProductReceiveDetailStatus.reject;
    }
    if (id == ProductReceiveDetailStatus.release.id) {
      return ProductReceiveDetailStatus.release;
    }
    if (id == ProductReceiveDetailStatus.quarantine.id) {
      return ProductReceiveDetailStatus.quarantine;
    }
    if (id == ProductReceiveDetailStatus.empty.id) {
      return ProductReceiveDetailStatus.empty;
    }
    throw ArgumentError();
  }
}
