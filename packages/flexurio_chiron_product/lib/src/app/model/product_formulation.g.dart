// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_formulation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFormulationImpl _$$ProductFormulationImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductFormulationImpl(
      (json['id'] as num).toInt(),
      json['description'] as String?,
      json['name'] as String?,
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      _typeFromString(json['type'] as String),
      (json['quantity'] as num).toDouble(),
      _scaleFromString(json['scale'] as String),
      json['is_confirm'] as bool? ?? false,
      json['is_active'] as bool? ?? false,
      Product.fromJson(json['product'] as Map<String, dynamic>),
      json['unit'] as String,
    );

Map<String, dynamic> _$$ProductFormulationImplToJson(
        _$ProductFormulationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'type': _$ProductFormulationTypeEnumMap[instance.type]!,
      'quantity': instance.quantity,
      'scale': _$ProductFormulationScaleEnumMap[instance.scale]!,
      'is_confirm': instance.isConfirm,
      'is_active': instance.isActive,
      'product': instance.product,
      'unit': instance.unit,
    };

const _$ProductFormulationTypeEnumMap = {
  ProductFormulationType.baku: 'baku',
  ProductFormulationType.bantu: 'bantu',
  ProductFormulationType.kemasan: 'kemasan',
  ProductFormulationType.coating: 'coating',
  ProductFormulationType.isEmpty: 'isEmpty',
};

const _$ProductFormulationScaleEnumMap = {
  ProductFormulationScale.produksi: 'produksi',
  ProductFormulationScale.tollOut: 'tollOut',
  ProductFormulationScale.pilot: 'pilot',
  ProductFormulationScale.pilotTollOut: 'pilotTollOut',
  ProductFormulationScale.isEmpty: 'isEmpty',
};
