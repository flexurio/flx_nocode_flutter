import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_query_fetch_by_id.freezed.dart';

@freezed
class PurchaseOrderQueryFetchByIdState with _$PurchaseOrderQueryFetchByIdState {
  const factory PurchaseOrderQueryFetchByIdState.initial() = _Initial;
  const factory PurchaseOrderQueryFetchByIdState.loading() = _Loading;
  const factory PurchaseOrderQueryFetchByIdState.loaded(
    PurchaseOrder purchaseOrder,
  ) = _Loaded;
  const factory PurchaseOrderQueryFetchByIdState.error(String? error) = _Error;
}

@freezed
class PurchaseOrderQueryFetchByIdEvent with _$PurchaseOrderQueryFetchByIdEvent {
  const factory PurchaseOrderQueryFetchByIdEvent.fetch(
    String? purchaseOrderId,
  ) = _Fetch;
}

class PurchaseOrderQueryFetchByIdBloc extends Bloc<
    PurchaseOrderQueryFetchByIdEvent, PurchaseOrderQueryFetchByIdState> {
  PurchaseOrderQueryFetchByIdBloc() : super(const _Initial()) {
    on<PurchaseOrderQueryFetchByIdEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseOrderId) async {
          emit(const _Loading());
          try {
            final orders =
                await PurchasingRepository.instance.purchaseOrderFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrderId,
            );
            emit(_Loaded(orders));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
