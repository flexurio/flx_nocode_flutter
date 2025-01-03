// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recap_product_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecapProductStockImpl _$$RecapProductStockImplFromJson(
        Map<String, dynamic> json) =>
    _$RecapProductStockImpl(
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      periodFromJson(json['period'] as String),
      (json['qty_quarantine'] as num).toInt(),
      (json['qty_release'] as num).toInt(),
      (json['qty_reject'] as num).toInt(),
      RecapProductStockWarehouse.fromString(json['warehouse'] as String),
      ProductGroup.fromJson(json['product_group'] as Map<String, dynamic>),
      Product.fromJson(json['product'] as Map<String, dynamic>),
      ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$RecapProductStockImplToJson(
        _$RecapProductStockImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'period': instance.period.toIso8601String(),
      'qty_quarantine': instance.qtyQuarantine,
      'qty_release': instance.qtyRelease,
      'qty_reject': instance.qtyReject,
      'warehouse': _$RecapProductStockWarehouseEnumMap[instance.warehouse]!,
      'product_group': instance.productGroup,
      'product': instance.product,
      'batch_no': instance.productionOrder,
      'unit': instance.unit,
    };

const _$RecapProductStockWarehouseEnumMap = {
  RecapProductStockWarehouse.empty: 'empty',
  RecapProductStockWarehouse.ppic: 'ppic',
  RecapProductStockWarehouse.ruahan: 'ruahan',
  RecapProductStockWarehouse.produkJadi: 'produkJadi',
  RecapProductStockWarehouse.alkes: 'alkes',
};
