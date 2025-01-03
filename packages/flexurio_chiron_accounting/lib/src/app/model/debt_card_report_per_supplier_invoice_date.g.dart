// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debt_card_report_per_supplier_invoice_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DebtCardReportPerSupplierInvoiceDateImpl
    _$$DebtCardReportPerSupplierInvoiceDateImplFromJson(
            Map<String, dynamic> json) =>
        _$DebtCardReportPerSupplierInvoiceDateImpl(
          transactionDate:
              isoDateToDateTime(json['transaction_date'] as String?),
          value: (json['value'] as num).toDouble(),
          valuePayment: (json['value_payment'] as num).toInt(),
          remainingAmountPaid: (json['remaining_amount_paid'] as num).toInt(),
          remainingAmount: (json['remaining_amount'] as num).toInt(),
          beginningBalance: (json['beginning_balance'] as num).toDouble(),
          endingBalance: (json['ending_balance'] as num).toDouble(),
          debitBalance: (json['debit_balance'] as num).toInt(),
          creditBalance: (json['credit_balance'] as num).toInt(),
          ance: json['ance'],
          description: json['description'] as String?,
          paymentNo: json['payment_no'] as String?,
          transactionNo: json['transaction_no'] as String?,
        );

Map<String, dynamic> _$$DebtCardReportPerSupplierInvoiceDateImplToJson(
        _$DebtCardReportPerSupplierInvoiceDateImpl instance) =>
    <String, dynamic>{
      'transaction_date': instance.transactionDate.toIso8601String(),
      'value': instance.value,
      'value_payment': instance.valuePayment,
      'remaining_amount_paid': instance.remainingAmountPaid,
      'remaining_amount': instance.remainingAmount,
      'beginning_balance': instance.beginningBalance,
      'ending_balance': instance.endingBalance,
      'debit_balance': instance.debitBalance,
      'credit_balance': instance.creditBalance,
      'ance': instance.ance,
      'description': instance.description,
      'payment_no': instance.paymentNo,
      'transaction_no': instance.transactionNo,
    };
