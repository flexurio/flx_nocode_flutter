// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_loans_borrowings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialLoansBorrowingsImpl _$$MaterialLoansBorrowingsImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialLoansBorrowingsImpl(
      valueSummary: (json['value_summary'] as num).toInt(),
      materialIssueTypeId: json['material_issue_type_id'] as String?,
      materialIssueTypeName: json['material_issue_type_name'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MaterialLoansBorrowingsImplToJson(
        _$MaterialLoansBorrowingsImpl instance) =>
    <String, dynamic>{
      'value_summary': instance.valueSummary,
      'material_issue_type_id': instance.materialIssueTypeId,
      'material_issue_type_name': instance.materialIssueTypeName,
      'value': instance.value,
    };
