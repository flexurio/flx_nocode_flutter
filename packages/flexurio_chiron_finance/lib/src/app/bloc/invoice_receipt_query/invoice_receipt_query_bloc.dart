import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receipt.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receipt_query_bloc.freezed.dart';

@freezed
class InvoiceReceiptQueryEvent with _$InvoiceReceiptQueryEvent {
  const factory InvoiceReceiptQueryEvent.fetch({
    PageOptions<InvoiceReceipt>? pageOptions,
    String? taxInvoiceNumber,
  }) = _Fetch;
}

@freezed
class InvoiceReceiptQueryState with _$InvoiceReceiptQueryState {
  const factory InvoiceReceiptQueryState.error(String error) = _Error;
  const factory InvoiceReceiptQueryState.initial() = _Initial;
  const factory InvoiceReceiptQueryState.loaded(
    PageOptions<InvoiceReceipt> pageOptions,
  ) = _Success;
  const factory InvoiceReceiptQueryState.loading(
    PageOptions<InvoiceReceipt> pageOptions,
  ) = _Loading;
}

class InvoiceReceiptQueryBloc
    extends Bloc<InvoiceReceiptQueryEvent, InvoiceReceiptQueryState> {
  InvoiceReceiptQueryBloc() : super(const _Initial()) {
    on<InvoiceReceiptQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, taxInvoiceNumber) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await InvoiceReceiptRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              taxInvoiceNumber: taxInvoiceNumber,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceReceipt> _pageOptions = PageOptions.empty();
}
