import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_detail_query_bloc.freezed.dart';

@freezed
class InvoiceReceiveDetailQueryState with _$InvoiceReceiveDetailQueryState {
  const factory InvoiceReceiveDetailQueryState.initial() = _Initial;
  const factory InvoiceReceiveDetailQueryState.loading(PageOptions<InvoiceReceiveDetail> pageOptions,) = _Loading;
  const factory InvoiceReceiveDetailQueryState.loaded(
    PageOptions<InvoiceReceiveDetail> pageOptions,
  ) = _Loaded;
  const factory InvoiceReceiveDetailQueryState.error(String error) = _Error;
}

@freezed
class InvoiceReceiveDetailQueryEvent with _$InvoiceReceiveDetailQueryEvent {
  const factory InvoiceReceiveDetailQueryEvent.fetch({
    required String invoiceId,
    PageOptions<InvoiceReceiveDetail>? pageOptions,
  }) = _Fetch;
}

class InvoiceReceiveDetailQueryBloc extends Bloc<InvoiceReceiveDetailQueryEvent,
    InvoiceReceiveDetailQueryState> {
  InvoiceReceiveDetailQueryBloc() : super(const _Initial()) {
    on<InvoiceReceiveDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (invoiceId, pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PurchasingRepository.instance.invoiceReceiveDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              invoiceId: invoiceId,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceReceiveDetail> _pageOptions = PageOptions.empty();
}
