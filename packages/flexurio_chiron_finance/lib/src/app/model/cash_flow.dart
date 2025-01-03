import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cash_flow.freezed.dart';
part 'cash_flow.g.dart';

enum CashFlowStatus implements ColorType {
  open('OPEN', Colors.orange),
  approve('APPROVE', Colors.green),
  empty('', Colors.white);

  const CashFlowStatus(this.status, this.color);

  @override
  String get label => status;

  @override
  final Color color;

  final String status;
}

@freezed
class CashFlow with _$CashFlow {
  const factory CashFlow({
    required DateTime date,
    @JsonKey(name: 'no_transaction') required String noTransaction,
    required String invoice,
    @JsonKey(name: 'rec_from') required String recForm,
    required String description,
    required int amount,
    required String code,
    @JsonKey(name: 'sub_code') required String subCode,
    @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
    required DateTime mutationDate,
    @JsonKey(name: 'transfer_fee') required int transferFee,
    @JsonKey(name: 'total_transfer') required int totalTransfer,
    required String bank,
    @JsonKey(fromJson: _cashFlowStatusFromString)
    required CashFlowStatus status,
  }) = _CashFlow;
  const CashFlow._();

  factory CashFlow.fromJson(Map<String, Object?> json) =>
      _$CashFlowFromJson(json);
}

CashFlowStatus _cashFlowStatusFromString(String type) {
  if (type == CashFlowStatus.approve.status) {
    return CashFlowStatus.approve;
  }
  if (type == CashFlowStatus.open.status) {
    return CashFlowStatus.open;
  }
  if (type == CashFlowStatus.empty.status) {
    return CashFlowStatus.empty;
  }
  throw ArgumentError();
}
