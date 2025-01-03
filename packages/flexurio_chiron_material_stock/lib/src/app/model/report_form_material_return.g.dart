// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_form_material_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportFormMaterialReturnImpl _$$ReportFormMaterialReturnImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportFormMaterialReturnImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      na: json['na'] as String,
      designCode: json['design_code'] as String?,
      warehouse: Warehouse.fromString(json['warehouse'] as String),
      materialReturn: MaterialReturn.fromJson(
          json['material_return'] as Map<String, dynamic>),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$ReportFormMaterialReturnImplToJson(
        _$ReportFormMaterialReturnImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'na': instance.na,
      'design_code': instance.designCode,
      'warehouse': _$WarehouseEnumMap[instance.warehouse]!,
      'material_return': instance.materialReturn,
      'material': instance.material,
      'material_unit': instance.materialUnit,
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
