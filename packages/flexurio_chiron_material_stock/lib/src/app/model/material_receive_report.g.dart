// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receive_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiveReportImpl _$$MaterialReceiveReportImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReceiveReportImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      unit: json['unit'] as String,
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialReceiveReportImplToJson(
        _$MaterialReceiveReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'expired_date': instance.expiredDate.toIso8601String(),
      'unit': instance.unit,
      'qty': instance.qty,
    };
