import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_of_account_group.freezed.dart';
part 'chart_of_account_group.g.dart';

@freezed
class ChartOfAccountGroup with _$ChartOfAccountGroup {
  factory ChartOfAccountGroup(
    @JsonKey(name: 'created_by_id') int? createdById,
    @JsonKey(name: 'updated_by_id') int? updateById,
    @JsonKey(name: 'forecast_number') String forecastNumber,
    @JsonKey(name: 'balance_group') BalanceGroup balanceGroup,
    String name,
    String id,
  ) = _ChartOfAccountGroup;
  const ChartOfAccountGroup._();

  factory ChartOfAccountGroup.fromJson(Map<String, dynamic> json) =>
      _$ChartOfAccountGroupFromJson(json);

  factory ChartOfAccountGroup.empty() =>
      ChartOfAccountGroup(null, null, '', BalanceGroup.empty(), '', '');
}
