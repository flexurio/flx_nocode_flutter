// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_issue_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductIssueGlobalImpl _$$ProductIssueGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductIssueGlobalImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      warehouse: json['warehouse'] as String,
      unitId: json['unit_id'] as String,
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductIssueGlobalImplToJson(
        _$ProductIssueGlobalImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'warehouse': instance.warehouse,
      'unit_id': instance.unitId,
      'qty': instance.qty,
    };
