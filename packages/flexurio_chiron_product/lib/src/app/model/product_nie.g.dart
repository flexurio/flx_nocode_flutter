// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_nie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductNieImpl _$$ProductNieImplFromJson(Map<String, dynamic> json) =>
    _$ProductNieImpl(
      id: json['id'] as String,
      createAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      periodStart: isoDateToDateTime(json['start_period'] as String?),
      periodEnd: isoDateToDateTime(json['end_period'] as String?),
      publisher: json['publisher'] as String,
      category: ProductNieCategory.fromString(json['category'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductNieImplToJson(_$ProductNieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'start_period': instance.periodStart.toIso8601String(),
      'end_period': instance.periodEnd.toIso8601String(),
      'publisher': instance.publisher,
      'category': _$ProductNieCategoryEnumMap[instance.category]!,
      'product': instance.product,
    };

const _$ProductNieCategoryEnumMap = {
  ProductNieCategory.empty: 'empty',
  ProductNieCategory.kosmetik: 'kosmetik',
  ProductNieCategory.ot: 'ot',
  ProductNieCategory.sk: 'sk',
  ProductNieCategory.obat: 'obat',
  ProductNieCategory.kuasi: 'kuasi',
  ProductNieCategory.alkes: 'alkes',
  ProductNieCategory.pangan: 'pangan',
};
