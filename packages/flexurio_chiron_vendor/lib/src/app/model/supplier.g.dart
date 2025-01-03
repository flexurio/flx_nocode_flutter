// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupplierImpl _$$SupplierImplFromJson(Map<String, dynamic> json) =>
    _$SupplierImpl(
      json['id'] as String,
      json['name'] as String,
      json['address'] as String,
      json['city_name'] as String,
      json['country_name'] as String,
      (json['postal_code'] as num).toInt(),
      json['phone'] as String,
      json['fax'] as String,
      json['pic'] as String,
      json['email'] as String,
      json['npwp'] as String,
      (json['term_of_payment'] as num).toInt(),
      isoDateToDateTime(json['created_at'] as String?),
      isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$SupplierImplToJson(_$SupplierImpl instance) =>
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
      'term_of_payment': instance.termOfPayment,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
