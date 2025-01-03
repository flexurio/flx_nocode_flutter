import 'package:flexurio_chiron_sales_order/src/app/bloc/order_cart/order_cart_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_history.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_bloc.freezed.dart';

@freezed
abstract class SalesOrderState with _$SalesOrderState {
  const factory SalesOrderState.initial({
    SalesOrderHeaderInitial? salesOrderHeaderInitial,
  }) = _Initial;
  const factory SalesOrderState.loading() = _Loading;
  const factory SalesOrderState.success() = _Success;
  const factory SalesOrderState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderEvent with _$SalesOrderEvent {
  const factory SalesOrderEvent.viewHistoryHeader({
    SalesOrder? salesOrderId,
    SalesOrderHistory? revisionNo,
  }) = _ViewHistoryHeader;

  const factory SalesOrderEvent.editAdditionalDiscount({
    required String salesOrderId,
    required String type,
    required int termOfPayment,
    required double? discountPercent,
  }) = _EditAdditionalDiscount;
  const factory SalesOrderEvent.initialize({
    SalesOrder? salesOrderId,
    SalesOrder? revisionNo,
  }) = _Initialize;
  const factory SalesOrderEvent.create({
    required String transactionTypeId,
    required List<CartItem> products,
    required String orderTypeId,
  }) = _Create;
  const factory SalesOrderEvent.confirm(SalesOrder salesOrder) = _Confirm;
  const factory SalesOrderEvent.undoConfirm(SalesOrder salesOrder) =
      _undoConfirm;
  const factory SalesOrderEvent.uploadDataSalesOrder(
    SalesOrder salesOrder,
    String description,
    PlatformFile attachment,
  ) = _UploadDataSalesOrder;
  const factory SalesOrderEvent.updateDeliveryOrder(
    SalesOrder salesOrder,
  ) = _UpdateDeliveryOrder;
  const factory SalesOrderEvent.delete(SalesOrder salesOrder) = _Delete;
}

class SalesOrderBloc extends Bloc<SalesOrderEvent, SalesOrderState> {
  SalesOrderBloc() : super(const _Initial()) {
    on<SalesOrderEvent>((event, emit) async {
      await event.when(
        editAdditionalDiscount:
            (salesOrderId, type, termOfPayment, discountPercent) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.editAdditionalDiscount(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrderId: salesOrderId,
              type: type,
              termOfPayment: termOfPayment,
              discountPercent: discountPercent,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        create: (transactionTypeId, items, orderTypeId) async {
          emit(const _Loading());

          try {
            final salesOrder = await SalesOrderRepository.instance.create(
              accessToken: UserRepositoryApp.instance.token!,
              deliveryAddress: null,
              bankFee: 0,
              note: '',
              pph22Percent: 0,
              ppnPercent: 0,
              specialDiscountPercent: 0,
              rate: 0,
              customerId: null,
              currencyId: 'IDR',
              transactionTypeId: transactionTypeId,
              orderTypeId: orderTypeId,
              departmentId: 'MD',
            );

            for (final item in items) {
              await SalesOrderRepository.instance.detailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                salesOrder: salesOrder,
                quantity: item.quantity.toInt(),
                quantityDelivery: item.quantity.toInt(),
                batchNoId: item.product.batch,
                unitId: item.product.unit,
                productId: item.product.id,
                warehouse: item.product.warehouse,
                discountPercent: 0,
              );
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        viewHistoryHeader: (salesOrderId, revisionNo) async {
          emit(const _Loading());
          try {
            final salesOrderHistories = await SalesOrderRepository.instance
                .salesOrderFetchHistoriesHeader(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrderId!,
              revisionNo: revisionNo,
            );

            final salesOrderHistory = salesOrderHistories[0];
            final salesOrder = salesOrderHistory.salesOrder!;
            emit(
              _Initial(
                salesOrderHeaderInitial: SalesOrderHeaderInitial(
                  salesOrderId: salesOrder.id,
                  salesOrderDate: salesOrderHistory.createdAt,
                  deliveryOrder: salesOrderHistory.deliveryOrderId,
                  deliveryOrderDate: salesOrder.deliveryDate,
                  currency: salesOrder.productRequest!.currency,
                  deliveryOrderRemark:
                      salesOrderHistory.deliveryOrderOpenRemark,
                  department: salesOrder.productRequest!.department,
                  customer: salesOrder.productRequest!.customer,
                  productType: salesOrder.productRequest!.typeProduct,
                  termOfPayment: salesOrder.productRequest!.termOfPayment,
                  productRequestId: salesOrder.productRequest,
                  productIssue: salesOrderHistory.productIssueId,
                  invoice: salesOrderHistory.invoiceId,
                  transactionType: salesOrder.productRequest!.transactionType,
                  orderType: salesOrder.productRequest!.orderType,
                  deliveryAddress: salesOrder.productRequest!.deliveryAddress,
                  rate: salesOrder.productRequest!.rate,
                  subtotal: salesOrder.subtotal,
                  discountMargin: salesOrder.productRequest!.discountPercent,
                  discount: salesOrderHistory.discountPercent,
                  valueDiscount: salesOrderHistory.discountValue,
                  subtotalAfterDiscount:
                      salesOrderHistory.subtotalAfterDiscount,
                  additionDiscount: salesOrderHistory.additionalDiscountPercent,
                  valueAdditionDiscount:
                      salesOrderHistory.additionalDiscountValue,
                  ppn: salesOrderHistory.ppnPercent,
                  valuePpn: salesOrderHistory.ppnValue,
                  total: salesOrderHistory.total,
                  totalExchange: salesOrderHistory.exchangedValue,
                  pph22: salesOrderHistory.pph22Percent,
                  valuePph22: salesOrderHistory.pph22Value,
                  revisionNo: salesOrderHistory.revisionNo,
                  description: salesOrderHistory.description,
                ),
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        initialize: (salesOrderId, revisionNo) async {
          emit(const _Loading());
          try {
            final salesOrderHeader =
                await SalesOrderRepository.instance.salesOrderInitialFetch(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrderId,
              revisionNo: revisionNo,
            );

            final salesOrder = salesOrderHeader[0];
            final productRequest = salesOrder.productRequest!;
            emit(
              _Initial(
                salesOrderHeaderInitial: SalesOrderHeaderInitial(
                  salesOrderId: salesOrder.id,
                  salesOrderDate: salesOrder.createdAt,
                  deliveryOrder: salesOrder.deliveryOrderId,
                  deliveryOrderDate: salesOrder.deliveryDate,
                  currency: productRequest.currency,
                  deliveryOrderRemark: salesOrder.deliveryOrderOpenRemark,
                  department: productRequest.department,
                  customer: productRequest.customer,
                  productType: productRequest.typeProduct,
                  termOfPayment: productRequest.termOfPayment,
                  productRequestId: salesOrder.productRequest,
                  productIssue: salesOrder.productIssueId,
                  invoice: salesOrder.invoiceId,
                  transactionType: productRequest.transactionType,
                  orderType: productRequest.orderType,
                  deliveryAddress: productRequest.deliveryAddress,
                  rate: productRequest.rate,
                  subtotal: salesOrder.subtotal,
                  discountMargin: productRequest.discountPercent,
                  discount: salesOrder.discountPercent,
                  valueDiscount: salesOrder.discountValue,
                  subtotalAfterDiscount: salesOrder.subtotalAfterDiscount,
                  additionDiscount: salesOrder.additionalDiscountPercent,
                  valueAdditionDiscount: salesOrder.additionalDiscountValue,
                  ppn: salesOrder.ppnPercent,
                  valuePpn: salesOrder.ppnValue,
                  total: salesOrder.total,
                  totalExchange: salesOrder.exchangedValue,
                  pph22: salesOrder.pph22Percent,
                  valuePph22: salesOrder.pph22Value,
                  revisionNo: salesOrder.revisionNo,
                  description: salesOrder.description,
                ),
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirm: (salesOrder) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.salesOrderConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        undoConfirm: (salesOrder) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.salesOrderUndoConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        uploadDataSalesOrder: (salesOrder, description, attachment) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.uploadSalesOrder(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
              description: description,
              attachment: attachment,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateDeliveryOrder: (salesOrder) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.updateDeliveryOrder(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (salesOrder) async {
          emit(const _Loading());
          try {
            await SalesOrderRepository.instance.salesOrderDelete(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
