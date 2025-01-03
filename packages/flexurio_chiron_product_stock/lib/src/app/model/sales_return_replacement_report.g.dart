// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_return_replacement_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesReturnReplacementReportImpl _$$SalesReturnReplacementReportImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesReturnReplacementReportImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      batchNo: json['batch_no'] as String,
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String,
      deliveryOrderId: json['delivery_order_id'] as String,
      deliveryOrderDate:
          isoDateToDateTime(json['delivery_order_date'] as String?),
      productIssueDate:
          isoDateToDateTime(json['product_issue_date'] as String?),
      unitId: json['unit_id'] as String,
      productPrice: (json['product_price'] as num).toInt(),
      totalProductPrice: (json['total_product_price'] as num).toInt(),
      productIssueQuantity: (json['product_issue_quantity'] as num).toInt(),
      productIssueProductPrice:
          (json['product_issue_product_price'] as num).toInt(),
      productIssueTotalProductPrice:
          (json['product_issue_total_product_price'] as num).toInt(),
      product: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      productReturn: ProductReturn.fromJson(
          json['product_return_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SalesReturnReplacementReportImplToJson(
        _$SalesReturnReplacementReportImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'batch_no': instance.batchNo,
      'quantity': instance.quantity,
      'description': instance.description,
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'product_issue_date': instance.productIssueDate.toIso8601String(),
      'unit_id': instance.unitId,
      'product_price': instance.productPrice,
      'total_product_price': instance.totalProductPrice,
      'product_issue_quantity': instance.productIssueQuantity,
      'product_issue_product_price': instance.productIssueProductPrice,
      'product_issue_total_product_price':
          instance.productIssueTotalProductPrice,
      'product_id': instance.product,
      'product_return_id': instance.productReturn,
    };
