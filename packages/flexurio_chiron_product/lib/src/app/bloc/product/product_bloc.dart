import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/resource/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'product_bloc.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.success() = _Success;
  const factory ProductState.error(String error) = _Error;
}

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.create({
    required String id,
    required String no,
    required String name,
    required String type,
    required ProductGroup productGroup,
    required MaterialUnit unitPacking,
    required MaterialUnit unitSmallest,
    required MaterialUnit unitOrder,
    required MaterialUnit unitSecondary,
    required int expiryPeriod,
    required bool tollOut,
    required int quantityTablet,
    required int quantityStrip,
    required int quantityBatch,
    required int quantityPack,
    required DivisionType divisionType,
    required String companyId,
  }) = _Create;

  const factory ProductEvent.update({
    required String id,
    required String no,
    required String name,
    required String type,
    required ProductGroup productGroup,
    required MaterialUnit unitPacking,
    required MaterialUnit unitSmallest,
    required MaterialUnit unitOrder,
    required MaterialUnit unitSecondary,
    required int expiryPeriod,
    required bool tollOut,
    required int quantityTablet,
    required int quantityStrip,
    required int quantityBatch,
    required int quantityPack,
    required DivisionType divisionType,
  }) = _Update;
  const factory ProductEvent.delete(String id) = _Delete;
  const factory ProductEvent.activate({required String id}) = _Activate;
  const factory ProductEvent.deactivate({required String id}) = _Deactivate;
  const factory ProductEvent.phasedOut({required Product product}) = _PhasedOut;
  const factory ProductEvent.notPhasedOut({required Product product}) =
      _NotPhasedOut;
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final bool isExternal;
  ProductBloc({required this.isExternal}) : super(const _Initial()) {
    on<ProductEvent>((event, emit) async {
      await event.when(
        create: (
          id,
          no,
          name,
          type,
          productGroup,
          unitPacking,
          unitSmallest,
          unitOrder,
          unitSecondary,
          expiryPeriod,
          tollOut,
          quantityTablet,
          quantityStrip,
          quantityBatch,
          quantityPack,
          divisionType,
          companyId,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepositoryX.instance.productCreate(
              accessToken: UserRepositoryApp.instance.token!,
              expiryPeriod: expiryPeriod,
              id: id,
              productGroup: productGroup,
              name: name,
              no: no,
              quantityBatch: quantityBatch,
              quantityPack: quantityPack,
              quantityStrip: quantityStrip,
              quantityTablet: quantityTablet,
              tollOut: tollOut,
              type: type,
              unitOrder: unitOrder,
              unitPacking: unitPacking,
              unitSmallest: unitSmallest,
              divisionType: divisionType,
              unitSecondary: unitSecondary,
              isExternal: isExternal,
              companyId: companyId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductRepositoryX.instance.productDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          id,
          no,
          name,
          type,
          productGroup,
          unitPacking,
          unitSmallest,
          unitOrder,
          unitSecondary,
          expiryPeriod,
          tollOut,
          quantityTablet,
          quantityStrip,
          quantityBatch,
          quantityPack,
          divisionType,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepositoryX.instance.productUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              expiryPeriod: expiryPeriod,
              id: id,
              productGroup: productGroup,
              name: name,
              no: no,
              quantityBatch: quantityBatch,
              quantityPack: quantityPack,
              quantityStrip: quantityStrip,
              quantityTablet: quantityTablet,
              tollOut: tollOut,
              type: type,
              unitOrder: unitOrder,
              unitPacking: unitPacking,
              unitSmallest: unitSmallest,
              unitSecondary: unitSecondary,
              divisionType: divisionType,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        activate: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productActivate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deactivate: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productDeactivate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        phasedOut: (product) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productPhasedOut(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        notPhasedOut: (product) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productNotPhasedOut(
              accessToken: UserRepositoryApp.instance.token!,
              product: product,
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
