import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_nie.freezed.dart';
part 'product_nie.g.dart';

@freezed
class ProductNie with _$ProductNie {
  const factory ProductNie({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'start_period', fromJson: isoDateToDateTime)
    required DateTime periodStart,
    @JsonKey(name: 'end_period', fromJson: isoDateToDateTime)
    required DateTime periodEnd,
    required String publisher,
    @JsonKey(name: 'category', fromJson: ProductNieCategory.fromString)
    required ProductNieCategory category,
    @JsonKey(fromJson: Product.fromJson) Product? product,
  }) = _ProductNie;
  const ProductNie._();

  factory ProductNie.fromJson(Map<String, dynamic> json) =>
      _$ProductNieFromJson(json);
}

enum ProductNieCategory implements ColorType {
  empty('', Colors.transparent),
  kosmetik('KOSMETIK', Colors.grey),
  ot('OT', Colors.teal),
  sk('SK', Colors.green),
  obat('OBAT', Colors.blue),
  kuasi('KUASI', Colors.brown),
  alkes('ALKES', Colors.indigo),
  pangan('PANGAN', Colors.orange);

  const ProductNieCategory(this.label, this.color);

  @override
  final String label;

  @override
  final Color color;

  static List<ProductNieCategory> get list => [
        ProductNieCategory.kosmetik,
        ProductNieCategory.ot,
        ProductNieCategory.sk,
        ProductNieCategory.obat,
        ProductNieCategory.kuasi,
        ProductNieCategory.alkes,
        ProductNieCategory.pangan,
      ];

  static ProductNieCategory fromString(String id) {
    if (id == ProductNieCategory.empty.label) {
      return ProductNieCategory.empty;
    }
    if (id == ProductNieCategory.kosmetik.label) {
      return ProductNieCategory.kosmetik;
    }
    if (id == ProductNieCategory.ot.label) {
      return ProductNieCategory.ot;
    }
    if (id == ProductNieCategory.sk.label) {
      return ProductNieCategory.sk;
    }
    if (id == ProductNieCategory.obat.label) {
      return ProductNieCategory.obat;
    }
    if (id == ProductNieCategory.kuasi.label) {
      return ProductNieCategory.kuasi;
    }
    if (id == ProductNieCategory.alkes.label) {
      return ProductNieCategory.alkes;
    }
    if (id == ProductNieCategory.pangan.label) {
      return ProductNieCategory.pangan;
    }
    throw ArgumentError();
  }
}
