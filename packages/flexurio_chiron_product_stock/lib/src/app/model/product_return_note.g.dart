// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnNoteImpl _$$ProductReturnNoteImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnNoteImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      currency: Currency.fromJson(json['currency_id'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer_id'] as Map<String, dynamic>),
      department:
          Department.fromJson(json['department_id'] as Map<String, dynamic>),
      transactionType: TransactionType.fromJson(
          json['transaction_type_id'] as Map<String, dynamic>),
      rate: (json['rate'] as num).toInt(),
      purchaseOrderId: json['purchase_order_id'] as String,
      returnDate: isoDateToDateTime(json['return_date'] as String?),
      shippingAddress: json['shipping_address'] as String,
      addressName: json['address_name'] as String,
      deliveryNoteDate:
          isoDateToDateTime(json['delivery_note_date'] as String?),
      termOfPayment: (json['term_of_payment'] as num).toInt(),
      remark: json['remark'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      discountPercent: (json['discount_percentage'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      ppnPercent: Ppn.fromNum(json['ppn_percentage'] as num),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      approvedById: (json['approved_by_id'] as num).toInt(),
      approvedAt: dateTimeNullable(json['approved_at'] as String?),
    );

Map<String, dynamic> _$$ProductReturnNoteImplToJson(
        _$ProductReturnNoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'currency_id': instance.currency,
      'customer_id': instance.customer,
      'department_id': instance.department,
      'transaction_type_id': instance.transactionType,
      'rate': instance.rate,
      'purchase_order_id': instance.purchaseOrderId,
      'return_date': instance.returnDate.toIso8601String(),
      'shipping_address': instance.shippingAddress,
      'address_name': instance.addressName,
      'delivery_note_date': instance.deliveryNoteDate.toIso8601String(),
      'term_of_payment': instance.termOfPayment,
      'remark': instance.remark,
      'subtotal': instance.subtotal,
      'discount_percentage': instance.discountPercent,
      'discount_value': instance.discountValue,
      'ppn_percentage': _$PpnEnumMap[instance.ppnPercent]!,
      'ppn_value': instance.ppnValue,
      'total': instance.total,
      'approved_by_id': instance.approvedById,
      'approved_at': instance.approvedAt?.toIso8601String(),
    };

const _$PpnEnumMap = {
  Ppn.empty: 'empty',
  Ppn.none: 'none',
  Ppn.ppn10: 'ppn10',
  Ppn.ppn11: 'ppn11',
  Ppn.ppn12: 'ppn12',
};
