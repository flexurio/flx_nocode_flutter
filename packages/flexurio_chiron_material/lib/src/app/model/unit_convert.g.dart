// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_convert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnitConvertImpl _$$UnitConvertImplFromJson(Map<String, dynamic> json) =>
    _$UnitConvertImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      formula: json['convert_formula'] as String,
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      convertUnit:
          MaterialUnit.fromJson(json['converted_unit'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$UnitConvertImplToJson(_$UnitConvertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'convert_formula': instance.formula,
      'material_unit': instance.materialUnit,
      'converted_unit': instance.convertUnit,
    };
