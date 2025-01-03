// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnCheckImpl _$$ProductReturnCheckImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReturnCheckImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      productReturnId: ProductReturn.fromJson(
          json['product_return_id'] as Map<String, dynamic>),
      productId: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      batch: ProductionOrder.fromJson(json['batch'] as Map<String, dynamic>),
      unitId: MaterialUnit.fromJson(json['unit_id'] as Map<String, Object?>),
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String,
      status: ProductReturnCheckStatus.fromString(json['status'] as String),
      qtyWarehouseReturn: (json['quantity_warehouse_return'] as num).toInt(),
      qtyWarehouseRemaining:
          (json['quantity_warehouse_remaining'] as num).toInt(),
      qtyOutReturn: (json['quantity_out_return'] as num).toInt(),
      qtyOutRemaining: (json['quantity_out_remaining'] as num).toInt(),
      qualityCheckById: (json['quality_assurance_check_by_id'] as num).toInt(),
      qualityCheckDate:
          isoDateToDateTime(json['quality_assurance_check_date'] as String?),
    );

Map<String, dynamic> _$$ProductReturnCheckImplToJson(
        _$ProductReturnCheckImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'product_return_id': instance.productReturnId,
      'product_id': instance.productId,
      'batch': instance.batch,
      'unit_id': instance.unitId,
      'quantity': instance.quantity,
      'description': instance.description,
      'status': _$ProductReturnCheckStatusEnumMap[instance.status]!,
      'quantity_warehouse_return': instance.qtyWarehouseReturn,
      'quantity_warehouse_remaining': instance.qtyWarehouseRemaining,
      'quantity_out_return': instance.qtyOutReturn,
      'quantity_out_remaining': instance.qtyOutRemaining,
      'quality_assurance_check_by_id': instance.qualityCheckById,
      'quality_assurance_check_date':
          instance.qualityCheckDate.toIso8601String(),
    };

const _$ProductReturnCheckStatusEnumMap = {
  ProductReturnCheckStatus.empty: 'empty',
  ProductReturnCheckStatus.shouldNotReturn: 'shouldNotReturn',
  ProductReturnCheckStatus.qcCheck: 'qcCheck',
  ProductReturnCheckStatus.releaseToClinic: 'releaseToClinic',
  ProductReturnCheckStatus.releaseToLab: 'releaseToLab',
};
