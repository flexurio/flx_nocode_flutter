import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chart_of_account_number_accumulation_query_bloc.freezed.dart';

@freezed
class ChartOfAccountNumberAccumulationQueryState
    with _$ChartOfAccountNumberAccumulationQueryState {
  factory ChartOfAccountNumberAccumulationQueryState.initial() = _Initial;
  factory ChartOfAccountNumberAccumulationQueryState.loading(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loading;
  factory ChartOfAccountNumberAccumulationQueryState.loaded(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loaded;
  factory ChartOfAccountNumberAccumulationQueryState.error(String error) =
      _Error;
}

@freezed
class ChartOfAccountNumberAccumulationQueryEvent
    with _$ChartOfAccountNumberAccumulationQueryEvent {
  factory ChartOfAccountNumberAccumulationQueryEvent.fetch({
    PageOptions<ChartOfAccountNumber>? pageOptions,
  }) = _Fetch;
}

class ChartOfAccountNumberAccumulationQueryBloc extends Bloc<
    ChartOfAccountNumberAccumulationQueryEvent,
    ChartOfAccountNumberAccumulationQueryState> {
  ChartOfAccountNumberAccumulationQueryBloc() : super(_Initial()) {
    on<ChartOfAccountNumberAccumulationQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions = await AccountingRepository.instance
                  .chartOfAccountNumberAccumulationFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
              );
              emit(
                _Loaded(_pageOptions),
              );
            } catch (error) {
              emit(
                _Error(errorMessage(error)),
              );
            }
          },
        );
      },
    );
  }
  PageOptions<ChartOfAccountNumber> _pageOptions = PageOptions.empty();
}
