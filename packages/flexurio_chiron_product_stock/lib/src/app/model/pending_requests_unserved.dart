import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_unserved.freezed.dart';
part 'pending_requests_unserved.g.dart';

@freezed
class PendingRequestsUnserved with _$PendingRequestsUnserved {
  const factory PendingRequestsUnserved({
    @JsonKey(name: 'ProductRequestId') required String productRequestId,
    @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime) required DateTime productRequestDate,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'total_product_request_price') required int totalProductRequestPrice,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'initial_sales_order_id') String? initialSalesOrderId,
    @JsonKey(name: 'final_sales_order_id') String? finalSalesOrderId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'purchase_order_distributor') required String purchaseOrderDistributor,
    @JsonKey(name: 'type_product') required String typeProduct,
    @JsonKey(name: 'product_price') required int productPrice,
    @JsonKey(name: 'product_request_quantity') required int productRequestQuantity,
    @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable) DateTime? initialSalesOrderate,
    @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable) DateTime? finalSalesOrderDate,
  }) = _PendingRequestsUnserved;
  const PendingRequestsUnserved._();

  factory PendingRequestsUnserved.empty() => PendingRequestsUnserved(
    productRequestId: '', 
    productRequestDate: DateTime(0), 
    departmentId: '', 
    productId: '', 
    productName: '', 
    unitId: '', 
    totalProductRequestPrice: 0, 
    quantityRemaining: 0, 
    customerName: '', 
    customerId: '', 
    purchaseOrderDistributor: '', 
    typeProduct: '', 
    productPrice: 0, 
    productRequestQuantity: 0,
  );
  factory PendingRequestsUnserved.fromJson(Map<String, dynamic> json) => _$PendingRequestsUnservedFromJson(json);
}
