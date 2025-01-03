import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_pbf.freezed.dart';
part 'product_return_pbf.g.dart';

@freezed
class ProductReturnPbf with _$ProductReturnPbf {
  factory ProductReturnPbf({
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
required    DateTime deliveryOrderDate,
    @JsonKey(name: 'product_issued_name') required String productIssuedName,
    @JsonKey(name: 'product_issued_qty') required int productIssuedQty,
    @JsonKey(name: 'product_issued_batch') required String productIssuedBatch,
    @JsonKey(name: 'product_return_name') required String productReturnName,
    @JsonKey(name: 'product_return_qty') required int productReturnQty,
    @JsonKey(name: 'product_return_batch') required String productReturnBatch,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
  }) = _ProductReturnPbf;
  const ProductReturnPbf._();

  factory ProductReturnPbf.fromJson(Map<String, dynamic> json) =>
      _$ProductReturnPbfFromJson(json);
}
