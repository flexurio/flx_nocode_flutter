import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_material/src/app/resource/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_bloc.freezed.dart';

@freezed
class MaterialState with _$MaterialState {
  const factory MaterialState.initial() = _Initial;
  const factory MaterialState.loading() = _Loading;
  const factory MaterialState.success() = _Success;
  const factory MaterialState.error(String error) = _Error;
}

@freezed
class MaterialEvent with _$MaterialEvent {
  const factory MaterialEvent.create({
    required String name,
    required MaterialGroup materialGroup,
    required MaterialUnit materialUnit,
    required MaterialUnit stockUnit,
    required String id,
    required int packSize,
    required MaterialType type,
    bool? isAssets,
    required String companyId,
  }) = _Create;
  const factory MaterialEvent.edit({
    required String name,
    required MaterialGroup materialGroup,
    required MaterialUnit materialUnit,
    required String id,
    required int packSize,
    required MaterialType type,
    bool? isAssets,
  }) = _Edit;
  const factory MaterialEvent.delete({required String id}) = _Delete;
  const factory MaterialEvent.activate({required String id}) = _Activate;
  const factory MaterialEvent.deactivate({required String id}) = _Deactivate;
  const factory MaterialEvent.activateIsStock({
    required Material material,
  }) = _ActivateIsStock;
  const factory MaterialEvent.deactivateIsStock({
    required Material material,
  }) = _DeactivateIsStock;
  const factory MaterialEvent.activateIsOrder({
    required Material material,
  }) = _ActivateIsOrder;
  const factory MaterialEvent.deactivateIsOrder({
    required Material material,
  }) = _DeactivateIsOrder;
}

class MaterialBloc extends Bloc<MaterialEvent, MaterialState> {
  final bool isExternal;

  MaterialBloc({this.isExternal = false}) : super(const _Initial()) {
    on<MaterialEvent>((event, emit) async {
      await event.when(
        create: (
          name,
          materialGroup,
          materialUnit,
          stockUnit,
          idMaterial,
          packSize,
          type,
          isAssets,
          companyId,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialCreate(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroup: materialGroup,
              materialUnit: materialUnit,
              stockUnit: stockUnit,
              name: name,
              id: idMaterial,
              isAsset: isAssets!,
              packSize: packSize,
              type: type,
              isExternal: isExternal,
              companyId: companyId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          name,
          materialGroupId,
          materialUnitId,
          idMaterial,
          packSize,
          type,
          isAssets,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialEdit(
              accessToken: UserRepositoryApp.instance.token!,
              idMaterial: idMaterial,
              name: name,
              materialGroupId: materialGroupId,
              materialUnitId: materialUnitId,
              isAsset: isAssets!,
              packSize: packSize,
              type: type,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
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
            await MaterialRepositoryX.instance.materialActivate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deactivate: (id) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialDeactivate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        activateIsStock: (material) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialActivateIsStock(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deactivateIsStock: (material) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialDeactivateIsStock(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        activateIsOrder: (material) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialActivateIsOrder(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deactivateIsOrder: (material) async {
          emit(const _Loading());
          try {
            await MaterialRepositoryX.instance.materialDeactivateIsOrder(
              accessToken: UserRepositoryApp.instance.token!,
              material: material,
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
