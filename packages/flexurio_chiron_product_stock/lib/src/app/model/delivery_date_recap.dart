import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_date_recap.freezed.dart';
part 'delivery_date_recap.g.dart';

@freezed
class DeliveryDateRecap with _$DeliveryDateRecap {
  factory DeliveryDateRecap({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) required DateTime createdAt,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime) required DateTime invoiceDate,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime) required DateTime deliveryOrderDate,
    @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime) required DateTime deliveryDate, @JsonKey(name: 'batch_no_id') required String batchNoId, @JsonKey(name: 'qty') required int qty, @JsonKey(name: 'product_name') required String productName, @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime) required DateTime expirationDate, @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable) DateTime? deliveryOrderReceived,
    @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable) DateTime? poInputDate,
    @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable) DateTime? soInputDate,
    @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable) DateTime? endPackingDate,
    @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable) DateTime? shipmentInputDate,
    @JsonKey(name: 'remark') String? remark,
    @JsonKey(name: 'expedition') String? expedition,
    @JsonKey(name: 'customer_id') String? customerId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_city') String? customerCity,
  }) = _DeliveryDateRecap;
  factory DeliveryDateRecap.fromJson(Map<String, dynamic> json) => _$DeliveryDateRecapFromJson(json);

  const DeliveryDateRecap._();
}
