// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerDiscountImpl _$$CustomerDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerDiscountImpl(
      id: (json['id'] as num).toInt(),
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      startDate: isoDateToDateTime(json['start_date'] as String?),
      endDate: dateTimeNullable(json['end_date'] as String?),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CustomerDiscountImplToJson(
        _$CustomerDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'customer': instance.customer,
      'discount': instance.discount,
    };
