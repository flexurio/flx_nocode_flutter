// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_invoice_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxInvoiceNumberImpl _$$TaxInvoiceNumberImplFromJson(
        Map<String, dynamic> json) =>
    _$TaxInvoiceNumberImpl(
      json['year'] as String,
      json['prefix'] as String,
      (json['sequence'] as num).toInt(),
      (json['id'] as num).toInt(),
      (json['min_value'] as num).toInt(),
      (json['max_value'] as num).toInt(),
      json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$$TaxInvoiceNumberImplToJson(
        _$TaxInvoiceNumberImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'prefix': instance.prefix,
      'sequence': instance.sequence,
      'id': instance.id,
      'min_value': instance.minValue,
      'max_value': instance.maxValue,
      'is_active': instance.isActive,
    };
