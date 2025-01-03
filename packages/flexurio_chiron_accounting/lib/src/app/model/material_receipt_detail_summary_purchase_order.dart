import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receipt_detail_summary_purchase_order.freezed.dart';
part 'material_receipt_detail_summary_purchase_order.g.dart';

@freezed
class MaterialReceiptDetailSummaryPurchaseOrder with _$MaterialReceiptDetailSummaryPurchaseOrder {
  const factory MaterialReceiptDetailSummaryPurchaseOrder({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime) required DateTime transactionName,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'purchase_order_currency_id') required String purchaseOrderCurrencyId,
    @JsonKey(name: 'purchase_order_rate') required int purchaseOrderRate,
    @JsonKey(name: 'quantity_po') required int quantityPo,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'quantity_received') required int quantityReceived,
    @JsonKey(name: 'material_received_unit_id') required String materialReceivedUnitId,
    @JsonKey(name: 'total') required int total, @JsonKey(name: 'material_received_price') int? materialReceivedPrice,
  }) = _MaterialReceiptDetailSummaryPurchaseOrder;
  const MaterialReceiptDetailSummaryPurchaseOrder._();

  factory MaterialReceiptDetailSummaryPurchaseOrder.empty() => MaterialReceiptDetailSummaryPurchaseOrder(
    transactionId: '', 
    transactionName: DateTime(0), 
    supplierName: '', 
    materialName: '', 
    purchaseOrderId: '', 
    purchaseOrderCurrencyId: '', 
    purchaseOrderRate: 0, 
    quantityPo: 0, 
    materialUnitId: '', 
    quantityReceived: 0, 
    materialReceivedUnitId: '', 
    materialReceivedPrice: 0,
    total: 0, 
    price: 0,
  );
  factory MaterialReceiptDetailSummaryPurchaseOrder.fromJson(Map<String, dynamic> json) => _$MaterialReceiptDetailSummaryPurchaseOrderFromJson(json);
}
