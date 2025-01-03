// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivableGlobalImpl _$$AccountsReceivableGlobalImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsReceivableGlobalImpl(
      customer: json['customer'] as String,
      addressCustomer: json['address_customer'] as String,
      totalCustomer: (json['total_customer'] as num).toInt(),
      cityCustomer: json['city_customer'] as String?,
    );

Map<String, dynamic> _$$AccountsReceivableGlobalImplToJson(
        _$AccountsReceivableGlobalImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'address_customer': instance.addressCustomer,
      'total_customer': instance.totalCustomer,
      'city_customer': instance.cityCustomer,
    };
