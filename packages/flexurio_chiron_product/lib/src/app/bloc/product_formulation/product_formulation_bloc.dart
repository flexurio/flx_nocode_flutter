import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product/src/app/resource/product_formulation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_formulation_bloc.freezed.dart';

@freezed
class ProductFormulationState with _$ProductFormulationState {
  const factory ProductFormulationState.initial() = _Initial;
  const factory ProductFormulationState.loading() = _Loading;
  const factory ProductFormulationState.success() = _Success;
  const factory ProductFormulationState.error(String error) = _Error;
}

@freezed
class ProductFormulationEvent with _$ProductFormulationEvent {
  const factory ProductFormulationEvent.create(
    String productId,
    String type,
    double quantity,
    String scale,
    String productUnitId,
    List<ProductFormulationDetailTemporary> productFormulationDetail,
    String remark,
    String name,
  ) = _Create;
  const factory ProductFormulationEvent.update(
    int id,
    String productId,
    String type,
    int quantity,
    String scale,
    String productUnitId,
    List<ProductFormulationDetailTemporary> productFormulationDetail,
  ) = _Update;
  const factory ProductFormulationEvent.submit(
    int id,
    String productId,
    String type,
    double quantity,
    String scale,
    String productUnitId,
    List<ProductFormulationDetailTemporary> state,
    List<ProductFormulationDetailTemporary> productFormulationDetail,
    String name,
    String remark,
  ) = _Submit;
  const factory ProductFormulationEvent.delete(int id) = _Delete;
  const factory ProductFormulationEvent.confirm(int id) = _Confirm;
  const factory ProductFormulationEvent.nonActive(int id) = _NonActive;
  const factory ProductFormulationEvent.active(
    ProductFormulation productFormulation,
  ) = _Active;
}

class ProductFormulationBloc
    extends Bloc<ProductFormulationEvent, ProductFormulationState> {
      final bool isExternal;
  ProductFormulationBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<ProductFormulationEvent>((event, emit) async {
      await event.when(
        create: (
          productId,
          type,
          quantity,
          scale,
          productUnitId,
          productFormulationDetail,
          remark,
          name,
        ) async {
          emit(const _Loading());
          try {
            final formulationHeader = await ProductFormulationRepository.instance
                .productFormulationCreate(
              accessToken: UserRepositoryApp.instance.token!,
              productId: productId,
              type: type,
              quantity: quantity,
              scale: scale,
              productUnitId: productUnitId,
              remark: remark,
              name: name,
              isExternal: isExternal,
            );

            for (var i = 0; i < productFormulationDetail.length; i++) {
              await ProductFormulationRepository.instance
                  .productFormulationDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                formulationId: formulationHeader,
                material: productFormulationDetail[i].material!,
                quantity: productFormulationDetail[i].quantity,
                materialUnitId: productUnitId,
              isExternal: isExternal,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          id,
          productId,
          type,
          quantity,
          scale,
          productUnitId,
          productFormulationDetail,
        ) async {
          emit(const _Loading());
          try {
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductFormulationRepository.instance
                .productFormulationDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirm: (id) async {
          emit(const _Loading());
          try {
            await ProductFormulationRepository.instance
                .productFormulationConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        active: (productFormulation) async {
          emit(const _Loading());
          try {
            await ProductFormulationRepository.instance
                .productFormulationActive(
              accessToken: UserRepositoryApp.instance.token!,
              productFormulation: productFormulation,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        nonActive: (id) async {
          emit(const _Loading());
          try {
            await ProductFormulationRepository.instance
                .productFormulationNonActive(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        submit: (
          id,
          productId,
          type,
          quantity,
          scale,
          productUnitId,
          state3,
          newState3,
          name,
          remark,
        ) async {
          emit(const _Loading());
          try {
            final compare = compareObject<ProductFormulationDetailTemporary>(
              initial: state3,
              data: newState3,
              keyMatch: (first, second) {
                return first.id == second.id;
              },
            );

            await ProductFormulationRepository.instance
                .productFormulationUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              productId: productId,
              type: type,
              quantity: quantity,
              scale: scale,
              productUnitId: productUnitId,
              name: name,
              remark: remark,
              isExternal: isExternal,
            );

            for (final workHour in compare.removed) {
              await ProductFormulationRepository.instance
                  .productFormulationDetailDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: workHour.id,
              isExternal: isExternal,
              );
            }

            for (final workHour in compare.added) {
              await ProductFormulationRepository.instance
                  .productFormulationDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                formulationId: id,
                material: workHour.material!,
                quantity: workHour.quantity,
                materialUnitId: workHour.material!.materialUnit.id,
              isExternal: isExternal,
              );
            }

            for (final workHour in compare.changed) {
              await ProductFormulationRepository.instance
                  .productFormulationDetailUpdate(
                id: workHour.id,
                accessToken: UserRepositoryApp.instance.token!,
                formulationId: id,
                material: workHour.material!,
                quantity: workHour.quantity,
                materialUnitId: workHour.material!.materialUnit.id,
              isExternal: isExternal,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
