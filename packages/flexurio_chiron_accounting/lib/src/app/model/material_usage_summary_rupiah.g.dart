// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_summary_rupiah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageSummaryRupiahImpl _$$MaterialUsageSummaryRupiahImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageSummaryRupiahImpl(
      materialIssueTypeId: json['material_issue_type_id'] as String,
      materialIssueTypeName: json['material_issue_type_name'] as String,
      value: (json['value'] as num).toInt(),
      valueSummary: (json['value_summary'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialUsageSummaryRupiahImplToJson(
        _$MaterialUsageSummaryRupiahImpl instance) =>
    <String, dynamic>{
      'material_issue_type_id': instance.materialIssueTypeId,
      'material_issue_type_name': instance.materialIssueTypeName,
      'value': instance.value,
      'value_summary': instance.valueSummary,
    };
