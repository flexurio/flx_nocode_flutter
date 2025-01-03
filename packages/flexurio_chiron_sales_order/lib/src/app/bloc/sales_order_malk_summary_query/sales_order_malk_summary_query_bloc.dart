import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_malk_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_malk_summary_query_bloc.freezed.dart';

@freezed
class SalesOrderMalkSummaryQueryState with _$SalesOrderMalkSummaryQueryState {
  const factory SalesOrderMalkSummaryQueryState.initial() = _Initial;
  const factory SalesOrderMalkSummaryQueryState.loading(
    PageOptions<SalesOrderMalkSummary> pageOptions,
  ) = _Loading;
  const factory SalesOrderMalkSummaryQueryState.loaded(
    PageOptions<SalesOrderMalkSummary> pageOptions,
  ) = _Loaded;
  const factory SalesOrderMalkSummaryQueryState.error(String error) = _Error;
}

@freezed
class SalesOrderMalkSummaryQueryEvent with _$SalesOrderMalkSummaryQueryEvent {
  const factory SalesOrderMalkSummaryQueryEvent.fetch({
    PageOptions<SalesOrderMalkSummary>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class SalesOrderMalkSummaryQueryBloc extends Bloc<
    SalesOrderMalkSummaryQueryEvent, SalesOrderMalkSummaryQueryState> {
  SalesOrderMalkSummaryQueryBloc() : super(const _Initial()) {
    on<SalesOrderMalkSummaryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await SalesOrderRepository.instance.fetchSalesOrderMalkSummary(
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
  PageOptions<SalesOrderMalkSummary> _pageOptions = PageOptions.empty(
    sortBy: 'sales_order_id',
  );
}
