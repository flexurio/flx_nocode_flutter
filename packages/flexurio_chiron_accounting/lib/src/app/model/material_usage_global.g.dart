// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_usage_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialUsageGlobalImpl _$$MaterialUsageGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialUsageGlobalImpl(
      materialIssueId: json['material_issue_id'] as String,
      description: json['description'] as String,
      materialIssueDate:
          isoDateToDateTime(json['material_issue_date'] as String?),
      totalPrice: (json['total_price'] as num).toInt(),
      subtotalSummary: (json['subtotal_summary'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialUsageGlobalImplToJson(
        _$MaterialUsageGlobalImpl instance) =>
    <String, dynamic>{
      'material_issue_id': instance.materialIssueId,
      'description': instance.description,
      'material_issue_date': instance.materialIssueDate.toIso8601String(),
      'total_price': instance.totalPrice,
      'subtotal_summary': instance.subtotalSummary,
    };
