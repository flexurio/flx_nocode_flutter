import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_bloc.freezed.dart';

@freezed
class VehicleState with _$VehicleState {
  const factory VehicleState.initial() = _Initial;
  const factory VehicleState.loading() = _Loading;
  const factory VehicleState.success() = _Success;
  const factory VehicleState.error(String error) = _Error;
}

@freezed
class VehicleEvent with _$VehicleEvent {
  const factory VehicleEvent.create({
    required String brand,
    required String vehicleNo,
    required String category,
    required String fuel,
    required int manufacturerYear,
  }) = _Create;
  const factory VehicleEvent.update({
    required Vehicle vehicle,
    required String brand,
    required String category,
    required String fuel,
    required int manufacturerYear,
  }) = _Update;
  const factory VehicleEvent.delete(Vehicle vehicle) = _Delete;
  const factory VehicleEvent.active(Vehicle vehicle) = _Active;
  const factory VehicleEvent.deActive(Vehicle vehicle) = _DeActive;
}

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(const _Initial()) {
    on<VehicleEvent>((event, emit) async {
      await event.when(
        create: (
          String brand,
          String vehicleNo,
          String category,
          String fuel,
          int manufacturerYear,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleCreate(
              accessToken: UserRepositoryApp.instance.token!,
              brand: brand,
              vehicleNo: vehicleNo,
              category: category,
              fuel: fuel,
              manufacturerYear: manufacturerYear,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          Vehicle vehicle,
          String brand,
          String category,
          String fuel,
          int manufacturerYear,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              fuel: fuel,
              vehicle: vehicle,
              brand: brand,
              category: category,
              manufacturerYear: manufacturerYear,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (Vehicle vehicle) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleDelete(
              accessToken: UserRepositoryApp.instance.token!,
              vehicle: vehicle,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        active: (Vehicle vehicle) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleActive(
              accessToken: UserRepositoryApp.instance.token!,
              vehicle: vehicle,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        deActive: (Vehicle vehicle) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vehicleDeActive(
              accessToken: UserRepositoryApp.instance.token!,
              vehicle: vehicle,
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
