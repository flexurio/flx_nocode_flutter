import 'package:equatable/equatable.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_type.freezed.dart';
part 'budget_type.g.dart';

enum BudgetTypeUsageType implements ColorType {
  group('GROUP', Colors.green),
  individual('INDIVIDUAL', Colors.blue),
  masing('MASING-MASING', Colors.purple),
  empty('', Colors.transparent),
  nonBudget('NON BUDGET', Colors.red),
  unset('UNSET', Colors.transparent);

  const BudgetTypeUsageType(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<BudgetTypeUsageType> get list => [
        BudgetTypeUsageType.individual,
        BudgetTypeUsageType.group,
        BudgetTypeUsageType.nonBudget,
      ];

  static BudgetTypeUsageType fromString(String id) {
    if (id == BudgetTypeUsageType.group.id) {
      return BudgetTypeUsageType.group;
    }
    if (id == BudgetTypeUsageType.individual.id) {
      return BudgetTypeUsageType.individual;
    }
    if (id == BudgetTypeUsageType.nonBudget.id) {
      return BudgetTypeUsageType.nonBudget;
    }
    if (id == BudgetTypeUsageType.masing.id) {
      return BudgetTypeUsageType.masing;
    }
    if (id == BudgetTypeUsageType.unset.id) {
      return BudgetTypeUsageType.unset;
    }
    return BudgetTypeUsageType.empty;
  }
}

enum BudgetTypeDepartmentType implements ColorType {
  plant('PLANT', Colors.red),
  marketing('MARKETING', Colors.amber),
  general('GENERAL', Colors.green),
  all('ALL', Colors.teal),
  empty('', Colors.transparent),
  unset('UNSET', Colors.transparent);

  const BudgetTypeDepartmentType(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<BudgetTypeDepartmentType> get list => [
        BudgetTypeDepartmentType.all,
        BudgetTypeDepartmentType.general,
        BudgetTypeDepartmentType.plant,
        BudgetTypeDepartmentType.marketing,
      ];

  static BudgetTypeDepartmentType fromString(
    String id,
  ) {
    if (id == BudgetTypeDepartmentType.plant.id) {
      return BudgetTypeDepartmentType.plant;
    }
    if (id == BudgetTypeDepartmentType.marketing.id) {
      return BudgetTypeDepartmentType.marketing;
    }
    if (id == BudgetTypeDepartmentType.general.id) {
      return BudgetTypeDepartmentType.general;
    }
    if (id == BudgetTypeDepartmentType.all.id) {
      return BudgetTypeDepartmentType.all;
    }
    if (id == BudgetTypeDepartmentType.unset.id) {
      return BudgetTypeDepartmentType.unset;
    }

    return BudgetTypeDepartmentType.empty;
  }
}

@freezed
class BudgetType extends Equatable with _$BudgetType {
  factory BudgetType(
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updatedById,
    int id,
    String name,
    int level,
    @JsonKey(
      name: 'department_type',
      fromJson: BudgetTypeDepartmentType.fromString,
    )
    BudgetTypeDepartmentType departmentType,
    @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
    BudgetTypeUsageType usageType,
    int parent,
  ) = _BudgetType;

  factory BudgetType.empty() => BudgetType(
        DateTime(0),
        0,
        DateTime(0),
        0,
        1,
        '',
        1,
        BudgetTypeDepartmentType.empty,
        BudgetTypeUsageType.empty,
        1,
      );
  const BudgetType._();

  factory BudgetType.fromJson(Map<String, dynamic> json) =>
      _$BudgetTypeFromJson(json);

  @override
  List<Object?> get props => [id];
}

@freezed
class BudgetTypeSummary with _$BudgetTypeSummary {
  factory BudgetTypeSummary({
    @JsonKey(name: 'coa') required String coa,
    @JsonKey(name: 'department_type') required String departmentType,
    @JsonKey(name: 'id_subtype') required int subtypeId,
    @JsonKey(name: 'subtype') required String subtypeName,
    @JsonKey(name: 'type') required String type,
  }) = _BudgetTypeSummary;

  const BudgetTypeSummary._();

  factory BudgetTypeSummary.fromJson(Map<String, dynamic> json) =>
      _$BudgetTypeSummaryFromJson(json);
}
