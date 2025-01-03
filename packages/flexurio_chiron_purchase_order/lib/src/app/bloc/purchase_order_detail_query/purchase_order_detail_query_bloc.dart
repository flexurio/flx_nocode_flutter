import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_detail_query_bloc.freezed.dart';

@freezed
class PurchaseOrderDetailQueryState with _$PurchaseOrderDetailQueryState {
  const factory PurchaseOrderDetailQueryState.initial() = _Initial;
  const factory PurchaseOrderDetailQueryState.loading() = _Loading;
  const factory PurchaseOrderDetailQueryState.loaded(
    List<PurchaseOrderDetail> purchaseOrderDetails,
  ) = _Success;
  const factory PurchaseOrderDetailQueryState.error(String error) = _Error;
}

@freezed
class PurchaseOrderDetailQueryEvent with _$PurchaseOrderDetailQueryEvent {
  const factory PurchaseOrderDetailQueryEvent.fetch(
      {required PurchaseOrder purchaseOrder, String? materialGroupId}) = _Fetch;
  const factory PurchaseOrderDetailQueryEvent.fetchAll({
    Material? material,
    Product? product,
    List<Material>? materials,
    List<Product>? products,
    PurchaseOrder? purchaseOrder,
  }) = _FetchAll;
}

class PurchaseOrderDetailQueryBloc
    extends Bloc<PurchaseOrderDetailQueryEvent, PurchaseOrderDetailQueryState> {
  PurchaseOrderDetailQueryBloc() : super(const _Initial()) {
    on<PurchaseOrderDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (purchaseOrder, materialGroupId) async {
          emit(const _Loading());
          try {
            final purchaseOrderDetails =
                await PurchasingRepository.instance.purchaseOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrder.id,
              materialGroupId: materialGroupId,
            );
            emit(_Success(purchaseOrderDetails));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetchAll:
            (material, product, materials, products, purchaseOrder) async {
          emit(const _Loading());
          try {
            final purchaseOrderDetails =
                await PurchasingRepository.instance.purchaseOrderDetailFetchAll(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
              product: product,
              materials: materials,
              products: products,
              purchaseOrder: purchaseOrder,
            );
            final filteredPurchaseOrder = purchaseOrderDetails
              ..sort(
                (a, b) => b.createdAt.compareTo(a.createdAt),
              );
            emit(_Success(filteredPurchaseOrder.take(3).toList()));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
