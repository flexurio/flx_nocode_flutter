import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_outstanding_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_outstanding_product_query_bloc.freezed.dart';

@freezed
class PurchaseOrderOutstandingProductQueryEvent with _$PurchaseOrderOutstandingProductQueryEvent {
  const factory PurchaseOrderOutstandingProductQueryEvent.fetch({
    PageOptions<PurchaseOrderOutstandingProduct>? pageOptions,
  }) = _Fetch;
}

@freezed
class PurchaseOrderOutstandingProductQueryState with _$PurchaseOrderOutstandingProductQueryState {
  const factory PurchaseOrderOutstandingProductQueryState.error(String error) = _Error;
  const factory PurchaseOrderOutstandingProductQueryState.initial() = _Initial;
  const factory PurchaseOrderOutstandingProductQueryState.loaded(
    PageOptions<PurchaseOrderOutstandingProduct> purchaseOrder,
  ) = _Success;
  const factory PurchaseOrderOutstandingProductQueryState.loading(
    PageOptions<PurchaseOrderOutstandingProduct> pageOptions,
  ) = _Loading;
}

class PurchaseOrderOutstandingProductQueryBloc extends Bloc<PurchaseOrderOutstandingProductQueryEvent, PurchaseOrderOutstandingProductQueryState> {
  PurchaseOrderOutstandingProductQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderOutstandingProductQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions = await PurchasingRepository.instance.purchaseOrderOutstandingProductFetch(
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
  PageOptions<PurchaseOrderOutstandingProduct> _pageOptions = PageOptions.empty();
}
