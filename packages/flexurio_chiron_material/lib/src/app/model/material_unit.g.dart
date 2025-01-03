// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUnitImpl _$$MaterialUnitImplFromJson(Map<String, dynamic> json) =>
    _$MaterialUnitImpl(
      id: json['id'] as String,
      createdById: (json['created_by_id'] as num).toInt(),
      type: _materialUnitTypeFromString(json['type'] as String),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialUnitImplToJson(_$MaterialUnitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'type': _$MaterialUnitTypeEnumMap[instance.type]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
    };

const _$MaterialUnitTypeEnumMap = {
  MaterialUnitType.general: 'general',
  MaterialUnitType.material: 'material',
  MaterialUnitType.asset: 'asset',
  MaterialUnitType.empty: 'empty',
  MaterialUnitType.produk: 'produk',
  MaterialUnitType.product: 'product',
};
