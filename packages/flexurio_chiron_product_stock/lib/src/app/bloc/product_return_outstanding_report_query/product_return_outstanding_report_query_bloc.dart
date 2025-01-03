import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_outstanding_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_outstanding_report_query_bloc.freezed.dart';

@freezed
class ProductReturnOutstandingReportQueryState
    with _$ProductReturnOutstandingReportQueryState {
  const factory ProductReturnOutstandingReportQueryState.initial() = _Initial;
  const factory ProductReturnOutstandingReportQueryState.loading(
    PageOptions<ProductReturnOutstandingReport> pageOptions,
  ) = _Loading;
  const factory ProductReturnOutstandingReportQueryState.loaded(
    PageOptions<ProductReturnOutstandingReport> pageOptions,
  ) = _Success;
  const factory ProductReturnOutstandingReportQueryState.error(String error) =
      _Error;
}

@freezed
class ProductReturnOutstandingReportQueryEvent
    with _$ProductReturnOutstandingReportQueryEvent {
  const factory ProductReturnOutstandingReportQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required bool qualityAssurance,
    Customer? customer,
    String? status,
    String? transactionTypeIdIn,
    PageOptions<ProductReturnOutstandingReport>? pageOptions,
  }) = _Fetch;
}

class ProductReturnOutstandingReportQueryBloc extends Bloc<
    ProductReturnOutstandingReportQueryEvent,
    ProductReturnOutstandingReportQueryState> {
  ProductReturnOutstandingReportQueryBloc() : super(const _Initial()) {
    on<ProductReturnOutstandingReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, qualityAssurance, customer, status,
            transactionTypeIdIn, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance
                .productReturnOutstandingReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
              qualityAssurance: qualityAssurance,
              status: status,
              transactionTypeIdIn: transactionTypeIdIn,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnOutstandingReport> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
