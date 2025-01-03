// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderImpl _$$PurchaseOrderImplFromJson(Map<String, dynamic> json) =>
    _$PurchaseOrderImpl(
      id: json['id'] as String,
      rate: (json['rate'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      description: json['description'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      editDescription: json['edit_description'] as String?,
      isStock: json['is_stock'] as bool,
      updateById: (json['updated_by_id'] as num).toInt(),
      quotationNo: json['quotation_no'] as String,
      subtotalPay: (json['subtotal_pay'] as num).toDouble(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      revisionNo: (json['revision_no'] as num).toInt(),
      discountValue: (json['discount_value'] as num).toDouble(),
      pph22Percent: (json['pph_22_percent'] as num).toDouble(),
      pph22Value: (json['pph_22_value'] as num).toDouble(),
      receivedDate: json['received_date'] == null
          ? null
          : DateTime.parse(json['received_date'] as String),
      subtotalAfterDisc: (json['subtotal_after_disc'] as num).toDouble(),
      taxPercent: (json['tax_percent'] as num).toDouble(),
      taxValue: (json['tax_value'] as num).toDouble(),
      subAfterTax: (json['sub_after_tax'] as num).toDouble(),
      ppn: Ppn.fromNum(json['ppn_percent'] as num),
      dpPercent: (json['dp_percent'] as num).toDouble(),
      dpValue: (json['dp_value'] as num).toDouble(),
      remainingPayment: (json['remaining_payment'] as num).toDouble(),
      statusCloseById: (json['status_close_by_id'] as num?)?.toInt(),
      accountValue: (json['account_value'] as num).toDouble(),
      confirmPoById: (json['confirm_po_by_id'] as num?)?.toInt(),
      confirmAccountingBy: (json['confirm_accounting_by'] as num?)?.toInt(),
      descriptionConfirmAccounting:
          json['description_confirm_accounting'] as String?,
      termOfPayment: (json['term_of_payment'] as num).toInt(),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      status: PurchaseOrderStatus.fromString(json['status'] as String),
      statusNextShippingById:
          (json['status_next_shipping_by_id'] as num?)?.toInt(),
      statusCloseAt:
          dateTimeNullableFromJson(json['status_close_at'] as String?),
      closeTransactionById: (json['close_transaction_by_id'] as num?)?.toInt(),
      closeTransactionAt:
          dateTimeNullableFromJson(json['close_transaction_at'] as String?),
      deliveryDate: isoDateToDateTime(json['delivery_date'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String?,
      taxType: TaxType.fromString(json['tax_type'] as String),
      isConfirmDeliveryDate: json['is_confirm_delivery_date'] as bool? ?? false,
      paymentType:
          PurchaseOrderPaymentType.fromString(json['payment_type'] as String),
      materialRequest: MaterialRequest.fromJson(
          json['material_request'] as Map<String, Object?>),
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      confirmPoDate:
          dateTimeNullableFromJson(json['confirm_po_date'] as String?),
      confirmAccountingDate:
          dateTimeNullableFromJson(json['confirm_accounting_date'] as String?),
      statusNextShippingAt:
          dateTimeNullableFromJson(json['status_next_shipping_at'] as String?),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$PurchaseOrderImplToJson(_$PurchaseOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'subtotal': instance.subtotal,
      'description': instance.description,
      'created_by_id': instance.createdById,
      'edit_description': instance.editDescription,
      'is_stock': instance.isStock,
      'updated_by_id': instance.updateById,
      'quotation_no': instance.quotationNo,
      'subtotal_pay': instance.subtotalPay,
      'discount_percent': instance.discountPercent,
      'revision_no': instance.revisionNo,
      'discount_value': instance.discountValue,
      'pph_22_percent': instance.pph22Percent,
      'pph_22_value': instance.pph22Value,
      'received_date': instance.receivedDate?.toIso8601String(),
      'subtotal_after_disc': instance.subtotalAfterDisc,
      'tax_percent': instance.taxPercent,
      'tax_value': instance.taxValue,
      'sub_after_tax': instance.subAfterTax,
      'ppn_percent': _$PpnEnumMap[instance.ppn]!,
      'dp_percent': instance.dpPercent,
      'dp_value': instance.dpValue,
      'remaining_payment': instance.remainingPayment,
      'status_close_by_id': instance.statusCloseById,
      'account_value': instance.accountValue,
      'confirm_po_by_id': instance.confirmPoById,
      'confirm_accounting_by': instance.confirmAccountingBy,
      'description_confirm_accounting': instance.descriptionConfirmAccounting,
      'term_of_payment': instance.termOfPayment,
      'department': instance.department,
      'status': _$PurchaseOrderStatusEnumMap[instance.status]!,
      'status_next_shipping_by_id': instance.statusNextShippingById,
      'status_close_at': instance.statusCloseAt?.toIso8601String(),
      'close_transaction_by_id': instance.closeTransactionById,
      'close_transaction_at': instance.closeTransactionAt?.toIso8601String(),
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'tax_type': _$TaxTypeEnumMap[instance.taxType]!,
      'is_confirm_delivery_date': instance.isConfirmDeliveryDate,
      'payment_type': _$PurchaseOrderPaymentTypeEnumMap[instance.paymentType]!,
      'material_request': instance.materialRequest,
      'supplier': instance.supplier,
      'currency': instance.currency,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'confirm_po_date': instance.confirmPoDate?.toIso8601String(),
      'confirm_accounting_date':
          instance.confirmAccountingDate?.toIso8601String(),
      'status_next_shipping_at':
          instance.statusNextShippingAt?.toIso8601String(),
      'material_group': instance.materialGroup,
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

const _$PurchaseOrderPaymentTypeEnumMap = {
  PurchaseOrderPaymentType.empty: 'empty',
  PurchaseOrderPaymentType.termOfPayment: 'termOfPayment',
  PurchaseOrderPaymentType.pettyCash: 'pettyCash',
};

_$PurchaseOrderDocumentImpl _$$PurchaseOrderDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderDocumentImpl(
      id: (json['id'] as num).toInt(),
      documentPath: json['document_path'] as String,
      revisionNo: (json['revision_no'] as num).toInt(),
    );

Map<String, dynamic> _$$PurchaseOrderDocumentImplToJson(
        _$PurchaseOrderDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_path': instance.documentPath,
      'revision_no': instance.revisionNo,
    };
