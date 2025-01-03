// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receive_by_na.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiveByNaImpl _$$MaterialReceiveByNaImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReceiveByNaImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      deliveryOrderId: json['delivery_order_id'] as String? ?? '',
      materialId: json['material_id'] as String? ?? '',
      materialName: json['material_name'] as String? ?? '',
      materialGroupId: json['material_group_id'] as String? ?? '',
      designCodeId: (json['design_code_id'] as num?)?.toInt() ?? 0,
      totalQty: json['total_quantity'] as num? ?? 0,
      vatTotal: json['vat_total'] as num? ?? 0,
      materialUnitId: json['material_unit_id'] as String? ?? '',
      na: json['na'] as String? ?? '',
      purchaseOrderId: json['purchase_order_id'] as String? ?? '',
      batchNo: json['batch_no'] as String? ?? '',
      materialStatus: MaterialReceiveDetailStatus.fromString(
          json['material_status_qc'] as String),
    );

Map<String, dynamic> _$$MaterialReceiveByNaImplToJson(
        _$MaterialReceiveByNaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'delivery_order_id': instance.deliveryOrderId,
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'material_group_id': instance.materialGroupId,
      'design_code_id': instance.designCodeId,
      'total_quantity': instance.totalQty,
      'vat_total': instance.vatTotal,
      'material_unit_id': instance.materialUnitId,
      'na': instance.na,
      'purchase_order_id': instance.purchaseOrderId,
      'batch_no': instance.batchNo,
      'material_status_qc':
          _$MaterialReceiveDetailStatusEnumMap[instance.materialStatus]!,
    };

const _$MaterialReceiveDetailStatusEnumMap = {
  MaterialReceiveDetailStatus.empty: 'empty',
  MaterialReceiveDetailStatus.release: 'release',
  MaterialReceiveDetailStatus.quarantine: 'quarantine',
  MaterialReceiveDetailStatus.reject: 'reject',
};
