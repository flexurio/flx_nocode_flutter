import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_formulation.freezed.dart';
part 'product_formulation.g.dart';

enum ProductFormulationType {
  baku('BAKU', 'BAKU'),
  bantu('BANTU', 'BANTU'),
  kemasan('KEMASAN', 'KEMASAN'),
  coating('COATING', 'BANTU'),
  materialRnD('MATERIAL R&D', 'MATERIAL R&D'),
  isEmpty('', '');

  const ProductFormulationType(this.productFormulationType, this.label);
  final String productFormulationType;
  final String label;
}

enum ProductFormulationScale {
  produksi('PRODUKSI'),
  tollOut('TOLL OUT'),
  pilot('PILOT'),
  pilotTollOut('PILOT TOLL OUT'),
  isEmpty('');

  const ProductFormulationScale(this.productFormulationScale);
  final String productFormulationScale;
}

@freezed
class ProductFormulation with _$ProductFormulation {
  const factory ProductFormulation(
    int id,
    String? description,
    String? name,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(fromJson: _typeFromString) ProductFormulationType type,
    double quantity,
    @JsonKey(fromJson: _scaleFromString) ProductFormulationScale scale,
    @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
    @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
    Product product,
    String unit,
  ) = _ProductFormulation;
  const ProductFormulation._();

  factory ProductFormulation.empty() => ProductFormulation(
        0,
        '',
        '',
        DateTime.now(),
        DateTime.now(),
        ProductFormulationType.isEmpty,
        0,
        ProductFormulationScale.isEmpty,
        false,
        false,
        Product.empty(),
        '',
      );

  factory ProductFormulation.fromJson(Map<String, Object?> json) =>
      _$ProductFormulationFromJson(json);
}

ProductFormulationScale _scaleFromString(String scale) {
  if (scale == ProductFormulationScale.produksi.productFormulationScale) {
    return ProductFormulationScale.produksi;
  } else if (scale == ProductFormulationScale.tollOut.productFormulationScale) {
    return ProductFormulationScale.tollOut;
  } else if (scale == ProductFormulationScale.pilot.productFormulationScale) {
    return ProductFormulationScale.pilot;
  } else if (scale ==
      ProductFormulationScale.pilotTollOut.productFormulationScale) {
    return ProductFormulationScale.pilotTollOut;
  }
  return ProductFormulationScale.isEmpty;
}

ProductFormulationType _typeFromString(String type) {
  if (type == ProductFormulationType.baku.productFormulationType) {
    return ProductFormulationType.baku;
  } else if (type == ProductFormulationType.bantu.productFormulationType) {
    return ProductFormulationType.bantu;
  } else if (type == ProductFormulationType.kemasan.productFormulationType) {
    return ProductFormulationType.kemasan;
  } else if (type == ProductFormulationType.coating.productFormulationType) {
    return ProductFormulationType.coating;
  } else if (type == ProductFormulationType.materialRnD.productFormulationType) {
    return ProductFormulationType.materialRnD;
  }
  return ProductFormulationType.isEmpty;
}
