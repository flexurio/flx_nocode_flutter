// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDetailImpl _$$PaymentDetailImplFromJson(Map<String, dynamic> json) =>
    _$PaymentDetailImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      transactionId: json['transaction_id'] as String,
      amount: (json['value'] as num).toDouble(),
      chartOfAccount: ChartOfAccountNumber.fromJson(
          json['chart_of_account'] as Map<String, dynamic>),
      description: json['description'] as String,
      invoiceNo: json['invoice_no'] as String?,
    );

Map<String, dynamic> _$$PaymentDetailImplToJson(_$PaymentDetailImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'value': instance.amount,
      'chart_of_account': instance.chartOfAccount,
      'description': instance.description,
      'invoice_no': instance.invoiceNo,
    };
