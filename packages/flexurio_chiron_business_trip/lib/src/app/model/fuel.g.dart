// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FuelImpl _$$FuelImplFromJson(Map<String, dynamic> json) => _$FuelImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      startDate: isoDateToDateTime(json['start_date'] as String?),
      endDate: isoDateToDateTime(json['end_date'] as String?),
      typeFuel: json['type_fuel'] as String,
      brand: json['brand'] as String,
    );

Map<String, dynamic> _$$FuelImplToJson(_$FuelImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'type_fuel': instance.typeFuel,
      'brand': instance.brand,
    };
