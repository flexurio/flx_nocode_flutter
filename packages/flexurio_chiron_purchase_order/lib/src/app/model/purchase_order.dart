import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order.freezed.dart';
part 'purchase_order.g.dart';

@freezed
class PurchaseOrder with _$PurchaseOrder {
  const factory PurchaseOrder({
    required String id,
    required double rate,
    required double subtotal,
    required String description,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'edit_description') required String? editDescription,
    @JsonKey(name: 'is_stock') required bool isStock,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'quotation_no') required String quotationNo,
    @JsonKey(name: 'subtotal_pay') required double subtotalPay,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'revision_no') required int revisionNo,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'pph_22_percent') required double pph22Percent,
    @JsonKey(name: 'pph_22_value') required double pph22Value,
    @JsonKey(name: 'received_date') required DateTime? receivedDate,
    @JsonKey(name: 'subtotal_after_disc') required double subtotalAfterDisc,
    @JsonKey(name: 'tax_percent') required double taxPercent,
    @JsonKey(name: 'tax_value') required double taxValue,
    @JsonKey(name: 'sub_after_tax') required double subAfterTax,
    @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) required Ppn ppn,
    @JsonKey(name: 'dp_percent') required double dpPercent,
    @JsonKey(name: 'dp_value') required double dpValue,
    @JsonKey(name: 'remaining_payment') required double remainingPayment,
    @JsonKey(name: 'status_close_by_id') required int? statusCloseById,
    @JsonKey(name: 'account_value') required double accountValue,
    @JsonKey(name: 'confirm_po_by_id') required int? confirmPoById,
    @JsonKey(name: 'confirm_accounting_by') required int? confirmAccountingBy,
    @JsonKey(name: 'description_confirm_accounting')
    required String? descriptionConfirmAccounting,
    @JsonKey(name: 'term_of_payment') required int termOfPayment,
    @JsonKey(fromJson: Department.fromJson) required Department department,
    @JsonKey(fromJson: PurchaseOrderStatus.fromString)
    required PurchaseOrderStatus status,
    @JsonKey(name: 'status_next_shipping_by_id')
    required int? statusNextShippingById,
    @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
    required DateTime? statusCloseAt,
    @JsonKey(name: 'close_transaction_by_id')
    required int? closeTransactionById,
    @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
    required DateTime? closeTransactionAt,
    @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
    required DateTime deliveryDate,
    @JsonKey(name: 'delivery_order_id') String? deliveryOrderId,
    @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
    required TaxType taxType,
    @JsonKey(name: 'is_confirm_delivery_date', defaultValue: false)
    required bool isConfirmDeliveryDate,
    @JsonKey(
        name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
    required PurchaseOrderPaymentType paymentType,
    @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
    required MaterialRequest materialRequest,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
    required Supplier supplier,
    @JsonKey(name: 'currency', fromJson: Currency.fromJson)
    required Currency currency,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    required double total,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
    required DateTime? confirmPoDate,
    @JsonKey(
      name: 'confirm_accounting_date',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? confirmAccountingDate,
    @JsonKey(
      name: 'status_next_shipping_at',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? statusNextShippingAt,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup? materialGroup,
  }) = _PurchaseOrder;
  const PurchaseOrder._();

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderFromJson(json);

  factory PurchaseOrder.empty() => PurchaseOrder(
        id: '',
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        materialRequest: MaterialRequest.empty(),
        supplier: Supplier.empty(),
        currency: Currency.empty(),
        rate: 0,
        subtotal: 0,
        quotationNo: '',
        subtotalPay: 0,
        discountPercent: 0,
        discountValue: 0,
        subtotalAfterDisc: 0,
        taxType: TaxType.empty,
        taxPercent: 0,
        taxValue: 0,
        subAfterTax: 0,
        ppn: Ppn.empty,
        ppnValue: 0,
        total: 0,
        dpPercent: 0,
        dpValue: 0,
        remainingPayment: 0,
        termOfPayment: 0,
        description: '',
        accountValue: 0,
        status: PurchaseOrderStatus.empty,
        confirmPoById: 0,
        confirmPoDate: DateTime(0),
        confirmAccountingBy: 0,
        confirmAccountingDate: DateTime(0),
        descriptionConfirmAccounting: '',
        statusNextShippingById: 0,
        statusNextShippingAt: DateTime(0),
        statusCloseById: 0,
        statusCloseAt: DateTime(0),
        closeTransactionById: 0,
        closeTransactionAt: DateTime(0),
        deliveryOrderId: '',
        deliveryDate: DateTime(0),
        pph22Percent: 0,
        pph22Value: 0,
        receivedDate: DateTime(0),
        isConfirmDeliveryDate: false,
        editDescription: '',
        isStock: false,
        paymentType: PurchaseOrderPaymentType.empty,
        revisionNo: 0,
        department: Department.empty(),
        materialGroup: MaterialGroup.empty(),
      );
}

