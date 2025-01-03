import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_check_bloc.freezed.dart';

@freezed
class ProductReturnCheckState with _$ProductReturnCheckState {
  const factory ProductReturnCheckState.initial() = _Initial;
  const factory ProductReturnCheckState.loading() = _Loading;
  const factory ProductReturnCheckState.success() = _Success;
  const factory ProductReturnCheckState.error(String? error) = _Error;
}

@freezed
class ProductReturnCheckEvent with _$ProductReturnCheckEvent {
  const factory ProductReturnCheckEvent.create({
    required List<ProductReturnCheck> productCheckList,
  }) = _Create;
  const factory ProductReturnCheckEvent.delete({
    required int id,
  }) = _Delete;
  const factory ProductReturnCheckEvent.updateDelivery({
    required int id,
  }) = _UpdateDelivery;
}

class ProductReturnCheckBloc
    extends Bloc<ProductReturnCheckEvent, ProductReturnCheckState> {
  ProductReturnCheckBloc() : super(const _Initial()) {
    on<ProductReturnCheckEvent>((event, emit) async {
      await event.when(
        create: (
          productCheckList,
        ) async {
          emit(const _Loading());
          try {
            for (var product in productCheckList) {
              await ProductRepository.instance.productReturnCheckCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  productReturnId: product.productReturnId.id,
                  productId: product.productId.id,
                  productionOrderId: product.batch.id,
                  unitId: product.unitId.id,
                  quantity: product.quantity,
                  description: product.description,
                  status: product.status.id);
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnCheckDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        updateDelivery: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnCheckUpdateDelivery(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
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
