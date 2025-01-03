// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_detail_receivable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDetailReceivableImpl _$$PaymentDetailReceivableImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentDetailReceivableImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      paymentId: json['payment_id'] as String,
      transactionId: json['transaction_id'] as String,
      invoiceNo: json['invoice_no'] as String?,
      chartOfAccountId: json['chart_of_account_id'] as String?,
      chartOfAccountName: json['chart_of_account_name'] as String?,
      tb: json['tb'] as bool,
      description: json['description'] as String,
      deliveryAddressId: json['delivery_address_id'] as String,
      deliveryAddressName: json['delivery_address_name'] as String,
      deliveryAddress: json['delivery_address'] as String,
      deliveryAddressCity: json['delivery_address_city'] as String,
      amount: (json['value'] as num).toDouble(),
      paymentTotal: (json['payment_total'] as num).toDouble(),
      paymentRemark: json['payment_remark'] as String,
      paymentChartOfAccountRepayment:
          json['payment_chart_of_account_repayment'] as String,
    );

Map<String, dynamic> _$$PaymentDetailReceivableImplToJson(
        _$PaymentDetailReceivableImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'payment_id': instance.paymentId,
      'transaction_id': instance.transactionId,
      'invoice_no': instance.invoiceNo,
      'chart_of_account_id': instance.chartOfAccountId,
      'chart_of_account_name': instance.chartOfAccountName,
      'tb': instance.tb,
      'description': instance.description,
      'delivery_address_id': instance.deliveryAddressId,
      'delivery_address_name': instance.deliveryAddressName,
      'delivery_address': instance.deliveryAddress,
      'delivery_address_city': instance.deliveryAddressCity,
      'value': instance.amount,
      'payment_total': instance.paymentTotal,
      'payment_remark': instance.paymentRemark,
      'payment_chart_of_account_repayment':
          instance.paymentChartOfAccountRepayment,
    };
