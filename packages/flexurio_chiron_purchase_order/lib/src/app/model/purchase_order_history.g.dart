// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderHistoryImpl _$$PurchaseOrderHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderHistoryImpl(
      id: json['purchase_order_id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      materialRequest: MaterialRequest.fromJson(
          json['material_request'] as Map<String, Object?>),
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      rate: (json['rate'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      quotationNo: json['quotation_no'] as String,
      subtotalPay: (json['subtotal_pay'] as num).toDouble(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      subtotalAfterDisc: (json['subtotal_after_disc'] as num).toDouble(),
      taxType: TaxType.fromString(json['tax_type'] as String),
      taxPercent: (json['tax_percent'] as num).toDouble(),
      taxValue: (json['tax_value'] as num).toDouble(),
      subAfterTax: (json['sub_after_tax'] as num).toDouble(),
      ppn: Ppn.fromNum(json['ppn_percent'] as num),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      dpPercent: (json['dp_percent'] as num).toDouble(),
      dpValue: (json['dp_value'] as num).toDouble(),
      remainingPayment: (json['remaining_payment'] as num).toDouble(),
      termOfPayment: (json['term_of_payment'] as num).toInt(),
      description: json['description'] as String,
      accountValue: (json['account_value'] as num).toDouble(),
      status: PurchaseOrderStatus.fromString(json['status'] as String),
      confirmPoById: (json['confirm_po_by_id'] as num?)?.toInt(),
      confirmPoDate:
          dateTimeNullableFromJson(json['confirm_po_date'] as String?),
      confirmAccountingBy: (json['confirm_accounting_by'] as num?)?.toInt(),
      confirmAccountingDate:
          dateTimeNullableFromJson(json['confirm_accounting_date'] as String?),
      descriptionConfirmAccounting:
          json['description_confirm_accounting'] as String?,
      statusNextShippingById:
          (json['status_next_shipping_by_id'] as num?)?.toInt(),
      statusNextShippingAt:
          dateTimeNullableFromJson(json['status_next_shipping_at'] as String?),
      statusCloseById: (json['status_close_by_id'] as num?)?.toInt(),
      statusCloseAt:
          dateTimeNullableFromJson(json['status_close_at'] as String?),
      closeTransactionById: (json['close_transaction_by_id'] as num?)?.toInt(),
      closeTransactionAt:
          dateTimeNullableFromJson(json['close_transaction_at'] as String?),
      deliveryDate: isoDateToDateTime(json['delivery_date'] as String?),
      pph22Percent: (json['pph_22_percent'] as num).toDouble(),
      pph22Value: (json['pph_22_value'] as num).toDouble(),
      receivedDate: json['received_date'] == null
          ? null
          : DateTime.parse(json['received_date'] as String),
      confirmDeliveryDate: json['confirm_delivery_date'] as bool? ?? false,
      editDescription: json['edit_description'] as String?,
      isStock: json['is_stock'] as bool,
      paymentType:
          PurchaseOrderPaymentType.fromString(json['payment_type'] as String),
      revisionNo: (json['revision_no'] as num).toInt(),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseOrderHistoryImplToJson(
        _$PurchaseOrderHistoryImpl instance) =>
    <String, dynamic>{
      'purchase_order_id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'material_request': instance.materialRequest,
      'supplier': instance.supplier,
      'currency': instance.currency,
      'rate': instance.rate,
      'subtotal': instance.subtotal,
      'quotation_no': instance.quotationNo,
      'subtotal_pay': instance.subtotalPay,
      'discount_percent': instance.discountPercent,
      'discount_value': instance.discountValue,
      'subtotal_after_disc': instance.subtotalAfterDisc,
      'tax_type': _$TaxTypeEnumMap[instance.taxType]!,
      'tax_percent': instance.taxPercent,
      'tax_value': instance.taxValue,
      'sub_after_tax': instance.subAfterTax,
      'ppn_percent': _$PpnEnumMap[instance.ppn]!,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'dp_percent': instance.dpPercent,
      'dp_value': instance.dpValue,
      'remaining_payment': instance.remainingPayment,
      'term_of_payment': instance.termOfPayment,
      'description': instance.description,
      'account_value': instance.accountValue,
      'status': _$PurchaseOrderStatusEnumMap[instance.status]!,
      'confirm_po_by_id': instance.confirmPoById,
      'confirm_po_date': instance.confirmPoDate?.toIso8601String(),
      'confirm_accounting_by': instance.confirmAccountingBy,
      'confirm_accounting_date':
          instance.confirmAccountingDate?.toIso8601String(),
      'description_confirm_accounting': instance.descriptionConfirmAccounting,
      'status_next_shipping_by_id': instance.statusNextShippingById,
      'status_next_shipping_at':
          instance.statusNextShippingAt?.toIso8601String(),
      'status_close_by_id': instance.statusCloseById,
      'status_close_at': instance.statusCloseAt?.toIso8601String(),
      'close_transaction_by_id': instance.closeTransactionById,
      'close_transaction_at': instance.closeTransactionAt?.toIso8601String(),
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'pph_22_percent': instance.pph22Percent,
      'pph_22_value': instance.pph22Value,
      'received_date': instance.receivedDate?.toIso8601String(),
      'confirm_delivery_date': instance.confirmDeliveryDate,
      'edit_description': instance.editDescription,
      'is_stock': instance.isStock,
      'payment_type': _$PurchaseOrderPaymentTypeEnumMap[instance.paymentType]!,
      'revision_no': instance.revisionNo,
      'department': instance.department,
    };

const _$TaxTypeEnumMap = {
  TaxType.empty: 'empty',
  TaxType.tax23Non: 'tax23Non',
  TaxType.tax23Npwp: 'tax23Npwp',
  TaxType.tax23_26: 'tax23_26',
  TaxType.tax21Non: 'tax21Non',
  TaxType.tax21Npwp: 'tax21Npwp',
  TaxType.tax21_9: 'tax21_9',
  TaxType.tax21_7_5: 'tax21_7_5',
  TaxType.tax21_0: 'tax21_0',
  TaxType.tax22Sale: 'tax22Sale',
  TaxType.taxFinal: 'taxFinal',
  TaxType.taxNone: 'taxNone',
};

const _$PpnEnumMap = {
  Ppn.empty: 'empty',
  Ppn.none: 'none',
  Ppn.ppn10: 'ppn10',
  Ppn.ppn11: 'ppn11',
  Ppn.ppn12: 'ppn12',
};

const _$PurchaseOrderStatusEnumMap = {
  PurchaseOrderStatus.empty: 'empty',
  PurchaseOrderStatus.input: 'input',
  PurchaseOrderStatus.confirmManager: 'confirmManager',
  PurchaseOrderStatus.accountingConfirm: 'accountingConfirm',
  PurchaseOrderStatus.accountingReject: 'accountingReject',
  PurchaseOrderStatus.nextShipping: 'nextShipping',
  PurchaseOrderStatus.close: 'close',
};

const _$PurchaseOrderPaymentTypeEnumMap = {
  PurchaseOrderPaymentType.empty: 'empty',
  PurchaseOrderPaymentType.termOfPayment: 'termOfPayment',
  PurchaseOrderPaymentType.pettyCash: 'pettyCash',
};
