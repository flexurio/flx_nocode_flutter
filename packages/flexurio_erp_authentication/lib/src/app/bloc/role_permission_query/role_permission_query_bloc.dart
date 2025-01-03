import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_permission_query_bloc.freezed.dart';

@freezed
class RolePermissionQueryState with _$RolePermissionQueryState {
  const factory RolePermissionQueryState.initial() = _Initial;
  const factory RolePermissionQueryState.loading() = _Loading;
  const factory RolePermissionQueryState.loaded(
    List<String> permission,
  ) = _Success;
  const factory RolePermissionQueryState.error(String error) = _Error;
}

@freezed
class RolePermissionQueryEvent with _$RolePermissionQueryEvent {
  const factory RolePermissionQueryEvent.fetch({
    required Role role,
  }) = _Fetch;
  const factory RolePermissionQueryEvent.toggle({
    required String permission,
  }) = _Toggle;
}

class RolePermissionQueryBloc
    extends Bloc<RolePermissionQueryEvent, RolePermissionQueryState> {
  RolePermissionQueryBloc({required this.accessToken})
      : super(const _Initial()) {
    on<RolePermissionQueryEvent>((event, emit) async {
      await event.when(
        fetch: (role) async {
          emit(const _Loading());
          try {
            _permission =
                await AuthenticationRepositoryApi.instance.rolePermissionFetch(
              accessToken: accessToken,
              role: role,
            );
            emit(_Success(List.from(_permission)));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        toggle: (permission) {
          if (_permission.contains(permission)) {
            _permission.remove(permission);
          } else {
            _permission.add(permission);
          }
          emit(_Success(List.from(_permission)));
        },
      );
    });
  }
  final String accessToken;
  var _permission = <String>[];
}
