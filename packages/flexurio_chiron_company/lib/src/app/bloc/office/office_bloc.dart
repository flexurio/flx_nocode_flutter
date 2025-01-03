import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'office_bloc.freezed.dart';

@freezed
class OfficeState with _$OfficeState {
  const factory OfficeState.initial() = _Initial;
  const factory OfficeState.loading() = _Loading;
  const factory OfficeState.success() = _Success;
  const factory OfficeState.error(String error) = _Error;
}

@freezed
class OfficeEvent with _$OfficeEvent {
  const factory OfficeEvent.create(
    String name,
    String description,
    String address,
    double latitude,
    double longitude,
    double radius,
  ) = _Create;
  const factory OfficeEvent.update(
    int id,
    String name,
    String description,
    String address,
    double latitude,
    double longitude,
    double radius,
  ) = _Update;
  const factory OfficeEvent.delete(int id) = _Delete;
}

class OfficeBloc extends Bloc<OfficeEvent, OfficeState> {
  OfficeBloc() : super(const _Initial()) {
    on<OfficeEvent>((event, emit) async {
      await event.when(
        create: (
          name,
          description,
          address,
          latitude,
          longitude,
          radius,
        ) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.officeCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              latitude: latitude,
              longitude: longitude,
              address: address,
              description: description,
              radius: radius,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          id,
          name,
          description,
          address,
          latitude,
          longitude,
          radius,
        ) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.officeUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              latitude: latitude,
              longitude: longitude,
              address: address,
              description: description,
              radius: radius,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await CompanyRepository.instance.officeDelete(
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
