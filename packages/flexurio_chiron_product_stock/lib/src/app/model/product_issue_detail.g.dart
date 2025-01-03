// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_issue_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductIssueDetailImpl _$$ProductIssueDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductIssueDetailImpl(
      (json['id'] as num).toInt(),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['qty'] as num).toInt(),
      (json['price'] as num).toInt(),
      (json['subtotal'] as num).toInt(),
      (json['product_price'] as num).toInt(),
      (json['total_product_price'] as num).toInt(),
      json['warehouse'] as String,
      MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      Product.fromJson(json['product'] as Map<String, dynamic>),
      ProductIssue.fromJson(json['product_issued'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductIssueDetailImplToJson(
        _$ProductIssueDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'qty': instance.qty,
      'price': instance.price,
      'subtotal': instance.subTotal,
      'product_price': instance.productPrice,
      'total_product_price': instance.totalProductPrice,
      'warehouse': instance.warehouse,
      'unit': instance.unit,
      'batch_no': instance.productionOrder,
      'product': instance.product,
      'product_issued': instance.productIssue,
    };
