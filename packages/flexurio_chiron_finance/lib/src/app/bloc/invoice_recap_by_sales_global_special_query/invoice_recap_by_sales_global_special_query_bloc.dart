import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_global_special.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_global_special_query_bloc.freezed.dart';

@freezed
class InvoiceRecapBySalesGlobalSpecialQueryEvent
    with _$InvoiceRecapBySalesGlobalSpecialQueryEvent {
  const factory InvoiceRecapBySalesGlobalSpecialQueryEvent.fetch({
    PageOptions<InvoiceRecapBySalesGlobalSpecial>? pageOptions,
    DateTime? transactionDateStart,
    DateTime? transactionDateEnd,
    String? transactionTypeId,
    String? customerId,
    String? transactionId,
  }) = _Fetch;
}

@freezed
class InvoiceRecapBySalesGlobalSpecialQueryState
    with _$InvoiceRecapBySalesGlobalSpecialQueryState {
  const factory InvoiceRecapBySalesGlobalSpecialQueryState.error(String error) =
      _Error;
  const factory InvoiceRecapBySalesGlobalSpecialQueryState.initial() = _Initial;
  const factory InvoiceRecapBySalesGlobalSpecialQueryState.loaded(
    PageOptions<InvoiceRecapBySalesGlobalSpecial> pageOptions,
  ) = _Success;
  const factory InvoiceRecapBySalesGlobalSpecialQueryState.loading(
    PageOptions<InvoiceRecapBySalesGlobalSpecial> pageOptions,
  ) = _Loading;
}

class InvoiceRecapBySalesGlobalSpecialQueryBloc extends Bloc<
    InvoiceRecapBySalesGlobalSpecialQueryEvent,
    InvoiceRecapBySalesGlobalSpecialQueryState> {
  InvoiceRecapBySalesGlobalSpecialQueryBloc() : super(const _Initial()) {
    on<InvoiceRecapBySalesGlobalSpecialQueryEvent>((event, emit) async {
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
                .fetchBySalesGlobalSpecial(
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
  PageOptions<InvoiceRecapBySalesGlobalSpecial> _pageOptions =
      PageOptions.empty();
}
