// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnImpl _$$ProductReturnImplFromJson(Map<String, dynamic> json) =>
    _$ProductReturnImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      currency: Currency.fromJson(json['currency_id'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer_id'] as Map<String, dynamic>),
      department:
          Department.fromJson(json['department_id'] as Map<String, dynamic>),
      transactionType: TransactionType.fromJson(
          json['transaction_type_id'] as Map<String, dynamic>),
      referenceNo: json['reference_no'] as String,
      description: json['description'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      subtotalAfterDiscount:
          (json['subtotal_after_discount'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      ppnPercent: Ppn.fromNum(json['ppn_percent'] as num),
      subtotalAfterPpn: (json['subtotal_after_ppn'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      accountValue: (json['account_value'] as num).toDouble(),
      status: ProductReturnStatus.fromString(json['status'] as String),
      confirmMarketingAt:
          dateTimeNullable(json['confirm_marketing_at'] as String?),
      confirmPpicAt: dateTimeNullable(json['confirm_ppic_at'] as String?),
    );

Map<String, dynamic> _$$ProductReturnImplToJson(_$ProductReturnImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'currency_id': instance.currency,
      'customer_id': instance.customer,
      'department_id': instance.department,
      'transaction_type_id': instance.transactionType,
      'reference_no': instance.referenceNo,
      'description': instance.description,
      'subtotal': instance.subtotal,
      'discount_percent': instance.discountPercent,
      'discount_value': instance.discountValue,
      'subtotal_after_discount': instance.subtotalAfterDiscount,
      'ppn_value': instance.ppnValue,
      'ppn_percent': _$PpnEnumMap[instance.ppnPercent]!,
      'subtotal_after_ppn': instance.subtotalAfterPpn,
      'total': instance.total,
      'account_value': instance.accountValue,
      'status': _$ProductReturnStatusEnumMap[instance.status]!,
      'confirm_marketing_at': instance.confirmMarketingAt?.toIso8601String(),
      'confirm_ppic_at': instance.confirmPpicAt?.toIso8601String(),
    };

const _$PpnEnumMap = {
  Ppn.empty: 'empty',
  Ppn.none: 'none',
  Ppn.ppn10: 'ppn10',
  Ppn.ppn11: 'ppn11',
};

const _$ProductReturnStatusEnumMap = {
  ProductReturnStatus.empty: 'empty',
  ProductReturnStatus.confirmPPIC: 'confirmPPIC',
  ProductReturnStatus.confirm: 'confirm',
  ProductReturnStatus.confirmMarketing: 'confirmMarketing',
  ProductReturnStatus.input: 'input',
};
