import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_receive_report_query_bloc.freezed.dart';

@freezed
class ProductReturnReceiveReportQueryState
    with _$ProductReturnReceiveReportQueryState {
  const factory ProductReturnReceiveReportQueryState.initial() = _Initial;
  const factory ProductReturnReceiveReportQueryState.loading(
    PageOptions<ProductReturnReceiveReport> pageOptions,
  ) = _Loading;
  const factory ProductReturnReceiveReportQueryState.loaded(
    PageOptions<ProductReturnReceiveReport> pageOptions,
  ) = _Success;
  const factory ProductReturnReceiveReportQueryState.error(String error) =
      _Error;
}

@freezed
class ProductReturnReceiveReportQueryEvent
    with _$ProductReturnReceiveReportQueryEvent {
  const factory ProductReturnReceiveReportQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    required Department department,
    Product? product,
    required bool qualityAssurance,
    String? status,
    String? transactionTypeIdIn,
    PageOptions<ProductReturnReceiveReport>? pageOptions,
  }) = _Fetch;
  const factory ProductReturnReceiveReportQueryEvent.fetchStock({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    PageOptions<ProductReturnReceiveReport>? pageOptions,
  }) = _FetchStock;
}

class ProductReturnReceiveReportQueryBloc extends Bloc<
    ProductReturnReceiveReportQueryEvent,
    ProductReturnReceiveReportQueryState> {
  ProductReturnReceiveReportQueryBloc() : super(const _Initial()) {
    on<ProductReturnReceiveReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, customer, department, product,
            qualityAssurance, status, transactionTypeIdIn, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance
                .productReturnReceiveReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
              department: department,
              product: product,
              qualityAssurance: qualityAssurance,
              status: status,
              transactionTypeIdIn: transactionTypeIdIn,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchStock: (periodStart, periodEnd, customer, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance
                .productReturnStockReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnReceiveReport> _pageOptions = PageOptions.empty(
    sortBy: '',
  );
}
