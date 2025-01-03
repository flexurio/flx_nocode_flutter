// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_receivable_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountsReceivableGroupImpl _$$AccountsReceivableGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountsReceivableGroupImpl(
      id: json['id'] as String,
      nameDeliveryAddress: json['name_delivery_address'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      cityDeliveryAddress: json['city_delivery_address'] as String?,
      paymentAmount: (json['payment_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AccountsReceivableGroupImplToJson(
        _$AccountsReceivableGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_delivery_address': instance.nameDeliveryAddress,
      'date': instance.date.toIso8601String(),
      'due_date': instance.dueDate.toIso8601String(),
      'city_delivery_address': instance.cityDeliveryAddress,
      'payment_amount': instance.paymentAmount,
    };
