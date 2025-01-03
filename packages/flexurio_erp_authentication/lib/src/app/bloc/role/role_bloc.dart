import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_bloc.freezed.dart';

@freezed
class RoleState with _$RoleState {
  const factory RoleState.initial() = _Initial;
  const factory RoleState.loading() = _Loading;
  const factory RoleState.success() = _Success;
  const factory RoleState.error(String error) = _Error;
}

@freezed
class RoleEvent with _$RoleEvent {
  const factory RoleEvent.create({
    required String description,
    required String name,
  }) = _Create;
  const factory RoleEvent.edit({
    required String name,
    required String description,
    required Role role,
  }) = _Edit;
  const factory RoleEvent.delete({required Role role}) = _Delete;
}

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc({required this.accessToken}) : super(const _Initial()) {
    on<RoleEvent>((event, emit) async {
      await event.when(
        create: (description, name) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.roleCreate(
              accessToken: accessToken,
              name: name,
              description: description,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (name, description, role) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.roleUpdate(
              accessToken: accessToken,
              role: role,
              description: description,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (role) async {
          emit(const _Loading());
          try {
            await AuthenticationRepositoryApi.instance.roleDelete(
              accessToken: accessToken,
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
}
