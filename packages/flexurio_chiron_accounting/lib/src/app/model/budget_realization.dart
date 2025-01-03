import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_realization.freezed.dart';
part 'budget_realization.g.dart';

enum BudgetRealizationViewBy {
  generalManager('general_manager'),
  department('department');

  const BudgetRealizationViewBy(this.id);

  final String id;
  String get label => tr(id);

  static List<BudgetRealizationViewBy> get list => [
        BudgetRealizationViewBy.generalManager,
        BudgetRealizationViewBy.department,
      ];
}

enum BudgetRealizationType {
  employeeCost(
    'employee_cost',
    'EMPLOYEE COST',
  ),
  operationalCost('operational_cost', 'OPERATIONAL COST');

  const BudgetRealizationType(this.id, this.postBudget);

  final String id;
  final String postBudget;

  String get label => tr(id);

  static List<BudgetRealizationType> get list => [
        BudgetRealizationType.employeeCost,
        BudgetRealizationType.operationalCost,
      ];
}

@freezed
class BudgetRealization with _$BudgetRealization {
  const factory BudgetRealization({
    @JsonKey(fromJson: Department.fromJson) required Department department,
    required String period,
    @JsonKey(name: 'post_budget') required String postBudget,
    @JsonKey(name: 'general_manager') required String generalManager,
    required String january,
    required String february,
    required String march,
    required String april,
    required String may,
    required String june,
    required String july,
    required String august,
    required String september,
    required String october,
    required String november,
    required String december,
    @JsonKey(name: 'year_to_date') required String yearToDate,
  }) = _BudgetRealization;

  const BudgetRealization._();

  factory BudgetRealization.fromJson(Map<String, dynamic> json) =>
      _$BudgetRealizationFromJson(json);

  factory BudgetRealization.empty() => BudgetRealization(
        period: '',
        postBudget: '',
        generalManager: '',
        january: '',
        february: '',
        march: '',
        april: '',
        may: '',
        june: '',
        july: '',
        august: '',
        september: '',
        october: '',
        november: '',
        december: '',
        department: Department.empty(),
        yearToDate: '',
      );

  List<String> get months => [
        january,
        february,
        march,
        april,
        may,
        june,
        july,
        august,
        september,
        october,
        november,
        december,
      ];

  String assign(BudgetRealizationViewBy viewBy) {
    return viewBy == BudgetRealizationViewBy.generalManager
        ? generalManager
        : department.name;
  }
}
