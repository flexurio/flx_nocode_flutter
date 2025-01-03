import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_employee_bloc.freezed.dart';

@freezed
class RoleEmployeeState with _$RoleEmployeeState {
  const factory RoleEmployeeState.initial() = _Initial;
  const factory RoleEmployeeState.loading() = _Loading;
  const factory RoleEmployeeState.success() = _Success;
  const factory RoleEmployeeState.error(String error) = _Error;
}

@freezed
class RoleEmployeeEvent with _$RoleEmployeeEvent {
  const factory RoleEmployeeEvent.create(
    String userId,
  ) = _Create;
  const factory RoleEmployeeEvent.delete(
    String userId,
  ) = _Update;
}

class RoleEmployeeBloc extends Bloc<RoleEmployeeEvent, RoleEmployeeState> {
  RoleEmployeeBloc({required this.role, required this.accessToken})
      : super(const _Initial()) {
    on<RoleEmployeeEvent>((event, emit) async {
      await event.when(
        create: (userId) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.roleEmployeeCreate(
              accessToken: accessToken,
              userId: userId,
              role: role,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (userId) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.roleEmployeeDelete(
              accessToken: accessToken,
              userId: userId,
              role: role,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  final String accessToken;
  final Role role;
}
