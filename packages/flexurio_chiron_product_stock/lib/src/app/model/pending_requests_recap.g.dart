// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_requests_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRequestsRecapImpl _$$PendingRequestsRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingRequestsRecapImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      unitId: json['unit_id'] as String,
      totalProductRequestPrice:
          (json['total_product_request_price'] as num).toInt(),
      quantityRemaining: (json['quantity_remaining'] as num).toInt(),
      productStockQuantityRemaining:
          (json['product_stock_quantity_remaining'] as num).toInt(),
    );

Map<String, dynamic> _$$PendingRequestsRecapImplToJson(
        _$PendingRequestsRecapImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit_id': instance.unitId,
      'total_product_request_price': instance.totalProductRequestPrice,
      'quantity_remaining': instance.quantityRemaining,
      'product_stock_quantity_remaining':
          instance.productStockQuantityRemaining,
    };
