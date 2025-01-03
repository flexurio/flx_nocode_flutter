// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRequestImpl _$$ProductRequestImplFromJson(Map<String, dynamic> json) =>
    _$ProductRequestImpl(
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      subtotal: (json['subtotal'] as num).toDouble(),
      subtotalAfterDiscount:
          (json['subtotal_after_discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      exchangeValue: (json['exchange_value'] as num).toDouble(),
      confirmBy: (json['confirm_by'] as num?)?.toInt(),
      confirmAt: dateTimeNullableFromJson(json['confirm_at'] as String?),
      id: json['id'] as String,
      rate: (json['rate'] as num).toDouble(),
      termOfPayment: (json['term_of_payment'] as num?)?.toInt() ?? 0,
      typeProduct: json['type_product'] as String,
      purchaseOrderDistributor: json['purchase_order_distributor'] as String,
      discountPercent: (json['discount_percent'] as num).toDouble(),
      discountValue: (json['discount_value'] as num).toDouble(),
      ppnPercent: (json['ppn_percent'] as num).toDouble(),
      ppnValue: (json['ppn_value'] as num).toDouble(),
      status: ProductRequestStatus.productRequestStatusFromString(
          json['status'] as String),
      pph22Percent: (json['pph_22_percent'] as num).toDouble(),
      pph22Value: (json['pph_22_value'] as num).toDouble(),
      description: json['description'] as String,
      bankFee: (json['bank_fee'] as num).toDouble(),
      transactionType: TransactionType.fromJson(
          json['transaction_type_id'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency_id'] as Map<String, dynamic>),
      customer: Customer.fromJson(json['customer_id'] as Map<String, dynamic>),
      deliveryAddress: Customer.fromJson(
          json['delivery_address_id'] as Map<String, dynamic>),
      orderType: TransactionType.fromJson(
          json['order_type_id'] as Map<String, dynamic>),
      department:
          Department.fromJson(json['department_id'] as Map<String, dynamic>),
      purchaseOrderDistributorDate: json['purchase_order_distributor_date'] ==
              null
          ? null
          : DateTime.parse(json['purchase_order_distributor_date'] as String),
      purchaseOrderDistributorDateReceive:
          json['purchase_order_distributor_date_receive'] == null
              ? null
              : DateTime.parse(
                  json['purchase_order_distributor_date_receive'] as String),
    );

Map<String, dynamic> _$$ProductRequestImplToJson(
        _$ProductRequestImpl instance) =>
    <String, dynamic>{
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'subtotal': instance.subtotal,
      'subtotal_after_discount': instance.subtotalAfterDiscount,
      'total': instance.total,
      'exchange_value': instance.exchangeValue,
      'confirm_by': instance.confirmBy,
      'confirm_at': instance.confirmAt?.toIso8601String(),
      'id': instance.id,
      'rate': instance.rate,
      'term_of_payment': instance.termOfPayment,
      'type_product': instance.typeProduct,
      'purchase_order_distributor': instance.purchaseOrderDistributor,
      'discount_percent': instance.discountPercent,
      'discount_value': instance.discountValue,
      'ppn_percent': instance.ppnPercent,
      'ppn_value': instance.ppnValue,
      'status': _$ProductRequestStatusEnumMap[instance.status]!,
      'pph_22_percent': instance.pph22Percent,
      'pph_22_value': instance.pph22Value,
      'description': instance.description,
      'bank_fee': instance.bankFee,
      'transaction_type_id': instance.transactionType,
      'currency_id': instance.currency,
      'customer_id': instance.customer,
      'delivery_address_id': instance.deliveryAddress,
      'order_type_id': instance.orderType,
      'department_id': instance.department,
      'purchase_order_distributor_date':
          instance.purchaseOrderDistributorDate?.toIso8601String(),
      'purchase_order_distributor_date_receive':
          instance.purchaseOrderDistributorDateReceive?.toIso8601String(),
    };

const _$ProductRequestStatusEnumMap = {
  ProductRequestStatus.input: 'input',
  ProductRequestStatus.notYet: 'notYet',
  ProductRequestStatus.empty: 'empty',
  ProductRequestStatus.confirm: 'confirm',
  ProductRequestStatus.pending: 'pending',
  ProductRequestStatus.reject: 'reject',
};
