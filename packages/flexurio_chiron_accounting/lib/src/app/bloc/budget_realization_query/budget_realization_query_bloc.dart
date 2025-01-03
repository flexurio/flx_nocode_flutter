import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_realization_query_bloc.freezed.dart';

@freezed
class BudgetRealizationQueryEvent with _$BudgetRealizationQueryEvent {
  const factory BudgetRealizationQueryEvent.fetch({
    required int year,
    required BudgetRealizationType type,
    required BudgetRealizationViewBy viewBy,
    PageOptions<BudgetRealization>? pageOptions,
  }) = _Fetch;
}

@freezed
class BudgetRealizationQueryState with _$BudgetRealizationQueryState {
  const factory BudgetRealizationQueryState.error(String error) = _Error;
  const factory BudgetRealizationQueryState.initial() = _Initial;
  const factory BudgetRealizationQueryState.loading(
    PageOptions<BudgetRealization> pageOptions,
  ) = _Loading;
  const factory BudgetRealizationQueryState.loaded(
    PageOptions<BudgetRealization> pageOptions,
  ) = _Success;
}

class BudgetRealizationQueryBloc
    extends Bloc<BudgetRealizationQueryEvent, BudgetRealizationQueryState> {
  BudgetRealizationQueryBloc() : super(const _Initial()) {
    on<BudgetRealizationQueryEvent>((event, emit) async {
      await event.when(
        fetch: (year, type, view, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await AccountingRepository.instance.budgetRealizationFetch(
              accessToken: UserRepositoryApp.instance.token!,
              year: year,
              pageOptions: _pageOptions,
              type: type,
              viewBy: view,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<BudgetRealization> _pageOptions = PageOptions.empty();
}
