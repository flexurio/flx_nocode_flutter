import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_requests_recap_global.freezed.dart';
part 'pending_requests_recap_global.g.dart';

@freezed
class PendingRequestsRecapGlobal with _$PendingRequestsRecapGlobal {
  const factory PendingRequestsRecapGlobal({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'quantity_remaining') required int quantityRemaining,
    @JsonKey(name: 'quantity_stock') required int quantityStock,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'quantity_remaining_product') int? quantityRemainingProduct,
    @JsonKey(name: 'total_price_product') int? totalPriceProduct,
    @JsonKey(name: 'quantity_remaining_summary') required int quantityRemainingSummary,
    @JsonKey(name: 'total_price_summary') required int totalPriceSummary,
  }) = _PendingRequestsRecapGlobal;
  const PendingRequestsRecapGlobal._();

  factory PendingRequestsRecapGlobal.empty() => PendingRequestsRecapGlobal(
    productId: '', 
    productName: '', 
    customerName: '', 
    customerId: '', 
    quantityRemaining: 0, 
    quantityStock: 0, 
    totalPrice: 0, 
    quantityRemainingSummary: 0, 
    totalPriceSummary: 0,
  );
  factory PendingRequestsRecapGlobal.fromJson(Map<String, dynamic> json) => _$PendingRequestsRecapGlobalFromJson(json);
}
