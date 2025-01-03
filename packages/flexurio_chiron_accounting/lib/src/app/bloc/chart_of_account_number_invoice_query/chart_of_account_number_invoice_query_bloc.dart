import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chart_of_account_number_invoice_query_bloc.freezed.dart';

@freezed
class ChartOfAccountNumberInvoiceQueryState
    with _$ChartOfAccountNumberInvoiceQueryState {
  factory ChartOfAccountNumberInvoiceQueryState.initial() = _Initial;
  factory ChartOfAccountNumberInvoiceQueryState.loading(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loading;
  factory ChartOfAccountNumberInvoiceQueryState.loaded(
    PageOptions<ChartOfAccountNumber> pageOptions,
  ) = _Loaded;
  factory ChartOfAccountNumberInvoiceQueryState.error(String error) = _Error;
}

@freezed
class ChartOfAccountNumberInvoiceQueryEvent
    with _$ChartOfAccountNumberInvoiceQueryEvent {
  factory ChartOfAccountNumberInvoiceQueryEvent.fetch({
    PageOptions<ChartOfAccountNumber>? pageOptions,
  }) = _Fetch;
}

class ChartOfAccountNumberInvoiceQueryBloc extends Bloc<
    ChartOfAccountNumberInvoiceQueryEvent,
    ChartOfAccountNumberInvoiceQueryState> {
  ChartOfAccountNumberInvoiceQueryBloc() : super(_Initial()) {
    on<ChartOfAccountNumberInvoiceQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              _pageOptions = await AccountingRepository.instance
                  .chartOfAccountNumberInvoiceFetch(
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
