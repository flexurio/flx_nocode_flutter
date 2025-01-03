import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel_bloc.freezed.dart';

@freezed
class FuelState with _$FuelState {
  const factory FuelState.initial() = _Initial;
  const factory FuelState.loading() = _Loading;
  const factory FuelState.success() = _Success;
  const factory FuelState.error(String error) = _Error;
}

@freezed
class FuelEvent with _$FuelEvent {
  const factory FuelEvent.create({
    required String name,
    required double price,
    required DateTime startDate,
    required String typeFuel,
    required String brand,
  }) = _Create;
  const factory FuelEvent.update({
    required Fuel fuel,
    required double price,
    required DateTime startDate,
  }) = _Update;
  const factory FuelEvent.delete(Fuel fuel) = _Delete;
}

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  FuelBloc() : super(const _Initial()) {
    on<FuelEvent>((event, emit) async {
      await event.when(
        create: (
          String name,
          double price,
          DateTime startDate,
          String typeFuel,
          String brand,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.fuelCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              price: price,
              startDate: startDate,
              typeFuel: typeFuel,
              brand: brand,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          Fuel fuel,
          double price,
          DateTime startDate,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.fuelUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              fuel: fuel,
              price: price,
              startDate: startDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (Fuel fuel) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.fuelDelete(
              accessToken: UserRepositoryApp.instance.token!,
              fuel: fuel,
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
