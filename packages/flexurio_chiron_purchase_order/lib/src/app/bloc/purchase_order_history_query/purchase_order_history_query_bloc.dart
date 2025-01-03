import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_history.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_history_query_bloc.freezed.dart';

@freezed
class PurchaseOrderHistoryQueryState with _$PurchaseOrderHistoryQueryState {
  const factory PurchaseOrderHistoryQueryState.initial() = _Initial;
  const factory PurchaseOrderHistoryQueryState.loading() = _Loading;
  const factory PurchaseOrderHistoryQueryState.loaded(
    List<PurchaseOrderHistory> purchaseOrderHistories,
  ) = _Success;
  const factory PurchaseOrderHistoryQueryState.error(String error) = _Error;
}

@freezed
class PurchaseOrderHistoryQueryEvent with _$PurchaseOrderHistoryQueryEvent {
  const factory PurchaseOrderHistoryQueryEvent.fetch(
    PurchaseOrder purchaseOrder,
  ) = _Fetch;
}

class PurchaseOrderHistoryQueryBloc extends Bloc<PurchaseOrderHistoryQueryEvent,
    PurchaseOrderHistoryQueryState> {
  PurchaseOrderHistoryQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderHistoryQueryEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseOrder) async {
          emit(const _Loading());
          try {
            final purchaseOrderHistories =
                await PurchasingRepository.instance.purchaseOrderHistoryFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(_Success(purchaseOrderHistories));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
