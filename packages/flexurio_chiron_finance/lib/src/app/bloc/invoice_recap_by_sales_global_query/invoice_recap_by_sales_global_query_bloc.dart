import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global_query_bloc.freezed.dart';

@freezed
class InvoiceRecapBySalesGlobalQueryEvent
    with _$InvoiceRecapBySalesGlobalQueryEvent {
  const factory InvoiceRecapBySalesGlobalQueryEvent.fetch({
    PageOptions<InvoiceRecapBySalesGlobal>? pageOptions,
    DateTime? transactionDateStart,
    DateTime? transactionDateEnd,
    String? transactionTypeId,
    String? customerId,
    String? transactionId,
  }) = _Fetch;
}

@freezed
class InvoiceRecapBySalesGlobalQueryState
    with _$InvoiceRecapBySalesGlobalQueryState {
  const factory InvoiceRecapBySalesGlobalQueryState.error(String error) =
      _Error;
  const factory InvoiceRecapBySalesGlobalQueryState.initial() = _Initial;
  const factory InvoiceRecapBySalesGlobalQueryState.loaded(
    PageOptions<InvoiceRecapBySalesGlobal> pageOptions,
  ) = _Success;
  const factory InvoiceRecapBySalesGlobalQueryState.loading(
    PageOptions<InvoiceRecapBySalesGlobal> pageOptions,
  ) = _Loading;
}

class InvoiceRecapBySalesGlobalQueryBloc extends Bloc<
    InvoiceRecapBySalesGlobalQueryEvent, InvoiceRecapBySalesGlobalQueryState> {
  InvoiceRecapBySalesGlobalQueryBloc() : super(const _Initial()) {
    on<InvoiceRecapBySalesGlobalQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          transactionDateStart,
          transactionDateEnd,
          transactionTypeId,
          customerId,
          transactionId,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await InvoiceRecapByTypeRepository.instance.fetchBySalesGlobal(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionDateStart: transactionDateStart,
              transactionDateEnd: transactionDateEnd,
              transactionTypeId: transactionTypeId,
              customerId: customerId,
              transactionId: transactionId,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceRecapBySalesGlobal> _pageOptions =
      PageOptions.empty(sortBy: 'transaction_name');
}
