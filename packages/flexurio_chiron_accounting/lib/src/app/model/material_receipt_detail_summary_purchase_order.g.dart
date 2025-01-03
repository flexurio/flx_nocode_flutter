// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receipt_detail_summary_purchase_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiptDetailSummaryPurchaseOrderImpl
    _$$MaterialReceiptDetailSummaryPurchaseOrderImplFromJson(
            Map<String, dynamic> json) =>
        _$MaterialReceiptDetailSummaryPurchaseOrderImpl(
          transactionId: json['transaction_id'] as String,
          transactionName:
              isoDateToDateTime(json['transaction_name'] as String?),
          supplierName: json['supplier_name'] as String,
          materialName: json['material_name'] as String,
          purchaseOrderId: json['purchase_order_id'] as String,
          purchaseOrderCurrencyId: json['purchase_order_currency_id'] as String,
          purchaseOrderRate: (json['purchase_order_rate'] as num).toInt(),
          quantityPo: (json['quantity_po'] as num).toInt(),
          materialUnitId: json['material_unit_id'] as String,
          price: (json['price'] as num).toInt(),
          quantityReceived: (json['quantity_received'] as num).toInt(),
          materialReceivedUnitId: json['material_received_unit_id'] as String,
          total: (json['total'] as num).toInt(),
          materialReceivedPrice:
              (json['material_received_price'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$MaterialReceiptDetailSummaryPurchaseOrderImplToJson(
        _$MaterialReceiptDetailSummaryPurchaseOrderImpl instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'transaction_name': instance.transactionName.toIso8601String(),
      'supplier_name': instance.supplierName,
      'material_name': instance.materialName,
      'purchase_order_id': instance.purchaseOrderId,
      'purchase_order_currency_id': instance.purchaseOrderCurrencyId,
      'purchase_order_rate': instance.purchaseOrderRate,
      'quantity_po': instance.quantityPo,
      'material_unit_id': instance.materialUnitId,
      'price': instance.price,
      'quantity_received': instance.quantityReceived,
      'material_received_unit_id': instance.materialReceivedUnitId,
      'total': instance.total,
      'material_received_price': instance.materialReceivedPrice,
    };
