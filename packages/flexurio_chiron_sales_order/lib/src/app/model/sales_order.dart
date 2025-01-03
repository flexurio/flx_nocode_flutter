import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order.freezed.dart';
part 'sales_order.g.dart';

enum SalesOrderStatus implements ColorType {
  input('INPUT', Colors.orange),
  confirm('CONFIRM', Colors.green),
  printDeliveryOrder('PRINT DELIVERY ORDER', Colors.blue),
  printInvoice('PRINT INVOICE', Colors.redAccent),
  empty('', Colors.transparent);

  const SalesOrderStatus(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  bool get isInput => this == SalesOrderStatus.input;

  static List<SalesOrderStatus> get list => [
        SalesOrderStatus.input,
        SalesOrderStatus.confirm,
        SalesOrderStatus.printDeliveryOrder,
        SalesOrderStatus.printInvoice,
      ];

  static List<SalesOrderStatus> get listProductRequestOther => [
        SalesOrderStatus.input,
        SalesOrderStatus.confirm,
        SalesOrderStatus.printDeliveryOrder,
      ];

  static SalesOrderStatus salesOrderStatusFromString(String type) {
    if (type == SalesOrderStatus.confirm.label) {
      return SalesOrderStatus.confirm;
    }
    if (type == SalesOrderStatus.input.label) {
      return SalesOrderStatus.input;
    }
    if (type == SalesOrderStatus.printDeliveryOrder.label) {
      return SalesOrderStatus.printDeliveryOrder;
    }
    if (type == SalesOrderStatus.printInvoice.label) {
      return SalesOrderStatus.printInvoice;
    }
    if (type == SalesOrderStatus.empty.label) {
      return SalesOrderStatus.empty;
    }
    throw ArgumentError();
  }
}

@freezed
class SalesOrder with _$SalesOrder {
  const factory SalesOrder({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    required String id,
    @JsonKey(name: 'product_issue_id') required String productIssueId,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(
      name: 'status',
      fromJson: SalesOrderStatus.salesOrderStatusFromString,
    )
    required SalesOrderStatus status,
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
    @JsonKey(name: 'tax_base_ppn', defaultValue: 0) required double taxBasePpn,
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
    @JsonKey(name: 'is_toll_in', defaultValue: false) required bool isTollIn,
    @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
    required DateTime? isConfirmAt,
    required bool bonus,
    @JsonKey(name: 'revision_no', defaultValue: 0) required int revisionNo,
    @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
    ProductRequest? productRequest,
    @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
    DateTime? deliveryDate,
    @JsonKey(name: 'delivery_order_open_remark')
    String? deliveryOrderOpenRemark,
  }) = _SalesOrder;
  const SalesOrder._();

  factory SalesOrder.empty() {
    return SalesOrder(
      taxBasePpn: 0,
      isTollIn: false,
      isConfirmAt: null,
      revisionNo: 0,
      bonus: false,
      additionalDiscountType: '',
      additionalDiscountPercent: 0.0,
      additionalDiscountValue: 0.0,
      specialDiscountPercent: 0.0,
      bankFee: 0.0,
      status: SalesOrderStatus.empty,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: '',
      productIssueId: '',
      deliveryOrderId: '',
      invoiceId: '',
      createdById: 0,
      updatedById: 0,
      subtotal: 0.0,
      discountPercent: 0.0,
      discountValue: 0.0,
      subtotalAfterDiscount: 0.0,
      ppnPercent: 0.0,
      ppnValue: 0.0,
      total: 0.0,
      exchangedValue: 0.0,
      pph22Percent: 0.0,
      pph22Value: 0.0,
      description: '',
    );
  }

  factory SalesOrder.fromJson(Map<String, Object?> json) =>
      _$SalesOrderFromJson(json);
}

class SalesOrderHeaderInitial {
  SalesOrderHeaderInitial({
    this.salesOrderId,
    this.salesOrderDate,
    this.deliveryOrder,
    this.deliveryOrderDate,
    this.currency,
    this.deliveryOrderRemark,
    this.department,
    this.customer,
    this.productType,
    this.termOfPayment,
    this.productRequestId,
    this.productIssue,
    this.invoice,
    this.transactionType,
    this.orderType,
    this.deliveryAddress,
    this.rate,
    this.subtotal,
    this.discountMargin,
    this.discount,
    this.valueDiscount,
    this.subtotalAfterDiscount,
    this.additionDiscount,
    this.valueAdditionDiscount,
    this.ppn,
    this.valuePpn,
    this.total,
    this.totalExchange,
    this.pph22,
    this.valuePph22,
    this.revisionNo,
    this.description,
  });

  final String? salesOrderId;
  final DateTime? salesOrderDate;
  final String? deliveryOrder;
  final DateTime? deliveryOrderDate;
  final Currency? currency;
  final String? deliveryOrderRemark;
  final Department? department;
  final Customer? customer;
  final String? productType;
  final int? termOfPayment;
  final ProductRequest? productRequestId;
  final String? productIssue;
  final String? invoice;
  final TransactionType? transactionType;
  final TransactionType? orderType;
  final Customer? deliveryAddress;
  final double? rate;
  final double? subtotal;
  final double? discountMargin;
  final double? discount;
  final double? valueDiscount;
  final double? subtotalAfterDiscount;
  final double? additionDiscount;
  final double? valueAdditionDiscount;
  final double? ppn;
  final double? valuePpn;
  final double? total;
  final double? totalExchange;
  final double? pph22;
  final double? valuePph22;
  final int? revisionNo;
  final String? description;
}
