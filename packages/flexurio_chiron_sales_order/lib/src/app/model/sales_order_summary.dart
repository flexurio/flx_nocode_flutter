import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_summary.freezed.dart';
part 'sales_order_summary.g.dart';

@freezed
class SalesOrderSummary with _$SalesOrderSummary {
  const factory SalesOrderSummary({
    @JsonKey(name: 'product_type') required String productType,
    @JsonKey(name: 'purchase_order_distributor') required String purchaseOrderDistributor,
    @JsonKey(name: 'sales_order_id') required String salesOrderId,
    @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime) required DateTime salesOrderDate,
    @JsonKey(name: 'batch_no_id') String? batchNoId,
    @JsonKey(name: 'expired_date', fromJson: dateTimeNullable) DateTime? expiredDate,
    @JsonKey(name: 'delivery_order_received') String? deliveryOrderReceived,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'sales_order_quantity') required int salesOrderQuantity,
    @JsonKey(name: 'sales_order_quantity_delivery') required int salesOrderQuantityDelivery,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'product_price') required int productPrice,
    @JsonKey(name: 'value_sales_order') required int valueSalesOrder,
    @JsonKey(name: 'value_realization') required int valueRealization,
  }) = _SalesOrderSummary;
  const SalesOrderSummary._();

  factory SalesOrderSummary.empty() => SalesOrderSummary(
    productType: '', 
    purchaseOrderDistributor: '', 
    salesOrderId: '', 
    salesOrderDate: DateTime(0), 
    customerId: '', 
    customerName: '', 
    productId: '', 
    productName: '', 
    salesOrderQuantity: 0, 
    salesOrderQuantityDelivery: 0, 
    unitId: '', 
    productPrice: 0, 
    valueSalesOrder: 0, 
    valueRealization: 0,
  );
  factory SalesOrderSummary.fromJson(Map<String, dynamic> json) => _$SalesOrderSummaryFromJson(json);
}
