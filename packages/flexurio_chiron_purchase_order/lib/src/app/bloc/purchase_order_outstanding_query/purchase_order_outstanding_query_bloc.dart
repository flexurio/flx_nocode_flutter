import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_outstanding_query_bloc.freezed.dart';

@freezed
class PurchaseOrderOutstandingQueryEvent
    with _$PurchaseOrderOutstandingQueryEvent {
  const factory PurchaseOrderOutstandingQueryEvent.fetch({
    PageOptions<PurchaseOrderOutstanding>? pageOptions,
  }) = _Fetch;
}

@freezed
class PurchaseOrderOutstandingQueryState
    with _$PurchaseOrderOutstandingQueryState {
  const factory PurchaseOrderOutstandingQueryState.error(String error) = _Error;
  const factory PurchaseOrderOutstandingQueryState.initial() = _Initial;
  const factory PurchaseOrderOutstandingQueryState.loaded(
    PageOptions<PurchaseOrderOutstanding> purchaseOrder,
  ) = _Success;
  const factory PurchaseOrderOutstandingQueryState.loading(
    PageOptions<PurchaseOrderOutstanding> pageOptions,
  ) = _Loading;
}

class PurchaseOrderOutstandingQueryBloc extends Bloc<
    PurchaseOrderOutstandingQueryEvent, PurchaseOrderOutstandingQueryState> {
  PurchaseOrderOutstandingQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderOutstandingQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchasingRepository.instance
                .purchaseOrderOutstandingFetch(
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
  PageOptions<PurchaseOrderOutstanding> _pageOptions = PageOptions.empty(
    sortBy: 'purchase_order_date',
  );
}
