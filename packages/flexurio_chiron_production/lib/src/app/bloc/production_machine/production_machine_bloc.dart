import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'production_machine_bloc.freezed.dart';

@freezed
class ProductionMachineState with _$ProductionMachineState {
  const factory ProductionMachineState.initial() = _Initial;
  const factory ProductionMachineState.loading() = _Loading;
  const factory ProductionMachineState.success() = _Success;
  const factory ProductionMachineState.error(String error) = _Error;
}

@freezed
class ProductionMachineEvent with _$ProductionMachineEvent {
  const factory ProductionMachineEvent.create(String name, String assetNumber) =
      _Create;
  const factory ProductionMachineEvent.update(
    int id,
    String name,
    String assetNumber,
  ) = _Update;
  const factory ProductionMachineEvent.delete(int id) = _Delete;
}

class ProductionMachineBloc
    extends Bloc<ProductionMachineEvent, ProductionMachineState> {
  ProductionMachineBloc() : super(const _Initial()) {
    on<ProductionMachineEvent>((event, emit) async {
      await event.when(
        create: (name, assetNumber) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.machineCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              assetNumber: assetNumber,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (id, name, assetNumber) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.machineUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              assetNumber: assetNumber,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductionRepository.instance.machineDelete(
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
