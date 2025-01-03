import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global_special_all.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global_special_all_query_bloc.freezed.dart';

@freezed
class InvoiceRecapBySalesGlobalSpecialAllQueryEvent
    with _$InvoiceRecapBySalesGlobalSpecialAllQueryEvent {
  const factory InvoiceRecapBySalesGlobalSpecialAllQueryEvent.fetch({
    PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
    DateTime? transactionDateStart,
    DateTime? transactionDateEnd,
    String? transactionTypeId,
    String? customerId,
    String? transactionId,
  }) = _Fetch;
}

@freezed
class InvoiceRecapBySalesGlobalSpecialAllQueryState
    with _$InvoiceRecapBySalesGlobalSpecialAllQueryState {
  const factory InvoiceRecapBySalesGlobalSpecialAllQueryState.error(
    String error,
  ) = _Error;
  const factory InvoiceRecapBySalesGlobalSpecialAllQueryState.initial() =
      _Initial;
  const factory InvoiceRecapBySalesGlobalSpecialAllQueryState.loaded(
    PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions,
  ) = _Success;
  const factory InvoiceRecapBySalesGlobalSpecialAllQueryState.loading(
    PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions,
  ) = _Loading;
}

class InvoiceRecapBySalesGlobalSpecialAllQueryBloc extends Bloc<
    InvoiceRecapBySalesGlobalSpecialAllQueryEvent,
    InvoiceRecapBySalesGlobalSpecialAllQueryState> {
  InvoiceRecapBySalesGlobalSpecialAllQueryBloc() : super(const _Initial()) {
    on<InvoiceRecapBySalesGlobalSpecialAllQueryEvent>((event, emit) async {
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
            _pageOptions = await InvoiceRecapByTypeRepository.instance
                .fetchBySalesGlobalSpecialAll(
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
  PageOptions<InvoiceRecapBySalesGlobalSpecialAll> _pageOptions =
      PageOptions.empty();
}
