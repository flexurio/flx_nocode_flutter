import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_routine.freezed.dart';
part 'transaction_routine.g.dart';

enum TransactionRoutineDk implements ColorType {
  kredit('K', 'KREDIT', Colors.orange),
  debit('D', 'DEBIT', Colors.green);

  const TransactionRoutineDk(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static TransactionRoutineDk fromString(String id) {
    if (id == TransactionRoutineDk.kredit.id) {
      return TransactionRoutineDk.kredit;
    }
    if (id == TransactionRoutineDk.debit.id) {
      return TransactionRoutineDk.debit;
    }
    throw ArgumentError();
  }
}

@freezed
class TransactionRoutine with _$TransactionRoutine {
  factory TransactionRoutine(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updatedById,
    int id,
    String title,
    @JsonKey(name: 'chart_of_account_id') String chartOfAccountNo,
    String unique,
    double value,
    @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
    TransactionRoutineDk dk,
    String code,
    @JsonKey(name: 'is_auto', defaultValue: false) bool isAuto,
    String minute,
    String hour,
    @JsonKey(name: 'day_month') String dayMonth,
    String month,
    @JsonKey(name: 'day_week') String dayWeek,
    @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
    @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
    DateTime lastActiveDate,
    @JsonKey(name: 'department_id', fromJson: Department.fromJson)
    Department department,
    @JsonKey(name: 'material_id') String materialId,
    String description,
    String reference,
  ) = _TransactionRoutine;

  factory TransactionRoutine.fromJson(Map<String, dynamic> json) =>
      _$TransactionRoutineFromJson(json);
  const TransactionRoutine._();
}

class TransactionRoutineHeader {
  TransactionRoutineHeader({
    this.title,
    this.code,
    this.isActive,
    this.date,
    this.week,
    this.month,
    this.department,
    this.reference,
  });

  final String? title;
  final String? code;
  final bool? isActive;
  final String? date;
  final String? week;
  final String? month;
  final Department? department;
  final String? reference;
}

class TransactionRoutineDetail {
  TransactionRoutineDetail({
    this.chartOfAccountNo,
    this.unique,
    this.value,
    this.category,
    this.description,
    this.material,
  });

  final String? chartOfAccountNo;
  final String? unique;
  final double? value;
  final TransactionRoutineDk? category;
  final String? description;
  final String? material;
}
