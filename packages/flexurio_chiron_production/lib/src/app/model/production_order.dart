import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_order.freezed.dart';
part 'production_order.g.dart';

enum ProductionProductStatus implements ColorType {
  empty('', '', Colors.transparent),
  processValidation('VALIDASI PROSES', 'Process Validation', Colors.deepOrange),
  regular('REGULER', 'Regular', Colors.pinkAccent),
  pilotScale('SKALA PILOT', 'Pilot Scale', Colors.green),
  pilotValidationProcessScale(
    'SKALA PILOT-VALIDASI PROSES',
    'Pilot Validation Process Scale',
    Colors.blueGrey,
  ),
  observation('OBSERVASI', 'Observation', Colors.blue);

  const ProductionProductStatus(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<ProductionProductStatus> get list => [
        ProductionProductStatus.processValidation,
        ProductionProductStatus.regular,
        ProductionProductStatus.pilotScale,
        ProductionProductStatus.pilotValidationProcessScale,
        ProductionProductStatus.observation,
      ];

  static ProductionProductStatus fromString(String id) {
    if (id == ProductionProductStatus.processValidation.id) {
      return ProductionProductStatus.processValidation;
    }
    if (id == ProductionProductStatus.regular.id) {
      return ProductionProductStatus.regular;
    }
    if (id == ProductionProductStatus.pilotScale.id) {
      return ProductionProductStatus.pilotScale;
    }
    if (id == ProductionProductStatus.pilotValidationProcessScale.id) {
      return ProductionProductStatus.pilotValidationProcessScale;
    }
    if (id == ProductionProductStatus.observation.id) {
      return ProductionProductStatus.observation;
    }

    return ProductionProductStatus.empty;
  }
}

enum ProductionProductScale implements ColorType {
  empty('-', '-', Colors.transparent),
  production('PRODUKSI', 'Production', Colors.blue),
  tollOut('TOLL-OUT', 'Toll-Out', Colors.purple),
  pilot('PILOT', 'Pilot', Colors.orange),
  reguler('REGULER', 'Reguler', Colors.green),
  pilotTollOut('PILOT TOLL-OUT', 'Pilot Toll-Out', Colors.orange);

  const ProductionProductScale(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<ProductionProductScale> get list => [
        ProductionProductScale.production,
        ProductionProductScale.tollOut,
        ProductionProductScale.pilot,
        ProductionProductScale.pilotTollOut,
      ];

  static ProductionProductScale fromString(String id) {
    final idUpperCase = id;
    if (idUpperCase == ProductionProductScale.production.id) {
      return ProductionProductScale.production;
    }
    if (idUpperCase == ProductionProductScale.tollOut.id) {
      return ProductionProductScale.tollOut;
    }
    if (idUpperCase == ProductionProductScale.pilot.id) {
      return ProductionProductScale.pilot;
    }
    if (idUpperCase == ProductionProductScale.pilotTollOut.id) {
      return ProductionProductScale.pilotTollOut;
    }
    if (idUpperCase == ProductionProductScale.reguler.id) {
      return ProductionProductScale.reguler;
    }
    return ProductionProductScale.empty;
  }
}

@freezed
class ProductionOrder with _$ProductionOrder {
  factory ProductionOrder(
    @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updatedById,
    @JsonKey(name: 'is_process', defaultValue: true) bool isProcess,
    @JsonKey(name: 'batch_size', defaultValue: 0) int batchSize,
    @JsonKey(name: 'is_cancel', defaultValue: false) bool isCancel,
    @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
    @JsonKey(defaultValue: '') String description,
    @JsonKey(name: 'is_rework', defaultValue: true) bool isRework,
    @JsonKey(name: 'is_toll_in', defaultValue: false) bool isTollIn,
    @JsonKey(name: 'is_bulk', defaultValue: true) bool isRuahan,
    @JsonKey(
      name: 'product_status',
      defaultValue: ProductionProductStatus.empty,
      fromJson: ProductionProductStatus.fromString,
    )
    ProductionProductStatus productStatus,
    @JsonKey(
      fromJson: ProductionProductScale.fromString,
      defaultValue: ProductionProductScale.empty,
    )
    ProductionProductScale scale,
    @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
    DateTime expirationDate,
    String id,
    @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
    DateTime? cancelReworkAt,
    String? nie,
  ) = _ProductionOrder;
  const ProductionOrder._();

  factory ProductionOrder.empty() {
    return ProductionOrder(
      Product.empty(),
      DateTime(0),
      0,
      DateTime(0),
      0,
      false,
      0,
      false,
      false,
      '',
      false,
      false,
      false,
      ProductionProductStatus.empty,
      ProductionProductScale.empty,
      DateTime(0),
      '',
      DateTime(0),
      '',
    );
  }

  factory ProductionOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductionOrderFromJson(json);
}
