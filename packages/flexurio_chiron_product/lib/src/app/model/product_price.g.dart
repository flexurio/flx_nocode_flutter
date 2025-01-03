// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPriceImpl _$$ProductPriceImplFromJson(Map<String, dynamic> json) =>
    _$ProductPriceImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updateAt: isoDateToDateTime(json['updated_at'] as String?),
      startDate: isoDateToDateTime(json['start_date'] as String?),
      endDate: dateTimeNullable(json['end_date'] as String?),
      price: (json['product_price'] as num).toDouble(),
      bonusPrice: (json['bonus_price'] as num).toDouble(),
      primaryPrice: (json['primary_price'] as num).toDouble(),
      stripPrice: (json['strip_price'] as num).toDouble(),
      tabletPrice: (json['tablet_price'] as num).toDouble(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      isUsed: json['is_used'] as bool,
      stripHpp: (json['strip_hpp'] as num).toDouble(),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProductPriceImplToJson(_$ProductPriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updateAt.toIso8601String(),
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'product_price': instance.price,
      'bonus_price': instance.bonusPrice,
      'primary_price': instance.primaryPrice,
      'strip_price': instance.stripPrice,
      'tablet_price': instance.tabletPrice,
      'product': instance.product,
      'is_used': instance.isUsed,
      'strip_hpp': instance.stripHpp,
      'currency': instance.currency,
      'name': instance.name,
    };
