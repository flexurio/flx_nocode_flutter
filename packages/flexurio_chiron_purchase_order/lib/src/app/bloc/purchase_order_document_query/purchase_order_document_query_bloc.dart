import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_document_query_bloc.freezed.dart';

@freezed
class PurchaseOrderDocumentQueryEvent with _$PurchaseOrderDocumentQueryEvent {
  const factory PurchaseOrderDocumentQueryEvent.fetch({
    required PurchaseOrder purchaseOrder,
    required int revisionNo,
  }) = _Fetch;
}

@freezed
class PurchaseOrderDocumentQueryState with _$PurchaseOrderDocumentQueryState {
  const factory PurchaseOrderDocumentQueryState.error(String error) = _Error;
  const factory PurchaseOrderDocumentQueryState.initial() = _Initial;
  const factory PurchaseOrderDocumentQueryState.loaded(
    PurchaseOrderDocument? purchaseOrderDocuments,
    List<int>? bytes,
  ) = _Success;
  const factory PurchaseOrderDocumentQueryState.loading() = _Loading;
}

class PurchaseOrderDocumentQueryBloc extends Bloc<
    PurchaseOrderDocumentQueryEvent, PurchaseOrderDocumentQueryState> {
  PurchaseOrderDocumentQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderDocumentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseOrder, revisionNo) async {
          emit(const _Loading());
          try {
            List<int>? bytes;
            PurchaseOrderDocument? purchaseOrderDocument;
            final purchaseOrderDocuments =
                await PurchasingRepository.instance.purchaseOrderDocumentFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
              revisionNo: revisionNo,
            );

            if (purchaseOrderDocuments.isNotEmpty) {
              purchaseOrderDocument = purchaseOrderDocuments.first;
              bytes = await PurchasingRepository.instance
                  .purchaseOrderDocumentFetchBytes(
                accessToken: UserRepositoryApp.instance.token!,
                purchaseOrder: purchaseOrder,
                purchaseOrderDocument: purchaseOrderDocument,
              );
            }

            emit(_Success(purchaseOrderDocument, bytes));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
