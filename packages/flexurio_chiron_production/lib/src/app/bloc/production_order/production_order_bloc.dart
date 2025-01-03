import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_chiron_production/src/app/resource/production_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'production_order_bloc.freezed.dart';

@freezed
class ProductionOrderState with _$ProductionOrderState {
  const factory ProductionOrderState.initial() = _Initial;
  const factory ProductionOrderState.loading() = _Loading;
  const factory ProductionOrderState.success() = _Success;
  const factory ProductionOrderState.error(String error) = _Error;
}

@freezed
class ProductionOrderEvent with _$ProductionOrderEvent {
  const factory ProductionOrderEvent.create({
    required bool isRuahan,
    required Product product,
    required bool isTollIn,
    required String batchNo,
    required int batchSize,
    required ProductionProductScale scale,
    required DateTime expirationDate,
    required String description,
    required ProductionProductStatus productStatus,
  }) = _Create;
  const factory ProductionOrderEvent.update({
    required bool isRuahan,
    required Product product,
    required bool isTollIn,
    required String batchNo,
    required int batchSize,
    required ProductionProductScale scale,
    required DateTime expirationDate,
    required String description,
    required ProductionProductStatus productStatus,
  }) = _Update;
  const factory ProductionOrderEvent.delete(ProductionOrder productionOrder) =
      _Delete;
  const factory ProductionOrderEvent.rework(ProductionOrder productionOrder) =
      _Rework;
  const factory ProductionOrderEvent.cancelRework(
    ProductionOrder productionOrder,
    String reason,
  ) = _CancelRework;
  const factory ProductionOrderEvent.confirm(ProductionOrder productionOrder) =
      _Confirm;
}

class ProductionOrderBloc
    extends Bloc<ProductionOrderEvent, ProductionOrderState> {
  ProductionOrderBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductionOrderEvent>((event, emit) async {
      await event.when(
        create: (
          isRuahan,
          product,
          isTollIn,
          batchNo,
          batchSize,
          scale,
          expirationDate,
          description,
          productType,
        ) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance.productionOrderCreate(
              accessToken: UserRepositoryApp.instance.token!,
              isRuahan: isRuahan,
              product: product,
              isTollIn: isTollIn,
              batchNo: batchNo,
              batchSize: batchSize,
              scale: scale,
              expirationDate: expirationDate,
              description: description,
              productStatus: productType,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          isRuahan,
          product,
          isTollIn,
          batchNo,
          batchSize,
          scale,
          expirationDate,
          description,
          productStatus,
        ) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance.productionOrderUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              isRuahan: isRuahan,
              product: product,
              isTollIn: isTollIn,
              batchNo: batchNo,
              batchSize: batchSize,
              scale: scale,
              expirationDate: expirationDate,
              description: description,
              productStatus: productStatus,
              isExternal: isExternal,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (productionOrder) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance.productionOrderDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productionOrder: productionOrder,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rework: (productionOrder) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance.productionOrderRework(
              accessToken: UserRepositoryApp.instance.token!,
              productionOrder: productionOrder,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        cancelRework: (productionOrder, reason) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance
                .productionOrderCancelRework(
              accessToken: UserRepositoryApp.instance.token!,
              productionOrder: productionOrder,
              reason: reason,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirm: (productionOrder) async {
          emit(const _Loading());
          try {
            await ProductionOrderRepository.instance.productionOrderConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              productionOrder: productionOrder,
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
  final bool isExternal;
}
