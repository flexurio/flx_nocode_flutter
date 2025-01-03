// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_issue_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialIssueReportImpl _$$MaterialIssueReportImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIssueReportImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      expiredDate: json['expired_date'] as String,
      unit: json['unit'] as String,
      quantity: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialIssueReportImplToJson(
        _$MaterialIssueReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'expired_date': instance.expiredDate,
      'unit': instance.unit,
      'qty': instance.quantity,
    };
