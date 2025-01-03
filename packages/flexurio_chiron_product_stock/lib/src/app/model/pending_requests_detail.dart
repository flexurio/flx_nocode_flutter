import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_detail.freezed.dart';
part 'pending_requests_detail.g.dart';

@freezed
class PendingRequestsDetail with _$PendingRequestsDetail {
  const factory PendingRequestsDetail({
    @JsonKey(name: 'ProductRequestId') required String productRequestId,
    @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime) required DateTime productRequestDate,
    @JsonKey(name: 'department_id') required String departmentId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'total_product_request_price') required int totalProductRequestPrice,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'sales_order_id') String? salesOrderId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_id') required String customerId,
  }) = _PendingRequestsDetail;
  const PendingRequestsDetail._();

  factory PendingRequestsDetail.empty() => PendingRequestsDetail(
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
  );
  factory PendingRequestsDetail.fromJson(Map<String, dynamic> json) => _$PendingRequestsDetailFromJson(json);
}
