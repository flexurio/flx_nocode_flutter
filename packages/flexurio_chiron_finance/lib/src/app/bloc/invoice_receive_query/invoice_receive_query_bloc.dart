import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_query_bloc.freezed.dart';

@freezed
class InvoiceReceiveQueryState with _$InvoiceReceiveQueryState {
  const factory InvoiceReceiveQueryState.initial() = _Initial;
  const factory InvoiceReceiveQueryState.loading(
    PageOptions<InvoiceReceive> invoiceReceives,
  ) = _Loading;
  const factory InvoiceReceiveQueryState.loaded(
    PageOptions<InvoiceReceive> invoiceReceives,
  ) = _Loaded;
  const factory InvoiceReceiveQueryState.error(String error) = _Error;
}

@freezed
class InvoiceReceiveQueryEvent with _$InvoiceReceiveQueryEvent {
  const factory InvoiceReceiveQueryEvent.fetch({
    PageOptions<InvoiceReceive>? pageOptions,
    DateTime? createdAtStart,
    DateTime? createdAtEnd,
  }) = _Fetch;
  const factory InvoiceReceiveQueryEvent.fetchById(String id) = _FetchById;
}

class InvoiceReceiveQueryBloc
    extends Bloc<InvoiceReceiveQueryEvent, InvoiceReceiveQueryState> {
  InvoiceReceiveQueryBloc() : super(const _Initial()) {
    on<InvoiceReceiveQueryEvent>((event, emit) async {
      await event.when(
        fetchById: (id) async {
          emit(_Loading(_pageOptions));
          try {
            final invoiceReceive =
                await PurchasingRepository.instance.invoiceReceiveFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(_Loaded(PageOptions.empty(data: [invoiceReceive])));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (pageOptions, createdAtStart, createdAtEnd) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final invoices =
                await PurchasingRepository.instance.invoiceReceiveFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              createdAtStart: createdAtStart,
              createdAtEnd: createdAtEnd,
            );
            emit(_Loaded(invoices));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceReceive> _pageOptions = PageOptions.empty();
}
