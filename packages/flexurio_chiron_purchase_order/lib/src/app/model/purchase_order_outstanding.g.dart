// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_outstanding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderOutstandingImpl _$$PurchaseOrderOutstandingImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderOutstandingImpl(
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      divisi: json['divisi'] as String,
      materialGroupId: json['material_group_id'] as String,
      materialRequestId: json['material_request_id'] as String,
      materialRequestDate:
          isoDateToDateTime(json['material_request_date'] as String?),
      periodMaterialRequest: json['period_material_request'] as String,
      quantityPo: (json['quantity_po'] as num).toInt(),
      value: (json['value'] as num).toInt(),
      unitId: json['unit_id'] as String,
      dateOfNeed: isoDateToDateTime(json['date_of_need'] as String?),
      periodDateOfNeed: json['period_date_of_need'] as String,
      materialRequestDueDate:
          isoDateToDateTime(json['material_request_due_date'] as String?),
      materialRequestDetailStatus:
          json['material_request_detail_status'] as String,
      purchaseOrderId: json['purchase_order_id'] as String,
      purchaseOrderDate:
          isoDateToDateTime(json['purchase_order_date'] as String?),
      transactionId: json['transaction_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      quantityReceivedConverted:
          (json['quantity_received_converted'] as num).toInt(),
      materialReceiveDate:
          isoDateToDateTime(json['material_receive_date'] as String?),
      quantityReleaseConverted:
          (json['quantity_release_converted'] as num).toInt(),
      quantityRejectConverted:
          (json['quantity_reject_converted'] as num).toInt(),
      materialReceiveMaterialStatusQc:
          json['material_receive_material_status_qc'] as String,
      quantityQuarantine: (json['quantity_quarantine'] as num).toInt(),
      releaseDate: isoDateToDateTime(json['release_date'] as String?),
      rejectDate: isoDateToDateTime(json['reject_date'] as String?),
      na: json['na'] as String,
      purchaseOrderDescription: json['purchase_order_description'] as String,
      supplierName: json['supplier_name'] as String,
      designCodeId: json['design_code_id'] as String,
      purchaseOrderStatus: json['purchase_order_status'] as String,
    );

Map<String, dynamic> _$$PurchaseOrderOutstandingImplToJson(
        _$PurchaseOrderOutstandingImpl instance) =>
    <String, dynamic>{
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'divisi': instance.divisi,
      'material_group_id': instance.materialGroupId,
      'material_request_id': instance.materialRequestId,
      'material_request_date': instance.materialRequestDate.toIso8601String(),
      'period_material_request': instance.periodMaterialRequest,
      'quantity_po': instance.quantityPo,
      'value': instance.value,
      'unit_id': instance.unitId,
      'date_of_need': instance.dateOfNeed.toIso8601String(),
      'period_date_of_need': instance.periodDateOfNeed,
      'material_request_due_date':
          instance.materialRequestDueDate.toIso8601String(),
      'material_request_detail_status': instance.materialRequestDetailStatus,
      'purchase_order_id': instance.purchaseOrderId,
      'purchase_order_date': instance.purchaseOrderDate.toIso8601String(),
      'transaction_id': instance.transactionId,
      'quantity': instance.quantity,
      'quantity_received_converted': instance.quantityReceivedConverted,
      'material_receive_date': instance.materialReceiveDate.toIso8601String(),
      'quantity_release_converted': instance.quantityReleaseConverted,
      'quantity_reject_converted': instance.quantityRejectConverted,
      'material_receive_material_status_qc':
          instance.materialReceiveMaterialStatusQc,
      'quantity_quarantine': instance.quantityQuarantine,
      'release_date': instance.releaseDate.toIso8601String(),
      'reject_date': instance.rejectDate.toIso8601String(),
      'na': instance.na,
      'purchase_order_description': instance.purchaseOrderDescription,
      'supplier_name': instance.supplierName,
      'design_code_id': instance.designCodeId,
      'purchase_order_status': instance.purchaseOrderStatus,
    };
