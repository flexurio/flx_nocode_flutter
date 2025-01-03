import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_donation_summary.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_donation_summary_query_bloc.freezed.dart';

@freezed
class SalesOrderDonationSummaryQueryState
    with _$SalesOrderDonationSummaryQueryState {
  const factory SalesOrderDonationSummaryQueryState.initial() = _Initial;
  const factory SalesOrderDonationSummaryQueryState.loading(
    PageOptions<SalesOrderDonationSummary> pageOptions,
  ) = _Loading;
  const factory SalesOrderDonationSummaryQueryState.loaded(
    PageOptions<SalesOrderDonationSummary> pageOptions,
  ) = _Loaded;
  const factory SalesOrderDonationSummaryQueryState.error(String error) =
      _Error;
}

@freezed
class SalesOrderDonationSummaryQueryEvent
    with _$SalesOrderDonationSummaryQueryEvent {
  const factory SalesOrderDonationSummaryQueryEvent.fetch({
    PageOptions<SalesOrderDonationSummary>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class SalesOrderDonationSummaryQueryBloc extends Bloc<
    SalesOrderDonationSummaryQueryEvent, SalesOrderDonationSummaryQueryState> {
  SalesOrderDonationSummaryQueryBloc() : super(const _Initial()) {
    on<SalesOrderDonationSummaryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, startDate, endDate) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await SalesOrderRepository.instance
                .fetchSalesOrderDonationSummary(
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
  PageOptions<SalesOrderDonationSummary> _pageOptions = PageOptions.empty(
    sortBy: 'sales_order_id',
  );
}
