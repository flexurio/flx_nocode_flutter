import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_receive.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_receive_bloc.freezed.dart';

@freezed
class ProductReceiveState with _$ProductReceiveState {
  const factory ProductReceiveState.initial({
    required List<ProductReceiveDetail> productReceiveDetails,
    ProductReceiveFormTransaction? productReceiveForm,
  }) = _Initial;
  const factory ProductReceiveState.loading() = _Loading;
  const factory ProductReceiveState.success() = _Success;
  const factory ProductReceiveState.error(String error) = _Error;
}

@freezed
class ProductReceiveEvent with _$ProductReceiveEvent {
  const factory ProductReceiveEvent.initialize(
    ProductReceive productReceive,
  ) = _Initialize;
  const factory ProductReceiveEvent.submit() = _Submit;
  const factory ProductReceiveEvent.transactionCreate(
    ProductReceiveFormTransaction productReceiveForm,
  ) = _TransactionCreate;
  const factory ProductReceiveEvent.transactionEdit(
    ProductReceive productReceive,
    ProductReceiveFormTransaction productReceiveForm,
  ) = _TransactionEdit;
  const factory ProductReceiveEvent.productEdit(
    ProductReceiveDetail productReceive,
  ) = _ProductEdit;
  const factory ProductReceiveEvent.productAdd(
    ProductReceiveDetail productReceiveDetail,
  ) = _ProductAdd;
  const factory ProductReceiveEvent.productRelease(
    ProductReceiveDetail productReceiveDetail,
  ) = _ProductRelease;
  const factory ProductReceiveEvent.productReject(
    ProductReceiveDetail productReceiveDetail,
    String reason,
  ) = _ProductReject;
  const factory ProductReceiveEvent.productRemove(
    ProductReceiveDetail productReceiveDetail,
  ) = _ProductRemove;
  const factory ProductReceiveEvent.productReceiveHeaderEdit({
    required ProductReceive productReceive,
    required String description,
    String? deliveryOrder,
    DateTime? deliveryOrderDate,
  }) = _ProductReceiveHeaderEdit;
}

class ProductReceiveBloc
    extends Bloc<ProductReceiveEvent, ProductReceiveState> {
  final bool isExternal;
  ProductReceiveBloc({
    required this.isExternal,
  }) : super(const _Initial(productReceiveDetails: [])) {
    on<ProductReceiveEvent>((event, emit) async {
      await event.when(
        transactionCreate: (form) async {
          _productReceiveFormTransaction = form;
          emit(
            _Initial(
              productReceiveForm: _productReceiveFormTransaction,
              productReceiveDetails: _productReceiveDetails,
            ),
          );
        },
        transactionEdit: (productReceive, form) async {
          _productReceiveFormTransaction = form;
          try {
            emit(const _Loading());

            await ProductReceiveRepository.instance
                .productReceiveByNonPurchaseOrderEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productReceiveForm: _productReceiveFormTransaction!,
              productReceive: productReceive,
              isExternal: isExternal,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productEdit: (productReceiveDetail) async {
          try {
            emit(const _Loading());
            await ProductReceiveRepository.instance.productReceiveDetailEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productReceiveDetail: productReceiveDetail,
              isExternal: isExternal,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productAdd: (product) async {
          emit(const _Loading());
          _productReceiveDetails.add(product);
          emit(
            _Initial(
              productReceiveForm: _productReceiveFormTransaction,
              productReceiveDetails: _productReceiveDetails,
            ),
          );
        },
        productRemove: (product) async {
          emit(const _Loading());
          _productReceiveDetails.remove(product);
          emit(
            _Initial(
              productReceiveForm: _productReceiveFormTransaction,
              productReceiveDetails: List.from(_productReceiveDetails),
            ),
          );
        },
        submit: () async {
          emit(const _Loading());
          try {
            late ProductReceive productReceive;
            final type = _productReceiveFormTransaction!.type;

            switch (type) {
              case ProductReceiveType.packing:
                productReceive = await ProductReceiveRepository.instance
                    .productReceiveByPacking(
                  accessToken: UserRepositoryApp.instance.token!,
                  description: _productReceiveFormTransaction!.description,
                  isExternal: isExternal,
                );
              case ProductReceiveType.nonPurchaseOrder:
                productReceive = await ProductReceiveRepository.instance
                    .productReceiveByNonPurchaseOrderCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  departmentId: UserRepositoryApp.instance.department!.id,
                  productReceiveForm: _productReceiveFormTransaction!,
                  isExternal: isExternal,
                );
              case ProductReceiveType.purchaseOrder:
                productReceive = await ProductReceiveRepository.instance
                    .productReceiveByPurchaseOrderCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  productReceiveForm: _productReceiveFormTransaction!,
                  isExternal: isExternal,
                );
            }

            for (final productReceiveDetail in _productReceiveDetails) {
              if (productReceiveDetail.productionOrder.scale ==
                  ProductionProductScale.empty) {
                await ProductionOrderRepository.instance
                    .productionOrderNonProductionCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  product: productReceiveDetail.product,
                  batchNo: productReceiveDetail.productionOrder.id,
                  expirationDate:
                      productReceiveDetail.productionOrder.expirationDate,
                  isExternal: isExternal,
                );
              }

              await ProductReceiveRepository.instance
                  .productReceiveDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                productReceive: productReceive,
                productReceiveDetail: productReceiveDetail,
                type: type,
                isExternal: isExternal,
              );
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        initialize: (productReceiveInitial) async {
          emit(const _Loading());

          _productReceiveDetails.clear();

          final productReceive =
              await ProductReceiveRepository.instance.productReceiveFetchById(
            accessToken: UserRepositoryApp.instance.token!,
            productReceive: productReceiveInitial,
            isExternal: isExternal,
          );

          try {
            _productReceiveFormTransaction = ProductReceiveFormTransaction(
              transactionType: productReceive.transactionType,
              supplier: productReceive.supplier,
              purchaseOrder: productReceive.purchaseOrder,
              deliveryOrderId: productReceive.deliveryOrderId,
              deliveryOrderDate: productReceive.deliveryOrderDate,
              type: productReceive.type,
              description: productReceive.description,
            );
            final products = await ProductReceiveRepository.instance
                .productReceiveDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              productReceive: productReceive,
              pageOptions: PageOptions.emptyNoLimit(),
              isExternal: isExternal,
            );
            _productReceiveDetails.addAll(products.data);

            emit(
              _Initial(
                productReceiveForm: _productReceiveFormTransaction,
                productReceiveDetails: _productReceiveDetails,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productRelease: (productReceiveDetail) async {
          emit(const _Loading());
          try {
            await ProductReceiveRepository.instance.productReceiveDetailRelease(
              accessToken: UserRepositoryApp.instance.token!,
              productReceiveDetail: productReceiveDetail,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productReject: (productReceiveDetail, reason) async {
          emit(const _Loading());
          try {
            await ProductReceiveRepository.instance.productReceiveDetailReject(
              accessToken: UserRepositoryApp.instance.token!,
              productReceiveDetail: productReceiveDetail,
              reason: reason,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productReceiveHeaderEdit: (
          productReceive,
          description,
          deliveryOrder,
          deliveryOrderDate,
        ) async {
          try {
            emit(const _Loading());
            await ProductReceiveRepository.instance.productReceiveHeaderEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productReceive: productReceive,
              deliveryOrder: deliveryOrder,
              deliveryOrderDate: deliveryOrderDate,
              description: description,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  ProductReceiveFormTransaction? _productReceiveFormTransaction;
  final List<ProductReceiveDetail> _productReceiveDetails = [];
}
