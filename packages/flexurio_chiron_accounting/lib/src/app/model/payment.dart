import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  factory Payment({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(fromJson: PaymentType.fromString) required PaymentType type,
    @JsonKey(name: 'total') required double totalAmount,
    @JsonKey(name: 'ku_cost') required double kuCost,
    @JsonKey(name: 'stamp_cost') required double stampCost,
    required double rounding,
    @JsonKey(name: 'art_cost') required double artCost,
    @JsonKey(name: 'other_cost') required double otherCost,
    @JsonKey(name: 'rate_gap') required double rateGap,
    @JsonKey(name: 'down_payment') required double downPayment,
    required double rate,
    @JsonKey(fromJson: Department.fromJson) required Department? department,
    @JsonKey(name: 'account_value') required double accountAmount,
    required String remark,
    @JsonKey(name: 'chart_of_account_repayment')
    String? chartOfAccountRepayment,
    @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
    required ChartOfAccountNumber chartOfAccount,
    bool? tb,
    @JsonKey(name: 'partner_id') String? partnerId,
    @JsonKey(name: 'partner_name') String? partnerName,
    @JsonKey(name: 'paid_receivable_no') String? paidReceivableNo,
    @JsonKey(name: 'transaction_code') String? transactionCode,
    @JsonKey(name: 'account_name', defaultValue: '')
    required String accountName,
    @JsonKey(name: 'account_number', defaultValue: '')
    required String accountNumber,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  factory Payment.empty() => Payment(
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        id: '',
        date: DateTime(0),
        type: PaymentType.empty,
        totalAmount: 0,
        rate: 0,
        accountAmount: 0,
        remark: '',
        kuCost: 0,
        stampCost: 0,
        rounding: 0,
        artCost: 0,
        otherCost: 0,
        rateGap: 0,
        chartOfAccount: ChartOfAccountNumber.empty(),
        downPayment: 0,
        department: null,
        accountName: '',
        accountNumber: '',
      );

  const Payment._();
}

enum PaymentType implements ColorType {
  cash('CASH', 'Cash', Colors.brown),
  transfer('TRANSFER', 'Transfer', Colors.orange),
  sales('PENJUALAN', 'Sales', Colors.orange),
  current('GIRO', 'Giro', Colors.green),
  others('LAIN LAIN', 'Others', Colors.blue),
  empty('', '', Colors.transparent);

  const PaymentType(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  List<PaymentType> get list =>
      List<PaymentType>.from(values)..remove(PaymentType.empty);

  static PaymentType fromString(String type) {
    if (type == PaymentType.others.id) {
      return PaymentType.others;
    }
    if (type == PaymentType.transfer.id) {
      return PaymentType.transfer;
    }
    if (type == PaymentType.current.id) {
      return PaymentType.current;
    }
    if (type == PaymentType.cash.id) {
      return PaymentType.cash;
    }
    return PaymentType.empty;
  }
}
