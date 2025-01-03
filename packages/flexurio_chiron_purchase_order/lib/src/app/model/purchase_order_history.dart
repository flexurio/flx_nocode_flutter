import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_history.freezed.dart';
part 'purchase_order_history.g.dart';

@freezed
class PurchaseOrderHistory with _$PurchaseOrderHistory {
  const factory PurchaseOrderHistory({
    @JsonKey(name: 'purchase_order_id') required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
    required MaterialRequest materialRequest,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
    required Supplier supplier,
    @JsonKey(name: 'currency', fromJson: Currency.fromJson)
    required Currency currency,
    required double rate,
    required double subtotal,
    @JsonKey(name: 'quotation_no') required String quotationNo,
    @JsonKey(name: 'subtotal_pay') required double subtotalPay,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'discount_value') required double discountValue,
    @JsonKey(name: 'subtotal_after_disc') required double subtotalAfterDisc,
    @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
    required TaxType taxType,
    @JsonKey(name: 'tax_percent') required double taxPercent,
    @JsonKey(name: 'tax_value') required double taxValue,
    @JsonKey(name: 'sub_after_tax') required double subAfterTax,
    @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) required Ppn ppn,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    required double total,
    @JsonKey(name: 'dp_percent') required double dpPercent,
    @JsonKey(name: 'dp_value') required double dpValue,
    @JsonKey(name: 'remaining_payment') required double remainingPayment,
    @JsonKey(name: 'term_of_payment') required int termOfPayment,
    required String description,
    @JsonKey(name: 'account_value') required double accountValue,
    @JsonKey(fromJson: PurchaseOrderStatus.fromString)
    required PurchaseOrderStatus status,
    @JsonKey(name: 'confirm_po_by_id') required int? confirmPoById,
    @JsonKey(
      name: 'confirm_po_date',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? confirmPoDate,
    @JsonKey(name: 'confirm_accounting_by') required int? confirmAccountingBy,
    @JsonKey(
      name: 'confirm_accounting_date',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? confirmAccountingDate,
    @JsonKey(name: 'description_confirm_accounting')
    required String? descriptionConfirmAccounting,
    @JsonKey(name: 'status_next_shipping_by_id')
    required int? statusNextShippingById,
    @JsonKey(
      name: 'status_next_shipping_at',
      fromJson: dateTimeNullableFromJson,
    )
    required DateTime? statusNextShippingAt,
    @JsonKey(name: 'status_close_by_id') required int? statusCloseById,
    @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
    required DateTime? statusCloseAt,
    @JsonKey(name: 'close_transaction_by_id')
    required int? closeTransactionById,
    @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
    required DateTime? closeTransactionAt,
    @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
    required DateTime deliveryDate,
    @JsonKey(name: 'pph_22_percent') required double pph22Percent,
    @JsonKey(name: 'pph_22_value') required double pph22Value,
    @JsonKey(name: 'received_date') required DateTime? receivedDate,
    @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
    required bool confirmDeliveryDate,
    @JsonKey(name: 'edit_description') required String? editDescription,
    @JsonKey(name: 'is_stock') required bool isStock,
    @JsonKey(
        name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
    required PurchaseOrderPaymentType paymentType,
    @JsonKey(name: 'revision_no') required int revisionNo,
    @JsonKey(fromJson: Department.fromJson) required Department department,
  }) = _PurchaseOrderHistory;
  const PurchaseOrderHistory._();

  factory PurchaseOrderHistory.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderHistoryFromJson(json);

  factory PurchaseOrderHistory.empty() => PurchaseOrderHistory(
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
        deliveryDate: DateTime(0),
        pph22Percent: 0,
        pph22Value: 0,
        receivedDate: DateTime(0),
        confirmDeliveryDate: false,
        editDescription: '',
        isStock: false,
        paymentType: PurchaseOrderPaymentType.empty,
        revisionNo: 0,
        department: Department.empty(),
      );

  PurchaseOrder toPurchaseOrder() {
    return PurchaseOrder(
      id: id,
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      updateById: updateById,
      materialRequest: materialRequest,
      supplier: supplier,
      currency: currency,
      rate: rate,
      subtotal: subtotal,
      quotationNo: quotationNo,
      subtotalPay: subtotalPay,
      discountPercent: discountPercent,
      discountValue: discountValue,
      subtotalAfterDisc: subtotalAfterDisc,
      taxType: taxType,
      taxPercent: taxPercent,
      taxValue: taxValue,
      subAfterTax: subAfterTax,
      ppn: ppn,
      ppnValue: ppnValue,
      total: total,
      dpPercent: dpPercent,
      dpValue: dpValue,
      remainingPayment: remainingPayment,
      termOfPayment: termOfPayment,
      description: description,
      accountValue: accountValue,
      status: status,
      confirmPoById: confirmPoById,
      confirmPoDate: confirmPoDate,
      confirmAccountingBy: confirmAccountingBy,
      confirmAccountingDate: confirmAccountingDate,
      descriptionConfirmAccounting: descriptionConfirmAccounting,
      statusNextShippingById: statusNextShippingById,
      statusNextShippingAt: statusNextShippingAt,
      statusCloseById: statusCloseById,
      statusCloseAt: statusCloseAt,
      closeTransactionById: closeTransactionById,
      closeTransactionAt: closeTransactionAt,
      deliveryDate: deliveryDate,
      pph22Percent: pph22Percent,
      pph22Value: pph22Value,
      receivedDate: receivedDate,
      isConfirmDeliveryDate: confirmDeliveryDate,
      editDescription: editDescription,
      isStock: isStock,
      paymentType: paymentType,
      revisionNo: revisionNo,
      department: department,
      materialGroup: MaterialGroup.empty(),
    );
  }
}
