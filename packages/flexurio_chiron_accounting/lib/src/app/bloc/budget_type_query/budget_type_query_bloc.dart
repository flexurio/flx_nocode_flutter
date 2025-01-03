import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'budget_type_query_bloc.freezed.dart';

@freezed
class BudgetTypeQueryState with _$BudgetTypeQueryState {
  const factory BudgetTypeQueryState.initial() = _Initial;
  const factory BudgetTypeQueryState.loading() = _Loading;
  const factory BudgetTypeQueryState.loaded(
    List<BudgetType> budgetType,
  ) = _Success;
  const factory BudgetTypeQueryState.error(String error) = _Error;
}

@freezed
class BudgetTypeQueryEvent with _$BudgetTypeQueryEvent {
  const factory BudgetTypeQueryEvent.fetch({
    ChartOfAccountNumber? chartOfAccount,
  }) = _Fetch;
}

class BudgetTypeQueryBloc
    extends Bloc<BudgetTypeQueryEvent, BudgetTypeQueryState> {
  BudgetTypeQueryBloc() : super(const _Initial()) {
    on<BudgetTypeQueryEvent>((event, emit) async {
      await event.when(
        fetch: (chartOfAccount) async {
          emit(const _Loading());
          try {
            late List<BudgetType> budgetTypes;

            if (chartOfAccount != null) {
              budgetTypes =
                  await AccountingRepository.instance.budgetTypeSummaryFetch(
                accessToken: UserRepositoryApp.instance.token!,
                chartOfAccountNumberID: chartOfAccount.id,
              );
            } else {
              budgetTypes = await AccountingRepository.instance.budgetTypeFetch(
                accessToken: UserRepositoryApp.instance.token!,
              );
            }

            emit(_Success(budgetTypes));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
