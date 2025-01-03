import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue_detail.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_bloc.freezed.dart';

@freezed
class ProductIssueState with _$ProductIssueState {
  const factory ProductIssueState.initial({
    List<ProductIssueDetail>? products,
  }) = _Initial;
  const factory ProductIssueState.loading() = _Loading;
  const factory ProductIssueState.success() = _Success;
  const factory ProductIssueState.error(String error) = _Error;
}

@freezed
class ProductIssueEvent with _$ProductIssueEvent {
  const factory ProductIssueEvent.deliveryActual({
    required ProductIssue id,
    required DateTime deliveryOrderReceived,
    required DateTime deliveryDate,
    required String expedition,
    required String shippingNo,
    required ProductIssueShipmentVia shipmentVia,
    required int shippingCharge,
    required int packageQty,
    required int kilogramQty,
    required DateTime endPackingDate,
  }) = _DeliveryActual;
  const factory ProductIssueEvent.delivery({
    required ProductIssue id,
    required DateTime deliveryOrderDate,
    required DateTime salesOrderReceiveDate,
  }) = _Delivery;
}

class ProductIssueBloc extends Bloc<ProductIssueEvent, ProductIssueState> {
  ProductIssueBloc() : super(const _Initial()) {
    on<ProductIssueEvent>(
      (event, emit) async {
        await event.when(
          deliveryActual: (
            id,
            deliveryOrderReceived,
            deliveryDate,
            expedition,
            shippingNo,
            shippingVia,
            shippingCharge,
            packageQty,
            kilogramQty,
            endPackingDate,
          ) async {
            emit(_Initial(products: _products));
            try {
              await ProductRepository.instance.productIssueDeliveryActual(
                productIssue: id,
                deliveryOrderReceived: deliveryOrderReceived,
                deliveryDate: deliveryDate,
                expedition: expedition,
                shippingNo: shippingNo,
                shippingVia: shippingVia,
                shippingCharge: shippingCharge,
                packageQty: packageQty,
                kilogramQty: kilogramQty,
                endPackingDate: endPackingDate,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                const _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delivery: (
            id,
            deliveryOrderDate,
            salesOrderReceiveDate,
          ) async {
            emit(_Initial(products: _products));
            try {
              await ProductRepository.instance.productIssueDelivery(
                productIssue: id,
                deliveryOrderDate: deliveryOrderDate,
                salesOrderReceiveDate: salesOrderReceiveDate,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                const _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  List<ProductIssueDetail>? _products;
}
