import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_down_payment.dart';
import 'package:flexurio_chiron_purchase_order/src/app/resource/purchase_order_down_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_down_payment_query_bloc.freezed.dart';

@freezed
class PurchaseOrderDownPaymentQueryEvent
    with _$PurchaseOrderDownPaymentQueryEvent {
  const factory PurchaseOrderDownPaymentQueryEvent.fetch({
    PageOptions<PurchaseOrderDownPayment>? pageOptions,
    String? purchaseOrderId,
  }) = _Fetch;
}

@freezed
class PurchaseOrderDownPaymentQueryState
    with _$PurchaseOrderDownPaymentQueryState {
  const factory PurchaseOrderDownPaymentQueryState.error(String error) = _Error;
  const factory PurchaseOrderDownPaymentQueryState.initial() = _Initial;
  const factory PurchaseOrderDownPaymentQueryState.loaded(
    PageOptions<PurchaseOrderDownPayment> purchaseOrder,
  ) = _Success;
  const factory PurchaseOrderDownPaymentQueryState.loading(
    PageOptions<PurchaseOrderDownPayment> pageOptions,
  ) = _Loading;
}

class PurchaseOrderDownPaymentQueryBloc extends Bloc<
    PurchaseOrderDownPaymentQueryEvent, PurchaseOrderDownPaymentQueryState> {
  PurchaseOrderDownPaymentQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderDownPaymentQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, purchaseOrderId) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PurchaseOrderDownPaymentRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              purchaseOrderId: purchaseOrderId!,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PurchaseOrderDownPayment> _pageOptions = PageOptions.empty();
}
