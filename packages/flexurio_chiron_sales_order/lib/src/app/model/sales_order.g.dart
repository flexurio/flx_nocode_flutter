// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderImpl _$$SalesOrderImplFromJson(Map<String, dynamic> json) =>
    _$SalesOrderImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      id: json['id'] as String,
      productIssueId: json['product_issue_id'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      invoiceId: json['invoice_id'] as String,
      status:
          SalesOrderStatus.salesOrderStatusFromString(json['status'] as String),
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
      taxBasePpn: (json['tax_base_ppn'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String,
      bankFee: (json['bank_fee'] as num).toDouble(),
      additionalDiscountType: json['additional_discount_type'] as String,
      additionalDiscountPercent:
          (json['additional_discount_percent'] as num).toDouble(),
      additionalDiscountValue:
          (json['additional_discount_value'] as num).toDouble(),
      specialDiscountPercent:
          (json['special_discount_percent'] as num).toDouble(),
      isTollIn: json['is_toll_in'] as bool? ?? false,
      isConfirmAt: isoDateToDateTime(json['is_confirm_at'] as String?),
      bonus: json['bonus'] as bool,
      revisionNo: (json['revision_no'] as num?)?.toInt() ?? 0,
      productRequest: ProductRequest.fromJson(
          json['product_request_id'] as Map<String, Object?>),
      deliveryDate:
          dateTimeNullableFromJson(json['is_print_delivery_at'] as String?),
      deliveryOrderOpenRemark: json['delivery_order_open_remark'] as String?,
    );

Map<String, dynamic> _$$SalesOrderImplToJson(_$SalesOrderImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'id': instance.id,
      'product_issue_id': instance.productIssueId,
      'delivery_order_id': instance.deliveryOrderId,
      'invoice_id': instance.invoiceId,
      'status': _$SalesOrderStatusEnumMap[instance.status]!,
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
      'tax_base_ppn': instance.taxBasePpn,
      'description': instance.description,
      'bank_fee': instance.bankFee,
      'additional_discount_type': instance.additionalDiscountType,
      'additional_discount_percent': instance.additionalDiscountPercent,
      'additional_discount_value': instance.additionalDiscountValue,
      'special_discount_percent': instance.specialDiscountPercent,
      'is_toll_in': instance.isTollIn,
      'is_confirm_at': instance.isConfirmAt?.toIso8601String(),
      'bonus': instance.bonus,
      'revision_no': instance.revisionNo,
      'product_request_id': instance.productRequest,
      'is_print_delivery_at': instance.deliveryDate?.toIso8601String(),
      'delivery_order_open_remark': instance.deliveryOrderOpenRemark,
    };

const _$SalesOrderStatusEnumMap = {
  SalesOrderStatus.input: 'input',
  SalesOrderStatus.confirm: 'confirm',
  SalesOrderStatus.printDeliveryOrder: 'printDeliveryOrder',
  SalesOrderStatus.printInvoice: 'printInvoice',
  SalesOrderStatus.empty: 'empty',
};
