// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_outstanding_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderOutstandingProductImpl
    _$$PurchaseOrderOutstandingProductImplFromJson(Map<String, dynamic> json) =>
        _$PurchaseOrderOutstandingProductImpl(
          purchaseOrderId: json['purchase_order_id'] as String,
          supplierName: json['supplier_name'] as String,
          productId: json['product_id'] as String,
          productName: json['product_name'] as String,
          batchNoId: json['batch_no_id'] as String,
          purchaseOrderDate:
              isoDateToDateTime(json['purchase_order_date'] as String?),
          dateOfNeed: isoDateToDateTime(json['date_of_need'] as String?),
          materialRequestDueDate:
              isoDateToDateTime(json['material_request_due_date'] as String?),
          materialRequestId: json['material_request_id'] as String,
          quantityPo: (json['quantity_po'] as num).toInt(),
          unitId: json['unit_id'] as String,
          periodMaterialRequest: json['period_material_request'] as String,
          productStatusQc: json['product_status_qc'] as String,
          createdAt: isoDateToDateTime(json['created_at'] as String?),
          divisi: json['divisi'] as String,
        );

Map<String, dynamic> _$$PurchaseOrderOutstandingProductImplToJson(
        _$PurchaseOrderOutstandingProductImpl instance) =>
    <String, dynamic>{
      'purchase_order_id': instance.purchaseOrderId,
      'supplier_name': instance.supplierName,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'batch_no_id': instance.batchNoId,
      'purchase_order_date': instance.purchaseOrderDate.toIso8601String(),
      'date_of_need': instance.dateOfNeed.toIso8601String(),
      'material_request_due_date':
          instance.materialRequestDueDate.toIso8601String(),
      'material_request_id': instance.materialRequestId,
      'quantity_po': instance.quantityPo,
      'unit_id': instance.unitId,
      'period_material_request': instance.periodMaterialRequest,
      'product_status_qc': instance.productStatusQc,
      'created_at': instance.createdAt.toIso8601String(),
      'divisi': instance.divisi,
    };
