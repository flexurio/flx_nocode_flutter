// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDistributionImpl _$$ProductDistributionImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDistributionImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      batchNoId: json['batch_no_id'] as String,
      beginningBalance: (json['beginning_balance'] as num).toDouble(),
      debit: (json['debit'] as num).toDouble(),
      credit: (json['credit'] as num).toDouble(),
      productIssueDate: json['productIssueDate'] == null
          ? null
          : DateTime.parse(json['productIssueDate'] as String),
    );

Map<String, dynamic> _$$ProductDistributionImplToJson(
        _$ProductDistributionImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'batch_no_id': instance.batchNoId,
      'beginning_balance': instance.beginningBalance,
      'debit': instance.debit,
      'credit': instance.credit,
      'productIssueDate': instance.productIssueDate?.toIso8601String(),
    };
