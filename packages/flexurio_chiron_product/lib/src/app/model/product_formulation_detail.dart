import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_formulation_detail.freezed.dart';
part 'product_formulation_detail.g.dart';

@freezed
class ProductFormulationDetail with _$ProductFormulationDetail {
  const factory ProductFormulationDetail(
    int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    double quantity,
    @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
    @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
    ProductFormulation formulation,
    // MaterialUnit unit,
  ) = _ProductFormulationDetail;
  const ProductFormulationDetail._();

  factory ProductFormulationDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductFormulationDetailFromJson(json);
}

class ProductFormulationDetailTemporary {
  ProductFormulationDetailTemporary({
    required this.id,
    required this.quantity,
    this.material,
  });

  factory ProductFormulationDetailTemporary.fromProductFormulationDetail(
    ProductFormulationDetail detail,
  ) {
    return ProductFormulationDetailTemporary(
      id: detail.id,
      material: detail.material,
      quantity: detail.quantity,
    );
  }

  ProductFormulationDetailTemporary copyWith({
    required int id,
    Material? material,
    double? quantity,
  }) {
    return ProductFormulationDetailTemporary(
      id: id,
      material: material ?? this.material,
      quantity: quantity ?? this.quantity,
    );
  }

  final int id;
  final Material? material;
  final double quantity;
}
