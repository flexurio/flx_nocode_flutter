// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_requests_recap_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingRequestsRecapGlobalImpl _$$PendingRequestsRecapGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$PendingRequestsRecapGlobalImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      customerName: json['customer_name'] as String,
      customerId: json['customer_id'] as String,
      quantityRemaining: (json['quantity_remaining'] as num).toInt(),
      quantityStock: (json['quantity_stock'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      quantityRemainingProduct:
          (json['quantity_remaining_product'] as num?)?.toInt(),
      totalPriceProduct: (json['total_price_product'] as num?)?.toInt(),
      quantityRemainingSummary:
          (json['quantity_remaining_summary'] as num).toInt(),
      totalPriceSummary: (json['total_price_summary'] as num).toInt(),
    );

Map<String, dynamic> _$$PendingRequestsRecapGlobalImplToJson(
        _$PendingRequestsRecapGlobalImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'customer_name': instance.customerName,
      'customer_id': instance.customerId,
      'quantity_remaining': instance.quantityRemaining,
      'quantity_stock': instance.quantityStock,
      'total_price': instance.totalPrice,
      'quantity_remaining_product': instance.quantityRemainingProduct,
      'total_price_product': instance.totalPriceProduct,
      'quantity_remaining_summary': instance.quantityRemainingSummary,
      'total_price_summary': instance.totalPriceSummary,
    };
