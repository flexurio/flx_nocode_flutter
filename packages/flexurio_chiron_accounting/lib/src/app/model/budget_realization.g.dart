// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_realization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetRealizationImpl _$$BudgetRealizationImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetRealizationImpl(
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      period: json['period'] as String,
      postBudget: json['post_budget'] as String,
      generalManager: json['general_manager'] as String,
      january: json['january'] as String,
      february: json['february'] as String,
      march: json['march'] as String,
      april: json['april'] as String,
      may: json['may'] as String,
      june: json['june'] as String,
      july: json['july'] as String,
      august: json['august'] as String,
      september: json['september'] as String,
      october: json['october'] as String,
      november: json['november'] as String,
      december: json['december'] as String,
      yearToDate: json['year_to_date'] as String,
    );

Map<String, dynamic> _$$BudgetRealizationImplToJson(
        _$BudgetRealizationImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'period': instance.period,
      'post_budget': instance.postBudget,
      'general_manager': instance.generalManager,
      'january': instance.january,
      'february': instance.february,
      'march': instance.march,
      'april': instance.april,
      'may': instance.may,
      'june': instance.june,
      'july': instance.july,
      'august': instance.august,
      'september': instance.september,
      'october': instance.october,
      'november': instance.november,
      'december': instance.december,
      'year_to_date': instance.yearToDate,
    };
