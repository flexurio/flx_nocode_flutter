// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_formulation_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFormulationDetailImpl _$$ProductFormulationDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductFormulationDetailImpl(
      (json['id'] as num).toInt(),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['quantity'] as num).toDouble(),
      Material.fromJson(json['material'] as Map<String, Object?>),
      ProductFormulation.fromJson(json['formulation'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$ProductFormulationDetailImplToJson(
        _$ProductFormulationDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'quantity': instance.quantity,
      'material': instance.material,
      'formulation': instance.formulation,
    };
