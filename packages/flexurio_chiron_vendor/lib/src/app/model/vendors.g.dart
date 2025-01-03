// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorsImpl _$$VendorsImplFromJson(Map<String, dynamic> json) =>
    _$VendorsImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city_name'] as String,
      country: json['country_name'] as String,
      postalCode: (json['postal_code'] as num).toInt(),
      phone: json['phone'] as String,
      fax: json['fax'] as String,
      pic: json['pic'] as String,
      email: json['email'] as String,
      npwp: json['npwp'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$VendorsImplToJson(_$VendorsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city_name': instance.city,
      'country_name': instance.country,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'fax': instance.fax,
      'pic': instance.pic,
      'email': instance.email,
      'npwp': instance.npwp,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
