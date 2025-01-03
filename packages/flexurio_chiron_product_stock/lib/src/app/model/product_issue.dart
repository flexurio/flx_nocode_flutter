import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue.freezed.dart';
part 'product_issue.g.dart';

@freezed
class ProductIssue with _$ProductIssue {
  factory ProductIssue({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
    required DateTime invoiceDate,
    @JsonKey(name: 'remark', defaultValue: '') required String remark,
    @JsonKey(name: 'expedition', defaultValue: '') required String expedition,
    @JsonKey(name: 'shipping_no', defaultValue: '') required String shippingNo,
    @JsonKey(
      name: 'shipment_via',
      fromJson: ProductIssueShipmentVia.fromString,
      defaultValue: ProductIssueShipmentVia.empty,
    )
    required ProductIssueShipmentVia shipmentVia,
    @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
    DateTime? deliveryOrderDate,
    @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
    DateTime? deliveryOrderReceived,
    @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
    DateTime? deliveryDate,
    @JsonKey(name: 'shipping_charge', defaultValue: 0) int? shippingCharge,
    @JsonKey(name: 'package_qty', defaultValue: 0) int? packageQty,
    @JsonKey(name: 'kilogram_qty', defaultValue: 0) int? kilogramQty,
    @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
    DateTime? endPackingDate,
    @JsonKey(name: 'sales_order_id', defaultValue: '') String? salesOrderId,
    @JsonKey(name: 'no_reference_others', defaultValue: '')
    String? noReferenceOthers,
    @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
    DateTime? soInputDate,
  }) = _ProductIssue;
  const ProductIssue._();

  factory ProductIssue.empty() => ProductIssue(
    id: '',
    createdAt: DateTime(0),
    updatedAt: DateTime(0),
    deliveryOrderId: '',
    invoiceId: '',
    invoiceDate: DateTime(0),
    remark: '',
    expedition: '',
    shippingNo: '',
    shipmentVia: ProductIssueShipmentVia.empty,
    shippingCharge: 0,
    packageQty: 0,
    kilogramQty: 0,
    salesOrderId: '',
    noReferenceOthers: '',
  );

  factory ProductIssue.fromJson(Map<String, dynamic> json) =>
      _$ProductIssueFromJson(json);
}

enum ProductIssueShipmentVia implements ColorType {
  empty('', Colors.transparent),
  darat('Darat', Colors.green),
  laut('Laut', Colors.indigo),
  udara('Udara', Colors.lightBlue),
  daratLaut('Darat - Laut', Colors.orange),
  daratUdara('Darat - Udara', Colors.grey);

  const ProductIssueShipmentVia(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<ProductIssueShipmentVia> get list => [
        ProductIssueShipmentVia.darat,
        ProductIssueShipmentVia.laut,
        ProductIssueShipmentVia.udara,
        ProductIssueShipmentVia.daratLaut,
        ProductIssueShipmentVia.daratUdara,
      ];

  static ProductIssueShipmentVia fromString(String id) {
    if (id == ProductIssueShipmentVia.darat.id) {
      return ProductIssueShipmentVia.darat;
    }
    if (id == ProductIssueShipmentVia.laut.id) {
      return ProductIssueShipmentVia.laut;
    }
    if (id == ProductIssueShipmentVia.udara.id) {
      return ProductIssueShipmentVia.udara;
    }
    if (id == ProductIssueShipmentVia.daratLaut.id) {
      return ProductIssueShipmentVia.daratLaut;
    }
    if (id == ProductIssueShipmentVia.daratUdara.id) {
      return ProductIssueShipmentVia.daratUdara;
    }
    return ProductIssueShipmentVia.empty;
  }
}
