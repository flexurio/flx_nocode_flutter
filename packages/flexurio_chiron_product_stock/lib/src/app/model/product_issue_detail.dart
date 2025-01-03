import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_detail.freezed.dart';
part 'product_issue_detail.g.dart';

@freezed
class ProductIssueDetail with _$ProductIssueDetail {
  factory ProductIssueDetail(
    int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    int qty,
    int price,
    @JsonKey(name: 'subtotal') int subTotal,
    @JsonKey(name: 'product_price') int productPrice,
    @JsonKey(name: 'total_product_price') int totalProductPrice,
    String warehouse,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
    @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
    ProductionOrder productionOrder,
    @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
    @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
    ProductIssue productIssue,
  ) = _ProductIssueDetail;
  const ProductIssueDetail._();

  factory ProductIssueDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductIssueDetailFromJson(json);
}
