// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderHistoryImpl _$$SalesOrderHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderHistoryImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      productIssueId: json['product_issue_id'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      invoiceId: json['invoice_id'] as String,
      status: SalesOrderHistoryStatus.salesOrderStatusFromString(
          json['status'] as String),
      subtotal: (json['subtotal'] as num).toDouble(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      subtotalAfterDiscount:
          (json['subtotal_after_discount'] as num).toDouble(),
      ppnPercent: (json['ppn_percent'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      exchangedValue: (json['exchanged_value'] as num).toDouble(),
      pph22Percent: (json['pph_22_percent'] as num).toDouble(),
      pph22Value: (json['pph_22_value'] as num).toDouble(),
      description: json['description'] as String,
      bankFee: (json['bank_fee'] as num).toDouble(),
      additionalDiscountType: json['additional_discount_type'] as String,
      additionalDiscountPercent:
          (json['additional_discount_percent'] as num).toDouble(),
      additionalDiscountValue:
          (json['additional_discount_value'] as num).toDouble(),
      specialDiscountPercent:
          (json['special_discount_percent'] as num).toDouble(),
      isConfirmAt: isoDateToDateTime(json['is_confirm_at'] as String?),
      bonus: json['bonus'] as bool,
      revisionNo: (json['revision_no'] as num).toInt(),
      isTollIn: json['is_toll_in'] as bool,
      deliveryOrderOpenRemark: json['delivery_order_open_remark'] as String?,
      productRequestId: json['product_request_id'] as String?,
      salesOrder:
          SalesOrder.fromJson(json['sales_order_id'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$SalesOrderHistoryImplToJson(
        _$SalesOrderHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'product_issue_id': instance.productIssueId,
      'delivery_order_id': instance.deliveryOrderId,
      'invoice_id': instance.invoiceId,
      'status': _$SalesOrderHistoryStatusEnumMap[instance.status]!,
      'subtotal': instance.subtotal,
      'discount_percent': instance.discountPercent,
      'discount_value': instance.discountValue,
      'subtotal_after_discount': instance.subtotalAfterDiscount,
      'ppn_percent': instance.ppnPercent,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'exchanged_value': instance.exchangedValue,
      'pph_22_percent': instance.pph22Percent,
      'pph_22_value': instance.pph22Value,
      'description': instance.description,
      'bank_fee': instance.bankFee,
      'additional_discount_type': instance.additionalDiscountType,
      'additional_discount_percent': instance.additionalDiscountPercent,
      'additional_discount_value': instance.additionalDiscountValue,
      'special_discount_percent': instance.specialDiscountPercent,
      'is_confirm_at': instance.isConfirmAt?.toIso8601String(),
      'bonus': instance.bonus,
      'revision_no': instance.revisionNo,
      'is_toll_in': instance.isTollIn,
      'delivery_order_open_remark': instance.deliveryOrderOpenRemark,
      'product_request_id': instance.productRequestId,
      'sales_order_id': instance.salesOrder,
    };

const _$SalesOrderHistoryStatusEnumMap = {
  SalesOrderHistoryStatus.input: 'input',
  SalesOrderHistoryStatus.confirm: 'confirm',
  SalesOrderHistoryStatus.printDeliveryOrder: 'printDeliveryOrder',
  SalesOrderHistoryStatus.printInvoice: 'printInvoice',
  SalesOrderHistoryStatus.empty: 'empty',
};
