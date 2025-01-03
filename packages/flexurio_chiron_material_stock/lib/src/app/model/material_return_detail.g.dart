// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnDetailImpl _$$MaterialReturnDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReturnDetailImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      na: json['na'] as String,
      warehouse: Warehouse.fromString(json['warehouse'] as String),
      materialReturn: MaterialReturn.fromJson(
          json['material_return'] as Map<String, dynamic>),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
    );

Map<String, dynamic> _$$MaterialReturnDetailImplToJson(
        _$MaterialReturnDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'na': instance.na,
      'warehouse': _$WarehouseEnumMap[instance.warehouse]!,
      'material_return': instance.materialReturn,
      'material': instance.material,
      'material_unit': instance.materialUnit,
      'created_at': instance.createdAt.toIso8601String(),
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
