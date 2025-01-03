// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      id: json['id'] as String,
      date: isoDateToDateTime(json['date'] as String?),
      type: PaymentType.fromString(json['type'] as String),
      totalAmount: (json['total'] as num).toDouble(),
      kuCost: (json['ku_cost'] as num).toDouble(),
      stampCost: (json['stamp_cost'] as num).toDouble(),
      rounding: (json['rounding'] as num).toDouble(),
      artCost: (json['art_cost'] as num).toDouble(),
      otherCost: (json['other_cost'] as num).toDouble(),
      rateGap: (json['rate_gap'] as num).toDouble(),
      downPayment: (json['down_payment'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      accountAmount: (json['account_value'] as num).toDouble(),
      remark: json['remark'] as String,
      chartOfAccountRepayment: json['chart_of_account_repayment'] as String?,
      chartOfAccount: ChartOfAccountNumber.fromJson(
          json['chart_of_account'] as Map<String, dynamic>),
      tb: json['tb'] as bool?,
      partnerId: json['partner_id'] as String?,
      partnerName: json['partner_name'] as String?,
      paidReceivableNo: json['paid_receivable_no'] as String?,
      transactionCode: json['transaction_code'] as String?,
      accountName: json['account_name'] as String? ?? '',
      accountNumber: json['account_number'] as String? ?? '',
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'type': _$PaymentTypeEnumMap[instance.type]!,
      'total': instance.totalAmount,
      'ku_cost': instance.kuCost,
      'stamp_cost': instance.stampCost,
      'rounding': instance.rounding,
      'art_cost': instance.artCost,
      'other_cost': instance.otherCost,
      'rate_gap': instance.rateGap,
      'down_payment': instance.downPayment,
      'rate': instance.rate,
      'department': instance.department,
      'account_value': instance.accountAmount,
      'remark': instance.remark,
      'chart_of_account_repayment': instance.chartOfAccountRepayment,
      'chart_of_account': instance.chartOfAccount,
      'tb': instance.tb,
      'partner_id': instance.partnerId,
      'partner_name': instance.partnerName,
      'paid_receivable_no': instance.paidReceivableNo,
      'transaction_code': instance.transactionCode,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
    };

const _$PaymentTypeEnumMap = {
  PaymentType.cash: 'cash',
  PaymentType.transfer: 'transfer',
  PaymentType.sales: 'sales',
  PaymentType.current: 'current',
  PaymentType.others: 'others',
  PaymentType.empty: 'empty',
};
