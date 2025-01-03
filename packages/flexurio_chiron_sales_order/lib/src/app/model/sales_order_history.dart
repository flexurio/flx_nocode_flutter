import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_history.freezed.dart';
part 'sales_order_history.g.dart';

enum SalesOrderHistoryStatus implements ColorType {
  input('INPUT', Colors.orange),
  confirm('CONFIRM', Colors.green),
  printDeliveryOrder('PRINT DELIVERY ORDER', Colors.blue),
  printInvoice('PRINT INVOICE', Colors.redAccent),
  empty('', Colors.transparent);

  const SalesOrderHistoryStatus(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  bool get isInput => this == SalesOrderHistoryStatus.input;

  static SalesOrderHistoryStatus salesOrderStatusFromString(String type) {
    if (type == SalesOrderHistoryStatus.confirm.label) {
      return SalesOrderHistoryStatus.confirm;
    }
    if (type == SalesOrderHistoryStatus.input.label) {
      return SalesOrderHistoryStatus.input;
    }
    if (type == SalesOrderHistoryStatus.printDeliveryOrder.label) {
      return SalesOrderHistoryStatus.printDeliveryOrder;
    }
    if (type == SalesOrderHistoryStatus.printInvoice.label) {
      return SalesOrderHistoryStatus.printInvoice;
    }
    if (type == SalesOrderHistoryStatus.empty.label) {
      return SalesOrderHistoryStatus.empty;
    }
    throw ArgumentError();
  }
}

@freezed
class SalesOrderHistory with _$SalesOrderHistory {
  const factory SalesOrderHistory({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime? updatedAt,
    @JsonKey(name: 'product_issue_id') required String productIssueId,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(
      name: 'status',
      fromJson: SalesOrderHistoryStatus.salesOrderStatusFromString,
    )
    required SalesOrderHistoryStatus status,
    required double subtotal,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'subtotal_after_discount')
    required double subtotalAfterDiscount,
    @JsonKey(name: 'ppn_percent') required double ppnPercent,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    required double total,
    @JsonKey(name: 'exchanged_value') required double exchangedValue,
    @JsonKey(name: 'pph_22_percent') required double pph22Percent,
    @JsonKey(name: 'pph_22_value') required double pph22Value,
    required String description,
    @JsonKey(name: 'bank_fee') required double bankFee,
    @JsonKey(name: 'additional_discount_type')
    required String additionalDiscountType,
    @JsonKey(name: 'additional_discount_percent')
    required double additionalDiscountPercent,
    @JsonKey(name: 'additional_discount_value')
    required double additionalDiscountValue,
    @JsonKey(name: 'special_discount_percent')
    required double specialDiscountPercent,
    @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
    required DateTime? isConfirmAt,
    required bool bonus,
    @JsonKey(name: 'revision_no') required int revisionNo,
    @JsonKey(name: 'is_toll_in') required bool isTollIn,
    @JsonKey(name: 'delivery_order_open_remark')
    String? deliveryOrderOpenRemark,
    @JsonKey(name: 'product_request_id') String? productRequestId,
    @JsonKey(name: 'sales_order_id', fromJson: SalesOrder.fromJson)
    SalesOrder? salesOrder,
  }) = _SalesOrderHistory;
  const SalesOrderHistory._();

  factory SalesOrderHistory.fromJson(Map<String, Object?> json) =>
      _$SalesOrderHistoryFromJson(json);
}
