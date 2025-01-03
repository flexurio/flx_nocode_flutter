import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_malk_summary.freezed.dart';
part 'sales_order_malk_summary.g.dart';

@freezed
class SalesOrderMalkSummary with _$SalesOrderMalkSummary {
  const factory SalesOrderMalkSummary({
    @JsonKey(name: 'sales_order_id') required String salesOrderId,
    @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime) required DateTime salesOrderDate,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'product_type') required String productType,
    @JsonKey(name: 'purchase_order_distributor') required String purchaseOrderDistributor,
    @JsonKey(name: 'batch_no_id') required String batchNoId,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime) required DateTime expiredDate,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    @JsonKey(name: 'customer_delivery_address') required String customerDeliveryAddress,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required int qty,
    @JsonKey(name: 'qty_delivery') required int qtyDelivery,
    @JsonKey(name: 'unit_id') required String unitId,
    required int price,
    @JsonKey(name: 'product_discount_percent') required int productDiscountPercent,
    @JsonKey(name: 'additional_discount_percent') required int additionalDiscountPercent,
    @JsonKey(name: 'value_sales_order') required int valueSalesOrder,
    @JsonKey(name: 'value_realization') required int valueRealization,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime) required DateTime deliveryOrderDate,
  }) = _SalesOrderMalkSummary;
  const SalesOrderMalkSummary._();

  factory SalesOrderMalkSummary.empty() => SalesOrderMalkSummary(
    productType: '', 
    purchaseOrderDistributor: '', 
    salesOrderId: '', 
    salesOrderDate: DateTime(0), 
    customerId: '', 
    customerName: '', 
    productId: '', 
    productName: '', 
    unitId: '', 
    valueSalesOrder: 0, 
    valueRealization: 0, 
    description: '', 
    batchNoId: '', 
    expiredDate: DateTime(0), 
    customerDeliveryAddress: '', 
    qty: 0, 
    qtyDelivery: 0, 
    price: 0, 
    deliveryOrderDate: DateTime(0), 
    productDiscountPercent: 0, 
    additionalDiscountPercent: 0,
  );
  factory SalesOrderMalkSummary.fromJson(Map<String, dynamic> json) => _$SalesOrderMalkSummaryFromJson(json);
}
