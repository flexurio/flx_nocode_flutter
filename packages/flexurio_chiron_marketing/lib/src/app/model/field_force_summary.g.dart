// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_force_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FieldForceSummaryImpl _$$FieldForceSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$FieldForceSummaryImpl(
      (json['year'] as num).toInt(),
      (json['month'] as num).toInt(),
      (json['date'] as num).toInt(),
      json['area_code'] as String,
      json['area_boss'] as String,
      json['nip'] as String,
      json['name'] as String,
      _fieldForceSummaryCategoryFromString(json['category'] as String),
      FieldForceSummaryCategorySub.fromString(json['category_sub'] as String),
      json['value'] as String,
      (json['percentage'] as num).toDouble(),
      json['flag1'] as String,
      json['flag1_desc'] as String,
      json['flag2'] as String,
      json['flag2_desc'] as String,
      json['flag3'] as String,
      json['flag3_desc'] as String,
      json['flag4'] as String,
      json['flag4_desc'] as String,
      json['flag5'] as String,
      json['flag5_desc'] as String,
    );

Map<String, dynamic> _$$FieldForceSummaryImplToJson(
        _$FieldForceSummaryImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'date': instance.date,
      'area_code': instance.areaCode,
      'area_boss': instance.areaCodeBoss,
      'nip': instance.nip,
      'name': instance.name,
      'category': _$FieldForceSummaryCategoryEnumMap[instance.category]!,
      'category_sub':
          _$FieldForceSummaryCategorySubEnumMap[instance.categorySub]!,
      'value': instance.amount,
      'percentage': instance.scale,
      'flag1': instance.flag1,
      'flag1_desc': instance.flag1Desc,
      'flag2': instance.flag2,
      'flag2_desc': instance.flag2Desc,
      'flag3': instance.flag3,
      'flag3_desc': instance.flag3Desc,
      'flag4': instance.flag4,
      'flag4_desc': instance.flag4Desc,
      'flag5': instance.flag5,
      'flag5_desc': instance.flag5Desc,
    };

const _$FieldForceSummaryCategoryEnumMap = {
  FieldForceSummaryCategory.sales: 'sales',
  FieldForceSummaryCategory.estimation: 'estimation',
  FieldForceSummaryCategory.target: 'target',
  FieldForceSummaryCategory.call: 'call',
};

const _$FieldForceSummaryCategorySubEnumMap = {
  FieldForceSummaryCategorySub.all: 'all',
  FieldForceSummaryCategorySub.product: 'product',
  FieldForceSummaryCategorySub.customer: 'customer',
  FieldForceSummaryCategorySub.outlet: 'outlet',
  FieldForceSummaryCategorySub.outletProduct: 'outletProduct',
  FieldForceSummaryCategorySub.customerProduct: 'customerProduct',
  FieldForceSummaryCategorySub.customerOutlet: 'customerOutlet',
  FieldForceSummaryCategorySub.customerOutletProduct: 'customerOutletProduct',
  FieldForceSummaryCategorySub.salesDailyNational: 'salesDailyNational',
  FieldForceSummaryCategorySub.targetDailyNational: 'targetDailyNational',
  FieldForceSummaryCategorySub.salesVersusTarget: 'salesVersusTarget',
  FieldForceSummaryCategorySub.deltaCustomer: 'deltaCustomer',
};
