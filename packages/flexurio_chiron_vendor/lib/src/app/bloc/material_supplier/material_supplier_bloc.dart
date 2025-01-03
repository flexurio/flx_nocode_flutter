import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_supplier_bloc.freezed.dart';

@freezed
abstract class MaterialSupplierState with _$MaterialSupplierState {
  const factory MaterialSupplierState.initial() = _Initial;
  const factory MaterialSupplierState.loading() = _Loading;
  const factory MaterialSupplierState.success(DataAction dataAction) = _Success;
  const factory MaterialSupplierState.error(String error) = _Error;
}

@freezed
abstract class MaterialSupplierEvent with _$MaterialSupplierEvent {
  const factory MaterialSupplierEvent.create({
    required int leadTimePurch,
    required String materialId,
    required String supplierId,
  }) = _Create;
  const factory MaterialSupplierEvent.update({
    required MaterialSupplierLeadTime materialSupplierLeadTime,
    required int leadTimePurch,
    required String materialId,
  }) = _Update;
  const factory MaterialSupplierEvent.updateBatch({
    required List<MaterialSupplierLeadTime> materialSupplierLeadTimes,
    required List<int> leadTimePurchs,
    required String materialId,
  }) = _UpdateBatch;
  const factory MaterialSupplierEvent.delete({
    required MaterialSupplierLeadTime materialSupplierLeadTime,
  }) = _Delete;
}

class MaterialSupplierBloc
    extends Bloc<MaterialSupplierEvent, MaterialSupplierState> {
  MaterialSupplierBloc() : super(const _Initial()) {
    on<MaterialSupplierEvent>((event, emit) async {
      await event.when(
        create: (
          leadTimePurch,
          materialId,
          supplierId,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialSupplierCreate(
              accessToken: UserRepositoryApp.instance.token!,
              leadTimePurch: leadTimePurch,
              materialId: materialId,
              supplierId: supplierId,
            );
            emit(const _Success(DataAction.create));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        update: (
          materialSupplierLeadTimes,
          leadTimePurch,
          materialId,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialSupplierUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              materialSupplierLeadTime: materialSupplierLeadTimes,
              leadTimePurch: leadTimePurch,
              materialId: materialId,
            );
            emit(const _Success(DataAction.update));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        updateBatch: (
          materialSuppliers,
          leadTimes,
          materialId,
        ) async {
          emit(const _Loading());
          try {
            for (var i = 0; i < materialSuppliers.length; i++) {
              await MaterialRepository.instance.materialSupplierUpdate(
                accessToken: UserRepositoryApp.instance.token!,
                materialSupplierLeadTime: materialSuppliers[i],
                leadTimePurch: leadTimes[i],
                materialId: materialId,
              );
            }
            emit(const _Success(DataAction.update));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
        delete: (materialSupplierLeadTimes) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialSupplierDelete(
              accessToken: UserRepositoryApp.instance.token!,
              materialSupplierLeadTime: materialSupplierLeadTimes,
            );
            emit(const _Success(DataAction.delete));
          } catch (error) {
            emit(const _Error(errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
