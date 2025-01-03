import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_detail.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_sales_detail_query_bloc.freezed.dart';

@freezed
class InvoiceRecapBySalesDetailQueryEvent
    with _$InvoiceRecapBySalesDetailQueryEvent {
  const factory InvoiceRecapBySalesDetailQueryEvent.fetch({
    PageOptions<InvoiceRecapBySalesDetail>? pageOptions,
    DateTime? transactionDateStart,
    DateTime? transactionDateEnd,
    String? transactionTypeId,
    String? customerId,
    String? transactionId,
  }) = _Fetch;
}

@freezed
class InvoiceRecapBySalesDetailQueryState
    with _$InvoiceRecapBySalesDetailQueryState {
  const factory InvoiceRecapBySalesDetailQueryState.error(String error) =
      _Error;
  const factory InvoiceRecapBySalesDetailQueryState.initial() = _Initial;
  const factory InvoiceRecapBySalesDetailQueryState.loaded(
    PageOptions<InvoiceRecapBySalesDetail> pageOptions,
  ) = _Success;
  const factory InvoiceRecapBySalesDetailQueryState.loading(
    PageOptions<InvoiceRecapBySalesDetail> pageOptions,
  ) = _Loading;
}

class InvoiceRecapBySalesDetailQueryBloc extends Bloc<
    InvoiceRecapBySalesDetailQueryEvent, InvoiceRecapBySalesDetailQueryState> {
  InvoiceRecapBySalesDetailQueryBloc() : super(const _Initial()) {
    on<InvoiceRecapBySalesDetailQueryEvent>((event, emit) async {
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
                await InvoiceRecapByTypeRepository.instance.fetchBySalesDetail(
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
  PageOptions<InvoiceRecapBySalesDetail> _pageOptions = PageOptions.empty();
}
