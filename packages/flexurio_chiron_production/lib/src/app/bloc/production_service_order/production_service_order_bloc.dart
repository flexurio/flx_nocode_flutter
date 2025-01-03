import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_service_order_bloc.freezed.dart';

@freezed
class ProductionServiceOrderState with _$ProductionServiceOrderState {
  const factory ProductionServiceOrderState.initial() = _Initial;
  const factory ProductionServiceOrderState.loading() = _Loading;
  const factory ProductionServiceOrderState.success() = _Success;
  const factory ProductionServiceOrderState.error(String error) = _Error;
}

@freezed
class ProductionServiceOrderEvent with _$ProductionServiceOrderEvent {
  const factory ProductionServiceOrderEvent.create({
    required String productId,
    required String productName,
    required String customerId,
    required String batchNo,
    required String purchaseOrderId,
    required int quantity,
    required String description,
    required bool isBulk,
    required ProductionProductStatus status,
    required ProductionProductScale scale,
    required DateTime expirationDate,
  }) = _Create;
  const factory ProductionServiceOrderEvent.edit({
    required ProductionServiceOrder productionServiceOrder,
    required String productId,
    required String productName,
    required String customerId,
    required String batchNo,
    required String purchaseOrderId,
    required int quantity,
    required String description,
    required bool isBulk,
    required ProductionProductStatus status,
    required ProductionProductScale scale,
    required DateTime expirationDate,
  }) = _Update;
  const factory ProductionServiceOrderEvent.delete(
    ProductionServiceOrder productionServiceOrder,
  ) = _Delete;
  const factory ProductionServiceOrderEvent.rework(
    ProductionServiceOrder productionServiceOrder,
  ) = _Rework;
  const factory ProductionServiceOrderEvent.cancelRework(
    ProductionServiceOrder productionServiceOrder,
    String reason,
  ) = _CancelRework;
}

class ProductionServiceOrderBloc
    extends Bloc<ProductionServiceOrderEvent, ProductionServiceOrderState> {
  ProductionServiceOrderBloc() : super(const _Initial()) {
    on<ProductionServiceOrderEvent>((event, emit) async {
      await event.when(
        create: (
          productId,
          productName,
          customerId,
          batchNo,
          purchaseOrderId,
          quantity,
          description,
          isBulk,
          status,
          scale,
          expirationDate,
        ) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.serviceOrderCreate(
              accessToken: UserRepositoryApp.instance.token!,
              productId: productId,
              productName: productName,
              customerId: customerId,
              batchNo: batchNo,
              purchaseOrderId: purchaseOrderId,
              quantity: quantity,
              description: description,
              isBulk: isBulk,
              status: status,
              scale: scale,
              expirationDate: expirationDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          productionServiceOrder,
          productId,
          productName,
          customerId,
          batchNo,
          purchaseOrderId,
          quantity,
          description,
          isBulk,
          status,
          scale,
          expirationDate,
        ) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.serviceOrderEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productId: productId,
              productName: productName,
              customerId: customerId,
              batchNo: batchNo,
              purchaseOrderId: purchaseOrderId,
              quantity: quantity,
              description: description,
              isBulk: isBulk,
              status: status,
              scale: scale,
              expirationDate: expirationDate,
              productionServiceOrder: productionServiceOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (productionServiceOrder) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.serviceOrderDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productionServiceOrder: productionServiceOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rework: (productionServiceOrder) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.serviceOrderRework(
              accessToken: UserRepositoryApp.instance.token!,
              productionServiceOrder: productionServiceOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        cancelRework: (productionServiceOrder, reason) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.serviceOrderCancelRework(
              accessToken: UserRepositoryApp.instance.token!,
              productionServiceOrder: productionServiceOrder,
              reason: reason,
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
