import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_non_order.freezed.dart';
part 'transaction_non_order.g.dart';

enum TransactionNonOrderType implements ColorType {
  empty('', Colors.transparent),
  penjualan('PENJUALAN', Colors.purple),
  pelunasan('PELUNASAN', Colors.green),
  payment('PAYMENT', Colors.teal),
  pembelian('PEMBELIAN', Colors.blue);

  const TransactionNonOrderType(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<TransactionNonOrderType> get list => [
        TransactionNonOrderType.penjualan,
        TransactionNonOrderType.pelunasan,
        TransactionNonOrderType.pembelian,
      ];

  static TransactionNonOrderType fromString(String id) {
    if (id == TransactionNonOrderType.penjualan.id) {
      return TransactionNonOrderType.penjualan;
    }
    if (id == TransactionNonOrderType.pelunasan.id) {
      return TransactionNonOrderType.pelunasan;
    }
    if (id == TransactionNonOrderType.pembelian.id) {
      return TransactionNonOrderType.pembelian;
    }
    if (id == TransactionNonOrderType.payment.id) {
      return TransactionNonOrderType.payment;
    }
    return TransactionNonOrderType.empty;
  }
}

@freezed
class TransactionNonOrder with _$TransactionNonOrder {
  factory TransactionNonOrder({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    required String title,
    @JsonKey(name: 'chart_of_account_id') required String chartOfAccountNo,
    required String unique,
    required double value,
    @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
    required TransactionNonOrderType type,
  }) = _TransactionNonOrder;
  const TransactionNonOrder._();

  factory TransactionNonOrder.fromJson(Map<String, dynamic> json) =>
      _$TransactionNonOrderFromJson(json);
}
