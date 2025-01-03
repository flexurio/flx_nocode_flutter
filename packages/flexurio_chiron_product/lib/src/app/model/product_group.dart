import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_group.freezed.dart';
part 'product_group.g.dart';

@freezed
class ProductGroup with _$ProductGroup {
  factory ProductGroup(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_by_id') int updatedById,
    String id,
  ) = _ProductGroup;
  const ProductGroup._();

  factory ProductGroup.empty() {
    return ProductGroup(
      DateTime(0),
      DateTime(0),
      0,
      0,
      '',
    );
  }

  factory ProductGroup.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupFromJson(json);
}
