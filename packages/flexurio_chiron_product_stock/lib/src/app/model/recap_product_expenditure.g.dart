// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recap_product_expenditure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecapProductExpenditureImpl _$$RecapProductExpenditureImplFromJson(
        Map<String, dynamic> json) =>
    _$RecapProductExpenditureImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      qty: (json['qty'] as num).toDouble(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      batchNoId: json['batch_no_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      customerCity: json['customer_city'] as String,
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productIssue:
          ProductIssue.fromJson(json['product_issued'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecapProductExpenditureImplToJson(
        _$RecapProductExpenditureImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'qty': instance.qty,
      'expired_date': instance.expiredDate.toIso8601String(),
      'batch_no_id': instance.batchNoId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'customer_city': instance.customerCity,
      'unit': instance.unit,
      'product': instance.product,
      'product_issued': instance.productIssue,
    };
