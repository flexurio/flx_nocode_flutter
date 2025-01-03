import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_request_bloc.freezed.dart';

@freezed
class ProductRequestState with _$ProductRequestState {
  const factory ProductRequestState.error(String error) = _Error;
  const factory ProductRequestState.initial({
    List<ProductRequestDetail>? products,
    ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder,
  }) = _Initial;
  const factory ProductRequestState.loading() = _Loading;
  const factory ProductRequestState.success({String? message}) = _Success;
}

@freezed
class ProductRequestEvent with _$ProductRequestEvent {
  const factory ProductRequestEvent.addAllProduct({
    required List<ProductRequestDetail> products,
  }) = _AddAllProduct;
  const factory ProductRequestEvent.cancelConfirm({
    required ProductRequestFormPurchaseOrder productRequest,
  }) = _CancelConfirm;
  const factory ProductRequestEvent.confirm({
    required ProductRequestFormPurchaseOrder productRequest,
  }) = _Confirm;
  const factory ProductRequestEvent.createFormProductToLocal({
    required ProductRequestDetail productRequestDetail,
  }) = _CreateFormProductToLocal;
  const factory ProductRequestEvent.createFormPurchaseOrderToLocal(
    ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder,
  ) = _CreateFormPurchaseOrderToLocal;
  const factory ProductRequestEvent.delete(ProductRequest productRequest) =
      _Delete;
  const factory ProductRequestEvent.deleteDetail(
    ProductRequestDetail productRequestDetail,
  ) = _DeleteDetail;
  const factory ProductRequestEvent.editFormPurchaseOrder(
    ProductRequest productRequest,
    ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder,
  ) = _EditFormPurchaseOrder;
  const factory ProductRequestEvent.editProductionRequestDetail(
    ProductRequestFormPurchaseOrder productRequest,
    ProductRequestDetail productRequestDetail,
  ) = _EditProductionRequestDetail;
  const factory ProductRequestEvent.createNewProductDetail(
    String productRequestId,
    double discountPrice,
    ProductRequestDetail product,
  ) = _CreateNewProductDetail;
  const factory ProductRequestEvent.initialize(
    ProductRequestFormPurchaseOrder productRequest,
  ) = _Initialize;
  const factory ProductRequestEvent.remove(ProductRequestDetail detail) =
      _Remove;
  const factory ProductRequestEvent.submit() = _Submit;
  const factory ProductRequestEvent.submitSalesOrder({
    required List<SalesOrderDetail> salesOrderDetail,
    required ProductRequest productRequest,
  }) = _SubmitSalesOrder;
}

