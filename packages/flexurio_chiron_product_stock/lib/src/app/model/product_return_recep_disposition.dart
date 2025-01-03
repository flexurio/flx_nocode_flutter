import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_recep_disposition.freezed.dart';
part 'product_return_recep_disposition.g.dart';

@freezed
class ProductReturnRecapDisposition with _$ProductReturnRecapDisposition {
  factory ProductReturnRecapDisposition({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'quantity') required double quantity,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'quality_assurance_check_by_id')
    required int qualityAssuranceCheckById,
    @JsonKey(name: 'quality_assurance_check_date')
    required DateTime qualityAssuranceCheckDate,
    @JsonKey(name: 'quantity_warehouse_return')
    required double quantityWarehouseReturn,
    @JsonKey(name: 'quantity_warehouse_remaining')
    required double quantityWarehouseRemaining,
    @JsonKey(name: 'quantity_out_return') required double quantityOutReturn,
    @JsonKey(name: 'quantity_out_remaining')
    required double quantityOutRemaining,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
    required DateTime? deliveryOrderDate,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'product_id', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
    required ProductReturn productReturn,
    @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
    required DateTime? confirmPpicAt,
    @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
    required DateTime? productIssueDate,
  }) = _ProductReturnRecapDisposition;

  factory ProductReturnRecapDisposition.empty() {
    return ProductReturnRecapDisposition(
      id: 0,
      createdById: 0,
      updatedById: 0,
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
      batchNo: '',
      status: '',
      quantity: 0,
      description: '',
      qualityAssuranceCheckById: 0,
      qualityAssuranceCheckDate: DateTime(0),
      quantityWarehouseReturn: 0,
      quantityWarehouseRemaining: 0,
      quantityOutReturn: 0,
      quantityOutRemaining: 0,
      deliveryOrderId: '',
      deliveryOrderDate: DateTime(0),
      unitId: '',
      product: Product.empty(),
      productReturn: ProductReturn.empty(),
      confirmPpicAt: DateTime(0),
      productIssueDate: DateTime(0),
    );
  }
  const ProductReturnRecapDisposition._();

  factory ProductReturnRecapDisposition.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnRecapDispositionFromJson(json);

  int get leadTimePpicInMinutes =>
      createdAt.difference(confirmPpicAt ?? createdAt).inMinutes;
}
