import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_recap.freezed.dart';
part 'pending_requests_recap.g.dart';

@freezed
class PendingRequestsRecap with _$PendingRequestsRecap {
  const factory PendingRequestsRecap({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'total_product_request_price') required int totalProductRequestPrice,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'product_stock_quantity_remaining') required int productStockQuantityRemaining,
  }) = _PendingRequestsRecap;
  const PendingRequestsRecap._();

  factory PendingRequestsRecap.empty() => const PendingRequestsRecap(
    productId: '', 
    productName: '', 
    unitId: '', 
    totalProductRequestPrice: 0, 
    quantityRemaining: 0, 
    productStockQuantityRemaining: 0,
  );
  factory PendingRequestsRecap.fromJson(Map<String, dynamic> json) => _$PendingRequestsRecapFromJson(json);
}
