import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_reject.dart';
import 'package:flexurio_chiron_purchase_order/src/app/resource/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_reject_query_bloc.freezed.dart';

@freezed
class PurchaseOrderRejectQueryEvent with _$PurchaseOrderRejectQueryEvent {
  const factory PurchaseOrderRejectQueryEvent.fetch({
    PageOptions<PurchaseOrderReject>? pageOptions,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

@freezed
class PurchaseOrderRejectQueryState with _$PurchaseOrderRejectQueryState {
  const factory PurchaseOrderRejectQueryState.error(String error) = _Error;
  const factory PurchaseOrderRejectQueryState.initial() = _Initial;
  const factory PurchaseOrderRejectQueryState.loaded(
    PageOptions<PurchaseOrderReject> purchaseOrderReject,
  ) = _Success;
  const factory PurchaseOrderRejectQueryState.loading(
    PageOptions<PurchaseOrderReject> pageOptions,
  ) = _Loading;
}

class PurchaseOrderRejectQueryBloc
    extends Bloc<PurchaseOrderRejectQueryEvent, PurchaseOrderRejectQueryState> {
  PurchaseOrderRejectQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderRejectQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, dateStart, dateEnd) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchaseOrderRepository.instance.rejectFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              startDate: dateStart,
              endDate: dateEnd,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PurchaseOrderReject> _pageOptions = PageOptions.empty();
}
