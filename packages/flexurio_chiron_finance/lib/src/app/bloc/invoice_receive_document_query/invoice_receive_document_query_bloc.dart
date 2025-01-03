import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_document.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_document_query_bloc.freezed.dart';

@freezed
class InvoiceReceiveDocumentQueryEvent with _$InvoiceReceiveDocumentQueryEvent {
  const factory InvoiceReceiveDocumentQueryEvent.fetch({
    required InvoiceReceive invoiceReceive,
  }) = _Fetch;
  const factory InvoiceReceiveDocumentQueryEvent.fetchByPurchaseOrderId({
    required String purchaseOrderId,
  }) = _FetchByPurchaseOrderId;
}

@freezed
class InvoiceReceiveDocumentQueryState with _$InvoiceReceiveDocumentQueryState {
  const factory InvoiceReceiveDocumentQueryState.error(String error) = _Error;
  const factory InvoiceReceiveDocumentQueryState.initial() = _Initial;
  const factory InvoiceReceiveDocumentQueryState.loaded(
    InvoiceReceiveDocument? invoiceReceiveDocuments,
    List<int>? bytes,
  ) = _Success;
  const factory InvoiceReceiveDocumentQueryState.loading() = _Loading;
}

class InvoiceReceiveDocumentQueryBloc extends Bloc<
    InvoiceReceiveDocumentQueryEvent, InvoiceReceiveDocumentQueryState> {
  InvoiceReceiveDocumentQueryBloc() : super(const _Initial()) {
    on<InvoiceReceiveDocumentQueryEvent>((event, emit) async {
      await event.when(
        fetchByPurchaseOrderId: (purchaseOrderId) async {
          emit(const _Loading());
          try {
            final bytes = await PurchasingRepository.instance
                .invoiceReceiveDocumentFetchBytes(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrderId,
            );
            emit(_Success(null, bytes));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (invoiceReceive) async {
          emit(const _Loading());
          try {
            List<int>? bytes;
            final invoiceReceiveDocument =
                await PurchasingRepository.instance.invoiceReceiveDocumentFetch(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
            );

            if (invoiceReceiveDocument != null) {
              bytes = await PurchasingRepository.instance
                  .invoiceReceiveDocumentFetchBytes(
                accessToken: UserRepositoryApp.instance.token!,
                purchaseOrderId:
                    invoiceReceiveDocument.documentPath.split('/').last,
              );
            }

            emit(_Success(invoiceReceiveDocument, bytes));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
