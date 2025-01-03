import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive.freezed.dart';
part 'invoice_receive.g.dart';

@freezed
class InvoiceReceive with _$InvoiceReceive {
  factory InvoiceReceive({
    @JsonKey(name: 'invoice_no') required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
    required PurchaseOrder purchaseOrder,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
    required Supplier supplier,
    @JsonKey(name: 'rate') required double rate,
    @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
    required DateTime invoiceDate,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
    required DateTime deliveryOrderDate,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo,
    @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
    required DateTime taxInvoiceDate,
    required int subtotal,
    @JsonKey(name: 'ppn', fromJson: Ppn.fromNum) required Ppn ppn,
    @JsonKey(name: 'pph', fromJson: TaxType.fromPercent) required TaxType pph,
    required double total,
    @JsonKey(name: 'term_of_payment') required int termOfPayment,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
    required bool isApproveHeadAccounting,
    @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
    DateTime? receiveByFinanceAt,
    @JsonKey(
        name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
    DateTime? receiveByServiceAt,
    @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
    DateTime? approveHeadAccountingAt,
  }) = _InvoiceReceive;
  const InvoiceReceive._();

  factory InvoiceReceive.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReceiveFromJson(json);
}

enum Pph implements ColorType {
  empty(0, '0 %', Colors.transparent),
  pph10(10, '10 %', Colors.green),
  pph11(11, '11 %', Colors.blue);

  const Pph(this.id, this.label, this.color);

  final double id;

  @override
  final Color color;

  @override
  final String label;

  static List<Pph> get list => [
        Pph.pph10,
        Pph.pph11,
      ];

  static Pph fromNum(num ppn) {
    if (ppn == Pph.pph10.id) {
      return Pph.pph10;
    }
    if (ppn == Pph.pph11.id) {
      return Pph.pph11;
    }
    return Pph.empty;
  }
}
