// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_form_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestFormDetailImpl _$$RequestFormDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestFormDetailImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      materialRequestFormId: json['material_request_form_id'] as String?,
      isFastTrack: json['is_fast_track'] as bool,
      status: _requestFormDetailStatusFromString(json['status'] as String),
      materialType: MaterialType.fromJsonNullable(json['material_type']),
      material: Material.fromJsonNullable(json['material']),
      materialRequest:
          MaterialRequest.fromJsonNullable(json['material_request']),
      unit: MaterialUnit.fromJsonNullable(json['unit']),
    );

Map<String, dynamic> _$$RequestFormDetailImplToJson(
        _$RequestFormDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'material_request_form_id': instance.materialRequestFormId,
      'is_fast_track': instance.isFastTrack,
      'status': _$RequestFormDetailStatusEnumMap[instance.status]!,
      'material_type': instance.materialType,
      'material': instance.material,
      'material_request': instance.materialRequest,
      'unit': instance.unit,
    };

const _$RequestFormDetailStatusEnumMap = {
  RequestFormDetailStatus.empty: 'empty',
  RequestFormDetailStatus.temporary: 'temporary',
  RequestFormDetailStatus.input: 'input',
  RequestFormDetailStatus.confirm: 'confirm',
  RequestFormDetailStatus.purchaseRequest: 'purchaseRequest',
  RequestFormDetailStatus.po: 'po',
  RequestFormDetailStatus.close: 'close',
  RequestFormDetailStatus.rejectProcurement: 'rejectProcurement',
};