class ProductRequestBloc
    extends Bloc<ProductRequestEvent, ProductRequestState> {
  ProductRequestBloc() : super(const _Initial(products: [])) {
    on<ProductRequestEvent>((event, emit) async {
      await event.when(
        initialize: (initialProductRequest) async {
          emit(const _Loading());
          _products.clear();

          final productRequest =
              await PurchasingRepository.instance.productRequestFetchById(
            accessToken: UserRepositoryApp.instance.token!,
            productRequest: initialProductRequest,
          );
          try {
            _productRequestFormPurchaseOrder = ProductRequestFormPurchaseOrder(
              receiveDate: productRequest.purchaseOrderDistributorDateReceive ??
                  DateTime(0),
              purchaseOrderDate:
                  productRequest.purchaseOrderDistributorDate ?? DateTime(0),
              rate: productRequest.rate,
              termOfPayment: productRequest.termOfPayment,
              productType: productRequest.typeProduct,
              purchaseOrderDistributor: productRequest.purchaseOrderDistributor,
              specialDiscountPercent: productRequest.discountPercent,
              ppnPercent: productRequest.ppnPercent,
              pph22Percent: productRequest.pph22Percent,
              department: productRequest.department,
              customer: productRequest.customer,
              transactionType: productRequest.transactionType,
              orderType: productRequest.orderType,
              currency: productRequest.currency,
              note: productRequest.description,
              address: productRequest.deliveryAddress,
              priceDiscountPercent: productRequest.discountValue,
              bankFee: productRequest.bankFee,
              id: productRequest.id,
              status: productRequest.status,
              ppnValue: productRequest.ppnValue,
              pph22Value: productRequest.pph22Value,
              subTotal: productRequest.subtotal,
              subTotalAfterDiscount: productRequest.subtotalAfterDiscount,
              total: productRequest.total,
            );
            _products =
                await PurchasingRepository.instance.productRequestDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
            );
            emit(
              _Initial(
                productRequestFormPurchaseOrder:
                    _productRequestFormPurchaseOrder,
                products: _products,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createFormPurchaseOrderToLocal: (form) async {
          _productRequestFormPurchaseOrder = form;
          _products = _products;
          emit(
            _Initial(
              productRequestFormPurchaseOrder: _productRequestFormPurchaseOrder,
              products: _products,
            ),
          );
        },
        submit: () async {
          emit(const _Loading());
          try {
            final productRequest =
                await PurchasingRepository.instance.productRequestCreate(
              purchaseOrderDate:
                  _productRequestFormPurchaseOrder!.purchaseOrderDate,
              receiveDate: _productRequestFormPurchaseOrder!.receiveDate,
              accessToken: UserRepositoryApp.instance.token!,
              rate: _productRequestFormPurchaseOrder!.rate!,
              termOfPayment: _productRequestFormPurchaseOrder!.termOfPayment!,
              typeProduct: _productRequestFormPurchaseOrder!.productType!,
              purchaseOrderDistributor:
                  _productRequestFormPurchaseOrder!.purchaseOrderDistributor!,
              discountPercent:
                  _productRequestFormPurchaseOrder!.specialDiscountPercent!,
              ppnPercent: _productRequestFormPurchaseOrder!.ppnPercent!,
              pph22Percent: _productRequestFormPurchaseOrder!.pph22Percent!,
              description: _productRequestFormPurchaseOrder!.note!,
              transactionType:
                  _productRequestFormPurchaseOrder!.transactionType!,
              orderType: _productRequestFormPurchaseOrder!.orderType!,
              department: _productRequestFormPurchaseOrder!.department!,
              customer: _productRequestFormPurchaseOrder!.customer!,
              currency: _productRequestFormPurchaseOrder!.currency!,
              address: _productRequestFormPurchaseOrder!.address!,
              bankFee: _productRequestFormPurchaseOrder!.bankFee!,
            );

            for (final product in _products) {
              await PurchasingRepository.instance.productRequestDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                productRequestId: productRequest.id,
                discountPrice:
                    _productRequestFormPurchaseOrder!.priceDiscountPercent!,
                productRequestDetail: product,
              );
            }

            emit(_Success(message: productRequest.id));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createNewProductDetail:
            (productRequestId, discountPrice, product) async {
          try {
            await PurchasingRepository.instance.productRequestDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              productRequestId: productRequestId,
              discountPrice: discountPrice,
              productRequestDetail: product,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        editFormPurchaseOrder: (productRequest, form) async {
          _productRequestFormPurchaseOrder = form;
          try {
            await PurchasingRepository.instance.productRequestUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
              purchaseOrderForm: _productRequestFormPurchaseOrder!,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        editProductionRequestDetail:
            (productRequest, productRequestDetail) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.productRequestDetailUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
              productRequestDetail: productRequestDetail,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirm: (
          productRequest,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.productRequestConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
            );

            emit(const _Success());
          } catch (e) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        cancelConfirm: (
          productRequest,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.productRequestCancelConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
            );

            emit(const _Success());
          } catch (e) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        delete: (productRequest) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.productRequestDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productRequest: productRequest,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deleteDetail: (productRequestDetail) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.productRequestDetailDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productRequestDetail: productRequestDetail,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        addAllProduct: (productRequestDetails) {
          _products = productRequestDetails;
          emit(
            _Initial(
              productRequestFormPurchaseOrder: _productRequestFormPurchaseOrder,
              products: List.from(productRequestDetails),
            ),
          );
        },
        createFormProductToLocal: (
          productRequestDetailData,
        ) async {
          try {
            var productRequestDetail = productRequestDetailData;

            final newState = List<ProductRequestDetail>.from(_products);

            final indexExists = newState.indexWhere(
              (element) =>
                  element.temporaryKey == productRequestDetail.temporaryKey,
            );

            if (indexExists > -1) {
              final price = productRequestDetail.price! -
                  productRequestDetail.priceAfterDiscount!;
              final qty = newState[indexExists].quantity! +
                  productRequestDetail.quantity!;

              productRequestDetail = productRequestDetail.copyWith(
                quantity: qty,
                subtotal: qty * price,
              );
              newState.removeAt(indexExists);
            }

            newState.add(productRequestDetail);
            _products = newState;
            emit(
              _Initial(
                productRequestFormPurchaseOrder:
                    _productRequestFormPurchaseOrder,
                products: _products,
              ),
            );
          } catch (e) {
            return null;
          }
        },
        remove: (detail) {
          final newState = List<ProductRequestDetail>.from(_products)
            ..removeWhere((element) => element == detail);
          _products = newState;
          emit(
            _Initial(
              productRequestFormPurchaseOrder: _productRequestFormPurchaseOrder,
              products: _products,
            ),
          );
        },
        submitSalesOrder: (
          salesOrderDetails,
          productRequest,
        ) async {
          emit(const _Loading());
          _salesOrderDetails = salesOrderDetails;
          try {
            final salesOrder = await SalesOrderRepository.instance.create(
              accessToken: UserRepositoryApp.instance.token!,
              deliveryAddress: _productRequestFormPurchaseOrder!.address!.id,
              specialDiscountPercent:
                  _productRequestFormPurchaseOrder!.specialDiscountPercent,
              ppnPercent: _productRequestFormPurchaseOrder!.ppnPercent,
              pph22Percent: _productRequestFormPurchaseOrder!.pph22Percent,
              note: _productRequestFormPurchaseOrder!.note,
              productRequestId: productRequest.id,
              bankFee: productRequest.bankFee,
            );

            for (final salesOrderDetail in _salesOrderDetails) {
              await SalesOrderRepository.instance.detailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                salesOrder: salesOrder,
                quantity: salesOrderDetail.quantity,
                quantityDelivery: salesOrderDetail.qtyDelivery,
                batchNoId: salesOrderDetail.batchNoId,
                unitId: salesOrderDetail.unitId,
                productId: salesOrderDetail.productId,
                warehouse: salesOrderDetail.warehouse,
                discountPercent: salesOrderDetail.discountPercent,
              );
            }

            emit(_Success(message: salesOrder.id));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  ProductRequestFormPurchaseOrder? _productRequestFormPurchaseOrder;

  late List<ProductRequestDetail> _products = [];
  late List<SalesOrderDetail> _salesOrderDetails = [];
}
