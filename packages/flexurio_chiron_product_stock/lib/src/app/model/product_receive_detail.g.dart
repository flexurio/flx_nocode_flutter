// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_receive_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReceiveDetailImpl _$$ProductReceiveDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReceiveDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      expiredDate: DateTime.parse(json['expired_date'] as String),
      quantity: (json['qty'] as num).toInt(),
      productReceive: ProductReceive.fromJson(
          json['product_received'] as Map<String, dynamic>),
      warehouse: Warehouse.fromString(json['warehouse'] as String),
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      status: ProductReceiveDetailStatus.fromString(json['status'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productionOrder:
          ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      releaseAt: dateTimeNullable(json['release_at'] as String?),
      releaseById: (json['release_by_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductReceiveDetailImplToJson(
        _$ProductReceiveDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'expired_date': instance.expiredDate.toIso8601String(),
      'qty': instance.quantity,
      'product_received': instance.productReceive,
      'warehouse': _$WarehouseEnumMap[instance.warehouse]!,
      'unit': instance.unit,
      'status': _$ProductReceiveDetailStatusEnumMap[instance.status]!,
      'product': instance.product,
      'batch_no': instance.productionOrder,
      'release_at': instance.releaseAt?.toIso8601String(),
      'release_by_id': instance.releaseById,
    };

const _$WarehouseEnumMap = {
  Warehouse.unknown: 'unknown',
  Warehouse.bulk: 'bulk',
  Warehouse.treatment: 'treatment',
  Warehouse.finishedProduct: 'finishedProduct',
  Warehouse.alkes: 'alkes',
  Warehouse.ppic: 'ppic',
  Warehouse.engineering: 'engineering',
  Warehouse.cs: 'cs',
  Warehouse.rnd: 'rnd',
};

const _$ProductReceiveDetailStatusEnumMap = {
  ProductReceiveDetailStatus.empty: 'empty',
  ProductReceiveDetailStatus.reject: 'reject',
  ProductReceiveDetailStatus.quarantine: 'quarantine',
  ProductReceiveDetailStatus.release: 'release',
};