@freezed
class PurchaseOrderDocument with _$PurchaseOrderDocument {
  const factory PurchaseOrderDocument({
    required int id,
    @JsonKey(name: 'document_path') required String documentPath,
    @JsonKey(name: 'revision_no') required int revisionNo,
  }) = _PurchaseOrderDocument;
  const PurchaseOrderDocument._();

  factory PurchaseOrderDocument.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderDocumentFromJson(json);

  String get fileName => documentPath.split('/').last;
}

enum PurchaseOrderStatus implements ColorType {
  empty('', Colors.transparent),
  input('INPUT', Colors.blueGrey),
  confirmManager('CONFIRM MANAGER', Colors.cyan),
  accountingConfirm('CONFIRM ACCOUNTING', Colors.blue),
  accountingReject('REJECT ACCOUNTING', Colors.red),
  nextShipping('NEXT SHIPPING', Colors.purple),
  close('CLOSE', Colors.green);

  const PurchaseOrderStatus(this.id, this.color);
  final String id;

  static List<PurchaseOrderStatus> get list =>
      List.from(values)..remove(PurchaseOrderStatus.empty);

  @override
  String get label => id;

  @override
  final Color color;

  static PurchaseOrderStatus fromString(String id) {
    if (id == PurchaseOrderStatus.input.id) {
      return PurchaseOrderStatus.input;
    }
    if (id == PurchaseOrderStatus.confirmManager.id) {
      return PurchaseOrderStatus.confirmManager;
    }
    if (id == PurchaseOrderStatus.accountingConfirm.id) {
      return PurchaseOrderStatus.accountingConfirm;
    }
    if (id == PurchaseOrderStatus.accountingReject.id) {
      return PurchaseOrderStatus.accountingReject;
    }
    if (id == PurchaseOrderStatus.nextShipping.id) {
      return PurchaseOrderStatus.nextShipping;
    }
    if (id == PurchaseOrderStatus.close.id) {
      return PurchaseOrderStatus.close;
    }
    return PurchaseOrderStatus.empty;
  }

  bool get isInput => this == PurchaseOrderStatus.input;
  bool get isConfirmManager => this == PurchaseOrderStatus.confirmManager;
  bool get isConfirmAccounting => this == PurchaseOrderStatus.accountingConfirm;
  bool get isNextShipping => this == PurchaseOrderStatus.nextShipping;
  bool get isClose => this == PurchaseOrderStatus.close;
}

class PurchaseOrderFormSupplier {
  PurchaseOrderFormSupplier({
    required this.materialRequest,
    required this.supplier,
    required this.currency,
    required this.quotationNo,
    required this.deliveryDate,
    required this.revisionNo,
  });

  final MaterialRequest materialRequest;
  final DateTime deliveryDate;
  final Supplier supplier;
  final Currency currency;
  final String quotationNo;
  final int revisionNo;
}

class PurchaseOrderFormDiscount {
  PurchaseOrderFormDiscount({
    required this.paymentType,
    required this.ppn,
    required this.discountPercent,
    required this.downPaymentPercent,
    required this.termOfPayment,
    required this.taxType,
    required this.description,
  });

  final PurchaseOrderPaymentType paymentType;
  final Ppn ppn;
  final double discountPercent;
  final double downPaymentPercent;
  final int termOfPayment;
  final TaxType taxType;
  final String description;
}
