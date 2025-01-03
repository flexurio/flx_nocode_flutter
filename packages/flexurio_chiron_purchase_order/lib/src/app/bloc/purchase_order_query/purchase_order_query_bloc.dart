import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_query_bloc.freezed.dart';

@freezed
class PurchaseOrderQueryEvent with _$PurchaseOrderQueryEvent {
  const factory PurchaseOrderQueryEvent.fetch({
    PageOptions<PurchaseOrder>? pageOptions,
    List<PurchaseOrderStatus>? status,
    List<String>? materialGroupId,
    PurchaseOrderPaymentType? paymentType,
    double? downPaymentGreaterThan,
  }) = _Fetch;
}

@freezed
class PurchaseOrderQueryState with _$PurchaseOrderQueryState {
  const factory PurchaseOrderQueryState.error(String error) = _Error;
  const factory PurchaseOrderQueryState.initial() = _Initial;
  const factory PurchaseOrderQueryState.loaded(
    PageOptions<PurchaseOrder> purchaseOrder,
  ) = _Success;
  const factory PurchaseOrderQueryState.loading(
    PageOptions<PurchaseOrder> pageOptions,
  ) = _Loading;
}

class PurchaseOrderQueryBloc
    extends Bloc<PurchaseOrderQueryEvent, PurchaseOrderQueryState> {
  PurchaseOrderQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          status,
          materialGroupId,
          paymentType,
          downPaymentGreaterThan,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (status != null) {
              _statuses = status;
            }

            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await PurchasingRepository.instance.purchaseOrderFetch(
              accessToken: UserRepositoryApp.instance.token!,
              status: _statuses,
              pageOptions: _pageOptions,
              materialGroupId: materialGroupId,
              downPaymentGreaterThan: downPaymentGreaterThan,
              paymentType: paymentType,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  List<PurchaseOrderStatus>? _statuses;
  PageOptions<PurchaseOrder> _pageOptions = PageOptions.empty();
}
