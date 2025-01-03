import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/sales_return_replacement_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/sales_return_replacement_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_return_replacement_report_query_bloc.freezed.dart';

@freezed
class SalesReturnReplacementReportQueryState
    with _$SalesReturnReplacementReportQueryState {
  const factory SalesReturnReplacementReportQueryState.initial() = _Initial;
  const factory SalesReturnReplacementReportQueryState.loading(
    PageOptions<SalesReturnReplacementReport> pageOptions,
  ) = _Loading;
  const factory SalesReturnReplacementReportQueryState.loaded(
    PageOptions<SalesReturnReplacementReport> pageOptions,
  ) = _Success;
  const factory SalesReturnReplacementReportQueryState.error(String error) =
      _Error;
}

@freezed
class SalesReturnReplacementReportQueryEvent
    with _$SalesReturnReplacementReportQueryEvent {
  const factory SalesReturnReplacementReportQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    Product? product,
    PageOptions<SalesReturnReplacementReport>? pageOptions,
  }) = _Fetch;
}

class SalesReturnReplacementReportQueryBloc extends Bloc<
    SalesReturnReplacementReportQueryEvent,
    SalesReturnReplacementReportQueryState> {
  SalesReturnReplacementReportQueryBloc() : super(const _Initial()) {
    on<SalesReturnReplacementReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, customer, product, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await SalesReturnReplacementReportRepository.instance
                .salesReturnReplacementReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
              product: product,
              pageOptions: _pageOptions,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<SalesReturnReplacementReport> _pageOptions = PageOptions.empty(
    sortBy: 'created_at',
  );
}
