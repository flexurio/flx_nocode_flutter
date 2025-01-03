import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_outstanding_product.freezed.dart';
part 'purchase_order_outstanding_product.g.dart';

@freezed
class PurchaseOrderOutstandingProduct with _$PurchaseOrderOutstandingProduct {
  const factory PurchaseOrderOutstandingProduct({
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime) required DateTime purchaseOrderDate,
    @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime) required DateTime dateOfNeed,
    @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime) required DateTime materialRequestDueDate,
    @JsonKey(name: 'material_request_id') required String materialRequestId,
    @JsonKey(name: 'quantity_po') required int quantityPo,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'period_material_request') required String periodMaterialRequest,
    @JsonKey(name: 'product_status_qc') required String productStatusQc,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    required String divisi,
  }) = _PurchaseOrderOutstandingProduct;

  factory PurchaseOrderOutstandingProduct.fromJson(Map<String, dynamic> json) => _$PurchaseOrderOutstandingProductFromJson(json);
}