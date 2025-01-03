import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_summary_query_bloc.freezed.dart';

@freezed
class SalesOrderSummaryQueryState with _$SalesOrderSummaryQueryState {
  const factory SalesOrderSummaryQueryState.initial() = _Initial;
  const factory SalesOrderSummaryQueryState.loading(
    PageOptions<SalesOrderSummary> pageOptions,
  ) = _Loading;
  const factory SalesOrderSummaryQueryState.loaded(
    PageOptions<SalesOrderSummary> pageOptions,
  ) = _Loaded;
  const factory SalesOrderSummaryQueryState.error(String error) = _Error;
}

@freezed
class SalesOrderSummaryQueryEvent with _$SalesOrderSummaryQueryEvent {
  const factory SalesOrderSummaryQueryEvent.fetch({
    PageOptions<SalesOrderSummary>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
    Department? department,
  }) = _Fetch;
}

class SalesOrderSummaryQueryBloc
    extends Bloc<SalesOrderSummaryQueryEvent, SalesOrderSummaryQueryState> {
  SalesOrderSummaryQueryBloc() : super(const _Initial()) {
    on<SalesOrderSummaryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate, department) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await SalesOrderRepository.instance.fetchSalesOrderSummary(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: startDate,
              endDate: endDate,
              department: department,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<SalesOrderSummary> _pageOptions = PageOptions.empty(
    sortBy: 'sales_order_id',
  );
}
