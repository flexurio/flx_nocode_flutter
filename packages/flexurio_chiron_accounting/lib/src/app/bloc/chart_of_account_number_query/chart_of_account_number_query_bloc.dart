import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chart_of_account_number_query_bloc.freezed.dart';

@freezed
class ChartOfAccountNumberQueryState with _$ChartOfAccountNumberQueryState {
  factory ChartOfAccountNumberQueryState.initial() = _Initial;
  factory ChartOfAccountNumberQueryState.loading(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loading;
  factory ChartOfAccountNumberQueryState.loaded(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loaded;
  factory ChartOfAccountNumberQueryState.error(String error) = _Error;
}

@freezed
class ChartOfAccountNumberQueryEvent with _$ChartOfAccountNumberQueryEvent {
  factory ChartOfAccountNumberQueryEvent.fetch({
    PageOptions<ChartOfAccountNumber>? pageOptions,
    String? chartOfAccountType,
    int? statusNotEqual,
  }) = _Fetch;
}

class ChartOfAccountNumberQueryBloc extends Bloc<ChartOfAccountNumberQueryEvent,
    ChartOfAccountNumberQueryState> {
  ChartOfAccountNumberQueryBloc() : super(_Initial()) {
    on<ChartOfAccountNumberQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions, chartOfAccountType, statusNotEqual) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions =
                  await AccountingRepository.instance.chartOfAccountNumberFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                chartOfAccountType: chartOfAccountType,
                statusNotEqual: statusNotEqual,
              );
              emit(_Loaded(_pageOptions));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<ChartOfAccountNumber> _pageOptions = PageOptions.empty();
}
