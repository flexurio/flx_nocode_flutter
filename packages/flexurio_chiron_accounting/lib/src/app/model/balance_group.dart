import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'balance_group.freezed.dart';
part 'balance_group.g.dart';

enum BalanceGroupType implements ColorType {
  empty('', Colors.transparent),
  debt('DEBT', Colors.orange),
  debit('DEBIT', Colors.orange),
  credit('CREDIT', Colors.green);

  const BalanceGroupType(this.type, this.color);

  @override
  String get label => type;

  @override
  final Color color;
  final String type;
}

enum BalanceGroupCategory implements ColorType {
  empty('', '', Colors.transparent),
  balanceSheet('BALANCE SHEET', 'BALANCE SHEET', Colors.blueAccent),
  profitAndLoss('PROFIT And LOSS', 'PROFIT And LOSS', Colors.purpleAccent),
  profitLoss('PROFIT LOSS', 'PROFIT LOSS', Colors.purpleAccent);

  const BalanceGroupCategory(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;
}

enum BalanceGroupName implements ColorType {
  empty('', Colors.transparent),
  aktiva('AKTIVA', Colors.orange),
  costOfGoodsSold('COST OF GOODS SOLD', Colors.green),
  expense('EXPENSE', Colors.blue),
  modal('MODAL', Colors.red),
  otherIncomeExpense('OTHER INCOME & EXPENSE', Colors.teal),
  pasiva('PASIVA', Colors.deepPurple),
  sales('SALES', Colors.indigo);

  const BalanceGroupName(this.name, this.color);

  @override
  String get label => name;

  @override
  final Color color;
  final String name;
}

@freezed
class BalanceGroup with _$BalanceGroup {
  const factory BalanceGroup({
    required String id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
    required BalanceGroupType type,
    @JsonKey(
      name: 'category',
      fromJson: _balanceGroupCategoryFromString,
    )
    required BalanceGroupCategory profitAndLossBalance,
  }) = _BalanceGroup;
  const BalanceGroup._();

  factory BalanceGroup.fromJson(Map<String, Object?> json) =>
      _$BalanceGroupFromJson(json);

  factory BalanceGroup.empty() => BalanceGroup(
        id: '',
        createdById: 0,
        createdAt: DateTime.now(),
        updatedById: 0,
        updatedAt: DateTime.now(),
        name: '',
        type: BalanceGroupType.empty,
        profitAndLossBalance: BalanceGroupCategory.empty,
      );
}

BalanceGroupType _balanceGroupTypeFromString(String type) {
  if (type == BalanceGroupType.credit.type) {
    return BalanceGroupType.credit;
  }
  if (type == BalanceGroupType.debit.type) {
    return BalanceGroupType.debit;
  }
  if (type == BalanceGroupType.debt.type) {
    return BalanceGroupType.debt;
  }
  return BalanceGroupType.empty;
}

BalanceGroupCategory _balanceGroupCategoryFromString(String id) {
  if (id == BalanceGroupCategory.balanceSheet.id) {
    return BalanceGroupCategory.balanceSheet;
  }
  if (id == BalanceGroupCategory.profitLoss.id) {
    return BalanceGroupCategory.profitLoss;
  }
  if (id == BalanceGroupCategory.profitAndLoss.id) {
    return BalanceGroupCategory.profitAndLoss;
  }
  return BalanceGroupCategory.empty;
}

BalanceGroupName _balanceGroupNameFromString(String name) {
  if (name == BalanceGroupName.aktiva.name) {
    return BalanceGroupName.aktiva;
  }
  if (name == BalanceGroupName.costOfGoodsSold.name) {
    return BalanceGroupName.costOfGoodsSold;
  }
  if (name == BalanceGroupName.expense.name) {
    return BalanceGroupName.expense;
  }
  if (name == BalanceGroupName.modal.name) {
    return BalanceGroupName.modal;
  }
  if (name == BalanceGroupName.otherIncomeExpense.name) {
    return BalanceGroupName.otherIncomeExpense;
  }
  if (name == BalanceGroupName.pasiva.name) {
    return BalanceGroupName.pasiva;
  }
  if (name == BalanceGroupName.sales.name) {
    return BalanceGroupName.sales;
  }
  return BalanceGroupName.empty;
}
