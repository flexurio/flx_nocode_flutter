import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_permission_bloc.freezed.dart';

@freezed
class RolePermissionState with _$RolePermissionState {
  const factory RolePermissionState.initial() = _Initial;
  const factory RolePermissionState.loading() = _Loading;
  const factory RolePermissionState.success() = _Success;
  const factory RolePermissionState.error(String error) = _Error;
}

@freezed
class RolePermissionEvent with _$RolePermissionEvent {
  const factory RolePermissionEvent.create({
    required Role role,
    required String permission,
  }) = _Create;

  const factory RolePermissionEvent.delete({
    required Role role,
    required String permission,
  }) = _Delete;
}

class RolePermissionBloc
    extends Bloc<RolePermissionEvent, RolePermissionState> {
  RolePermissionBloc({required this.accessToken}) : super(const _Initial()) {
    on<RolePermissionEvent>((event, emit) async {
      await event.when(
        create: (role, permission) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.rolePermissionCreate(
              accessToken: accessToken,
              role: role,
              permission: permission,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (role, permission) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.rolePermissionDelete(
              accessToken: accessToken,
              role: role,
              permission: permission,
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
}
