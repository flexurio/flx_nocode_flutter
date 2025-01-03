// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      cityName: json['city_name'] as String,
      countryName: json['country_name'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      fax: json['fax'] as String,
      pic: json['pic'] as String,
      email: json['email'] as String,
      npwp: json['npwp'] as String,
      nppkp: json['nppkp'] as String,
      province: json['province'] as String,
      parent: json['parent'] as String?,
      customerType: _customerTypeFromString(json['customer_type'] as String?),
      customerCategory:
          _customerCategoryFromString(json['customer_category'] as String?),
      postalCode: (json['postal_code'] as num?)?.toInt() ?? 0,
      isAdministration: json['is_administration'] as bool? ?? false,
      termOfPayment: (json['term_of_payment'] as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'city_name': instance.cityName,
      'country_name': instance.countryName,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'fax': instance.fax,
      'pic': instance.pic,
      'email': instance.email,
      'npwp': instance.npwp,
      'nppkp': instance.nppkp,
      'province': instance.province,
      'parent': instance.parent,
      'customer_type': _$CustomerTypeEnumMap[instance.customerType]!,
      'customer_category':
          _$CustomerCategoryEnumMap[instance.customerCategory]!,
      'postal_code': instance.postalCode,
      'is_administration': instance.isAdministration,
      'term_of_payment': instance.termOfPayment,
      'discount': instance.discount,
    };

const _$CustomerTypeEnumMap = {
  CustomerType.empty: 'empty',
  CustomerType.tu: 'tu',
  CustomerType.nonTu: 'nonTu',
};

const _$CustomerCategoryEnumMap = {
  CustomerCategory.empty: 'empty',
  CustomerCategory.cash: 'cash',
  CustomerCategory.export: 'export',
  CustomerCategory.tokoObat: 'tokoObat',
  CustomerCategory.ybcr: 'ybcr',
  CustomerCategory.pbf: 'pbf',
};
