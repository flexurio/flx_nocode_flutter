import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_cost.freezed.dart';
part 'type_cost.g.dart';

@freezed
class TypeCost with _$TypeCost {
  factory TypeCost({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required String name,
    @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
    required ChartOfAccountNumber chartOfAccountNumber,
  }) = _TypeCost;
  const TypeCost._();

  factory TypeCost.fromJson(Map<String, dynamic> json) =>
      _$TypeCostFromJson(json);

  factory TypeCost.empty() => TypeCost(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        name: '',
        chartOfAccountNumber: ChartOfAccountNumber.empty(),
      );
}
