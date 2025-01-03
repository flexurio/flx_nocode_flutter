import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_design_bloc.freezed.dart';

@freezed
class MaterialDesignState with _$MaterialDesignState {
  const factory MaterialDesignState.initial() = _Initial;
  const factory MaterialDesignState.loading() = _Loading;
  const factory MaterialDesignState.success() = _Success;
  const factory MaterialDesignState.error(String error) = _Error;
}

@freezed
class MaterialDesignEvent with _$MaterialDesignEvent {
  const factory MaterialDesignEvent.create({
    required Material material,
    required ProductFormulation productFormulation,
    required String id,
    required String outsource,
  }) = _Create;

  const factory MaterialDesignEvent.edit({
    required MaterialDesign materialDesign,
    required String description,
  }) = _Edit;

  const factory MaterialDesignEvent.activate({
    required MaterialDesign materialDesign,
  }) = _Activate;

  const factory MaterialDesignEvent.deactivate({
    required MaterialDesign materialDesign,
  }) = _Deactivate;

  const factory MaterialDesignEvent.delete(MaterialDesign materialDesign) =
      _Delete;
}

class MaterialDesignBloc
    extends Bloc<MaterialDesignEvent, MaterialDesignState> {
  final bool isExternal;
  MaterialDesignBloc({
    required this.isExternal,
  }) : super(const _Initial()) {
    on<MaterialDesignEvent>((event, emit) async {
      await event.when(
        create: (material, productFormulation, id, outsource) async {
          emit(const _Loading());
          try {
            await MaterialDesignRepository.instance.materialDesignCreate(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
              id: id,
              outsource: outsource,
              productFormulation: productFormulation,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (materialDesign, description) async {
          emit(const _Loading());
          try {
            await MaterialDesignRepository.instance.materialDesignEdit(
              accessToken: UserRepositoryApp.instance.token!,
              materialDesign: materialDesign,
              description: description,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (materialDesign) async {
          emit(const _Loading());
          try {
            await MaterialDesignRepository.instance.materialDesignDelete(
              accessToken: UserRepositoryApp.instance.token!,
              materialDesign: materialDesign,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        activate: (materialDesign) async {
          emit(const _Loading());
          try {
            await MaterialDesignRepository.instance.materialDesignActivate(
              accessToken: UserRepositoryApp.instance.token!,
              materialDesign: materialDesign,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deactivate: (materialDesign) async {
          emit(const _Loading());
          try {
            await MaterialDesignRepository.instance.materialDesignDisable(
              accessToken: UserRepositoryApp.instance.token!,
              materialDesign: materialDesign,
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
}
