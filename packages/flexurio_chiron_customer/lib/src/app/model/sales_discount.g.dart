// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesDiscountImpl _$$SalesDiscountImplFromJson(Map<String, dynamic> json) =>
    _$SalesDiscountImpl(
      (json['id'] as num).toInt(),
      (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$$SalesDiscountImplToJson(_$SalesDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discount': instance.discount,
    };
