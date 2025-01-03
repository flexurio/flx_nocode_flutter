import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request.freezed.dart';
part 'product_request.g.dart';

enum ProductRequestStatus implements ColorType {
  input('INPUT', Colors.grey),
  notYet('-', Colors.grey),
  empty('', Colors.grey),
  confirm('CONFIRM', Colors.lightBlueAccent),
  pending('PENDING', Colors.orange),
  reject('CLOSE', Colors.green);

  const ProductRequestStatus(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  bool get isInput => this == ProductRequestStatus.input;
  bool get isConfirm => this == ProductRequestStatus.confirm;
  bool get isPending => this == ProductRequestStatus.pending;
  bool get isReject => this == ProductRequestStatus.reject;

  static ProductRequestStatus productRequestStatusFromString(String type) {
    if (type == ProductRequestStatus.confirm.label) {
      return ProductRequestStatus.confirm;
    }
    if (type == ProductRequestStatus.input.label) {
      return ProductRequestStatus.input;
    }
    if (type == ProductRequestStatus.reject.label) {
      return ProductRequestStatus.reject;
    }
    if (type == ProductRequestStatus.pending.label) {
      return ProductRequestStatus.pending;
    }
    if (type == ProductRequestStatus.notYet.label) {
      return ProductRequestStatus.notYet;
    }
    return ProductRequestStatus.empty;
  }
}

enum ProductRequestProductType implements ColorType {
  empty('', Colors.transparent),
  non('NON', Colors.grey),
  bpjs('BPJS', Colors.orange),
  antiten('ANTITEN', Colors.green),
  alkes('ALKES', Colors.lightBlueAccent),
  tollIn('TOLL IN', Colors.yellow);

  const ProductRequestProductType(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  bool get isInput => this == ProductRequestProductType.non;

  static ProductRequestProductType productRequestProductTypeFromString(
    String type,
  ) {
    if (type == ProductRequestProductType.non.label) {
      return ProductRequestProductType.non;
    }
    if (type == ProductRequestProductType.antiten.label) {
      return ProductRequestProductType.antiten;
    }
    if (type == ProductRequestProductType.bpjs.label) {
      return ProductRequestProductType.bpjs;
    }
    if (type == ProductRequestProductType.alkes.label) {
      return ProductRequestProductType.alkes;
    }
    if (type == ProductRequestProductType.tollIn.label) {
      return ProductRequestProductType.tollIn;
    }
    throw ArgumentError();
  }
}

@freezed
class ProductRequest with _$ProductRequest {
  const factory ProductRequest({
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required double subtotal,
    @JsonKey(name: 'subtotal_after_discount')
    required double subtotalAfterDiscount,
    required double total,
    @JsonKey(name: 'exchange_value') required double exchangeValue,
    @JsonKey(name: 'confirm_by') required int? confirmBy,
    @JsonKey(
      name: 'confirm_at',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? confirmAt,
    required String id,
    required double rate,
    @JsonKey(name: 'term_of_payment', defaultValue: 0) required int termOfPayment,
    @JsonKey(name: 'type_product') required String typeProduct,
    @JsonKey(name: 'purchase_order_distributor')
    required String purchaseOrderDistributor,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'ppn_percent') required double ppnPercent,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(
      name: 'status',
      fromJson: ProductRequestStatus.productRequestStatusFromString,
    )
    required ProductRequestStatus status,
    @JsonKey(name: 'pph_22_percent') required double pph22Percent,
    @JsonKey(name: 'pph_22_value') required double pph22Value,
    required String description,
    @JsonKey(name: 'bank_fee') required double bankFee,
    @JsonKey(name: 'transaction_type_id')
    required TransactionType transactionType,
    @JsonKey(name: 'currency_id') required Currency currency,
    @JsonKey(name: 'customer_id') required Customer customer,
    @JsonKey(name: 'delivery_address_id') required Customer deliveryAddress,
    @JsonKey(name: 'order_type_id') required TransactionType orderType,
    @JsonKey(name: 'department_id') required Department department,
    @JsonKey(name: 'purchase_order_distributor_date')
    required DateTime? purchaseOrderDistributorDate,
    @JsonKey(name: 'purchase_order_distributor_date_receive')
    required DateTime? purchaseOrderDistributorDateReceive,
  }) = _ProductRequest;
  const ProductRequest._();

  factory ProductRequest.fromJson(Map<String, Object?> json) =>
      _$ProductRequestFromJson(json);
}

class ProductRequestFormPurchaseOrder {
  ProductRequestFormPurchaseOrder({
    this.rate,
    this.termOfPayment,
    this.productType,
    this.purchaseOrderDistributor,
    this.specialDiscountPercent,
    this.ppnPercent,
    this.pph22Percent,
    this.department,
    this.customer,
    this.transactionType,
    this.orderType,
    this.currency,
    this.note,
    this.address,
    this.priceDiscountPercent,
    this.bankFee,
    this.status,
    this.id,
    this.ppnValue,
    this.pph22Value,
    this.subTotal,
    this.subTotalAfterDiscount,
    this.total,
    required this.receiveDate,
    required this.purchaseOrderDate,
  });

  factory ProductRequestFormPurchaseOrder.empty() =>
      ProductRequestFormPurchaseOrder(
        purchaseOrderDistributor: '',
        department: Department.empty(),
        customer: Customer.empty(),
        address: Customer.empty(),
        termOfPayment: 0,
        transactionType: TransactionType.empty(),
        orderType: TransactionType.empty(),
        productType: '',
        specialDiscountPercent: 0,
        ppnPercent: 0,
        pph22Percent: 0,
        currency: Currency.empty(),
        rate: 0,
        note: '',
        priceDiscountPercent: 0,
        bankFee: 0,
        status: ProductRequestStatus.notYet,
        id: '',
        ppnValue: 0,
        pph22Value: 0,
        subTotal: 0,
        subTotalAfterDiscount: 0,
        total: 0,
        receiveDate: DateTime.now(),
        purchaseOrderDate: DateTime.now(),
      );

  final String? purchaseOrderDistributor;
  final Department? department;
  final Customer? customer;
  final Customer? address;
  final int? termOfPayment;
  final TransactionType? transactionType;
  final TransactionType? orderType;
  final String? productType;
  final double? specialDiscountPercent;
  final double? ppnPercent;
  final double? pph22Percent;
  final Currency? currency;
  final double? rate;
  final String? note;
  final double? priceDiscountPercent;
  final double? bankFee;
  final ProductRequestStatus? status;
  final String? id;
  final double? ppnValue;
  final double? pph22Value;
  final double? subTotal;
  final double? subTotalAfterDiscount;
  final double? total;
  final DateTime receiveDate;
  final DateTime purchaseOrderDate;
}
