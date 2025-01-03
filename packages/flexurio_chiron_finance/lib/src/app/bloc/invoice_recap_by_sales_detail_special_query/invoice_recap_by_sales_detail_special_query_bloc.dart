import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_detail_special.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_detail_special_query_bloc.freezed.dart';

@freezed
class InvoiceRecapBySalesDetailSpecialQueryEvent
    with _$InvoiceRecapBySalesDetailSpecialQueryEvent {
  const factory InvoiceRecapBySalesDetailSpecialQueryEvent.fetch({
    PageOptions<InvoiceRecapBySalesDetailSpecial>? pageOptions,
    DateTime? transactionDateStart,
    DateTime? transactionDateEnd,
    String? transactionTypeId,
    String? customerId,
  }) = _Fetch;
}

@freezed
class InvoiceRecapBySalesDetailSpecialQueryState
    with _$InvoiceRecapBySalesDetailSpecialQueryState {
  const factory InvoiceRecapBySalesDetailSpecialQueryState.error(String error) =
      _Error;
  const factory InvoiceRecapBySalesDetailSpecialQueryState.initial() = _Initial;
  const factory InvoiceRecapBySalesDetailSpecialQueryState.loaded(
    PageOptions<InvoiceRecapBySalesDetailSpecial> pageOptions,
  ) = _Success;
  const factory InvoiceRecapBySalesDetailSpecialQueryState.loading(
    PageOptions<InvoiceRecapBySalesDetailSpecial> pageOptions,
  ) = _Loading;
}

class InvoiceRecapBySalesDetailSpecialQueryBloc extends Bloc<
    InvoiceRecapBySalesDetailSpecialQueryEvent,
    InvoiceRecapBySalesDetailSpecialQueryState> {
  InvoiceRecapBySalesDetailSpecialQueryBloc() : super(const _Initial()) {
    on<InvoiceRecapBySalesDetailSpecialQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          transactionDateStart,
          transactionDateEnd,
          transactionTypeId,
          customerId,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await InvoiceRecapByTypeRepository.instance
                .fetchBySalesDetailSpecial(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionDateStart: transactionDateStart,
              transactionDateEnd: transactionDateEnd,
              transactionTypeId: transactionTypeId,
              customerId: customerId,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceRecapBySalesDetailSpecial> _pageOptions =
      PageOptions.empty();
}
