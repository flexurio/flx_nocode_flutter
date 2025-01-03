// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_sales_credit_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportSalesCreditNoteImpl _$$ReportSalesCreditNoteImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportSalesCreditNoteImpl(
      customer: json['customer'] as String,
      transactionNo: json['transaction_no'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      purchaseOrderId: json['purchase_order_id'] as String,
      subTotal: (json['subtotal'] as num).toInt(),
      discountValue: (json['discount_value'] as num).toInt(),
      ppnValue: (json['ppn_value'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$ReportSalesCreditNoteImplToJson(
        _$ReportSalesCreditNoteImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'transaction_no': instance.transactionNo,
      'date': instance.date.toIso8601String(),
      'purchase_order_id': instance.purchaseOrderId,
      'subtotal': instance.subTotal,
      'discount_value': instance.discountValue,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
    };
