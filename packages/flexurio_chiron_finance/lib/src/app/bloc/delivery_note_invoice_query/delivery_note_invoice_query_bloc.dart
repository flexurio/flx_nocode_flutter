import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/delivery_note_invoice.dart';
import 'package:flexurio_chiron_finance/src/app/resource/delivery_note_invoice.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_note_invoice_query_bloc.freezed.dart';

@freezed
class DeliveryNoteInvoiceQueryEvent with _$DeliveryNoteInvoiceQueryEvent {
  const factory DeliveryNoteInvoiceQueryEvent.fetch({
    PageOptions<DeliveryNoteInvoice>? pageOptions,
  }) = _Fetch;
}

@freezed
class DeliveryNoteInvoiceQueryState with _$DeliveryNoteInvoiceQueryState {
  const factory DeliveryNoteInvoiceQueryState.error(String error) = _Error;
  const factory DeliveryNoteInvoiceQueryState.initial() = _Initial;
  const factory DeliveryNoteInvoiceQueryState.loading(
    PageOptions<DeliveryNoteInvoice> pageOptions,
  ) = _Loading;
  const factory DeliveryNoteInvoiceQueryState.loaded(
    PageOptions<DeliveryNoteInvoice> pageOptions,
  ) = _Success;
}

class DeliveryNoteInvoiceQueryBloc
    extends Bloc<DeliveryNoteInvoiceQueryEvent, DeliveryNoteInvoiceQueryState> {
  DeliveryNoteInvoiceQueryBloc() : super(const _Initial()) {
    on<DeliveryNoteInvoiceQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await DeliveryNoteInvoiceRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
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
  PageOptions<DeliveryNoteInvoice> _pageOptions = PageOptions.empty();
}
