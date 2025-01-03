// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_issue_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialIssueDetailImpl _$$MaterialIssueDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIssueDetailImpl(
      id: (json['id'] as num).toInt(),
      na: json['na'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      materialIssue: MaterialIssue.fromJson(
          json['material_issue'] as Map<String, dynamic>),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      warehouse: Warehouse.fromString(json['warehouse'] as String),
      weightedQuantity: (json['weighted_quantity'] as num).toDouble(),
      weightedUnit: json['weighted_unit'] as String,
      designCode: json['design_code'] as String?,
      quantityRequired: (json['quantity_required'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialIssueDetailImplToJson(
        _$MaterialIssueDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'na': instance.na,
      'quantity': instance.quantity,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'material_issue': instance.materialIssue,
      'material': instance.material,
      'material_unit': instance.materialUnit,
      'warehouse': _$WarehouseEnumMap[instance.warehouse]!,
      'weighted_quantity': instance.weightedQuantity,
      'weighted_unit': instance.weightedUnit,
      'design_code': instance.designCode,
      'quantity_required': instance.quantityRequired,
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
