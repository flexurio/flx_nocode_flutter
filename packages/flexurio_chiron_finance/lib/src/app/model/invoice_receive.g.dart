// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceReceiveImpl _$$InvoiceReceiveImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceReceiveImpl(
      id: json['invoice_no'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedById: (json['updated_by_id'] as num).toInt(),
      purchaseOrder:
          PurchaseOrder.fromJson(json['order'] as Map<String, dynamic>),
      transactionId: json['transaction_id'] as String,
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      rate: (json['rate'] as num).toDouble(),
      invoiceDate: isoDateToDateTime(json['invoice_date'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String,
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      taxInvoiceNo: json['tax_invoice_no'] as String,
      taxInvoiceDate: isoDateToDateTime(json['tax_invoice_date'] as String?),
      subtotal: (json['subtotal'] as num).toInt(),
      ppn: Ppn.fromNum(json['ppn'] as num),
      pph: TaxType.fromPercent((json['pph'] as num).toDouble()),
      total: (json['total'] as num).toDouble(),
      termOfPayment: (json['term_of_payment'] as num).toInt(),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      isApproveHeadAccounting:
          json['is_approve_head_accounting'] as bool? ?? false,
      receiveByFinanceAt:
          dateTimeNullable(json['received_by_finance_at'] as String?),
      receiveByServiceAt:
          dateTimeNullable(json['received_by_customer_service_at'] as String?),
      approveHeadAccountingAt:
          dateTimeNullable(json['approve_head_accounting_at'] as String?),
    );

Map<String, dynamic> _$$InvoiceReceiveImplToJson(
        _$InvoiceReceiveImpl instance) =>
    <String, dynamic>{
      'invoice_no': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_by_id': instance.updatedById,
      'order': instance.purchaseOrder,
      'transaction_id': instance.transactionId,
      'supplier': instance.supplier,
      'rate': instance.rate,
      'invoice_date': instance.invoiceDate.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'tax_invoice_no': instance.taxInvoiceNo,
      'tax_invoice_date': instance.taxInvoiceDate.toIso8601String(),
      'subtotal': instance.subtotal,
      'ppn': _$PpnEnumMap[instance.ppn]!,
      'pph': _$TaxTypeEnumMap[instance.pph]!,
      'total': instance.total,
      'term_of_payment': instance.termOfPayment,
      'due_date': instance.dueDate.toIso8601String(),
      'is_approve_head_accounting': instance.isApproveHeadAccounting,
      'received_by_finance_at': instance.receiveByFinanceAt?.toIso8601String(),
      'received_by_customer_service_at':
          instance.receiveByServiceAt?.toIso8601String(),
      'approve_head_accounting_at':
          instance.approveHeadAccountingAt?.toIso8601String(),
    };

const _$PpnEnumMap = {
  Ppn.empty: 'empty',
  Ppn.none: 'none',
  Ppn.ppn10: 'ppn10',
  Ppn.ppn11: 'ppn11',
  Ppn.ppn12: 'ppn12',
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
