// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_form_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestFormMaterialImpl _$$RequestFormMaterialImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestFormMaterialImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isMaterialType: json['is_material_type'] as bool,
    );

Map<String, dynamic> _$$RequestFormMaterialImplToJson(
        _$RequestFormMaterialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_material_type': instance.isMaterialType,
    };
