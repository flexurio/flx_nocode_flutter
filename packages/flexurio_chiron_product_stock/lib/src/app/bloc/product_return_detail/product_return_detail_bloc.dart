import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_return_detail_bloc.freezed.dart';

@freezed
class ProductReturnDetailState with _$ProductReturnDetailState {
  const factory ProductReturnDetailState.initial(
    List<ProductReturnDetail> products,
  ) = _Initial;
  const factory ProductReturnDetailState.loading() = _Loading;
  const factory ProductReturnDetailState.success() = _Success;
  const factory ProductReturnDetailState.error(String error) = _Error;
}

@freezed
class ProductReturnDetailEvent with _$ProductReturnDetailEvent {
  const factory ProductReturnDetailEvent.productAdd({
    required ProductReturnDetail products,
  }) = _ProductAdd;
  const factory ProductReturnDetailEvent.create({
    required ProductReturn productReturn,
    required Product product,
    required ProductionOrder productionOrder,
    required String deliveryOrderId,
    required MaterialUnit materialUnit,
    required double productPrice,
    required double quantity,
    required double totalProductPrice,
    required DateTime expirationDate,
  }) = _Create;
  const factory ProductReturnDetailEvent.edit({
    required int id,
    required int productPrice,
    required int quantity,
    required int totalProductPrice,
    required DateTime expirationDate,
  }) = _Edit;
  const factory ProductReturnDetailEvent.delete({
    required int id,
  }) = _Delete;
  const factory ProductReturnDetailEvent.checkQC({
    required int id,
  }) = _CheckQC;
}

class ProductReturnDetailBloc
    extends Bloc<ProductReturnDetailEvent, ProductReturnDetailState> {
  ProductReturnDetailBloc() : super(const _Initial([])) {
    on<ProductReturnDetailEvent>((event, emit) async {
      await event.when(
        productAdd: (products) {},
        checkQC: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnDetailCheckQC(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        create: (
          productReturn,
          product,
          productionOrder,
          deliveryOrderId,
          materialUnit,
          productPrice,
          quantity,
          totalProductPrice,
          expirationDate,
        ) async {
          emit(const _Loading());
          try {
            // await ProductRepository.instance.productReturnDetailCreate(
            // accessToken: UserRepository.instance.token!,
            // productReturn: productReturn,
            // product: product,
            // productionOrder: productionOrder,
            // deliveryOrderId: deliveryOrderId,
            // materialUnit: materialUnit,
            // productPrice: productPrice,
            // quantity: quantity,
            // totalProductPrice: totalProductPrice,
            // expirationDate: expirationDate,
            // );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          id,
          productPrice,
          quantity,
          totalProductPrice,
          expirationDate,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnDetailEdit(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              productPrice: productPrice,
              quantity: quantity,
              totalProductPrice: totalProductPrice,
              expirationDate: expirationDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnDetailDelete(
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
