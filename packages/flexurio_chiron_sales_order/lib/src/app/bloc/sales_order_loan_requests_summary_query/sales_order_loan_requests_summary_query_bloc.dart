import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_loan_requests_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_loan_requests_summary_query_bloc.freezed.dart';

@freezed
class SalesOrderLoanRequestsSummaryQueryState
    with _$SalesOrderLoanRequestsSummaryQueryState {
  const factory SalesOrderLoanRequestsSummaryQueryState.initial() = _Initial;
  const factory SalesOrderLoanRequestsSummaryQueryState.loading(
    PageOptions<SalesOrderLoanRequestsSummary> pageOptions,
  ) = _Loading;
  const factory SalesOrderLoanRequestsSummaryQueryState.loaded(
    PageOptions<SalesOrderLoanRequestsSummary> pageOptions,
  ) = _Loaded;
  const factory SalesOrderLoanRequestsSummaryQueryState.error(String error) =
      _Error;
}

@freezed
class SalesOrderLoanRequestsSummaryQueryEvent
    with _$SalesOrderLoanRequestsSummaryQueryEvent {
  const factory SalesOrderLoanRequestsSummaryQueryEvent.fetch({
    PageOptions<SalesOrderLoanRequestsSummary>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class SalesOrderLoanRequestsSummaryQueryBloc extends Bloc<
    SalesOrderLoanRequestsSummaryQueryEvent,
    SalesOrderLoanRequestsSummaryQueryState> {
  SalesOrderLoanRequestsSummaryQueryBloc() : super(const _Initial()) {
    on<SalesOrderLoanRequestsSummaryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await SalesOrderRepository.instance
                .fetchSalesOrderLoanRequestsSummary(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<SalesOrderLoanRequestsSummary> _pageOptions = PageOptions.empty(
    sortBy: 'sales_order_id',
  );
}
