import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_authentication/src/app/util/on_login_success.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_bloc.freezed.dart';

@freezed
class VerifyCodeState with _$VerifyCodeState {
  const factory VerifyCodeState.initial() = _Initial;
  const factory VerifyCodeState.loading() = _Loading;
  const factory VerifyCodeState.success(
    String accessToken,
    List<String> permission,
    Map<String, dynamic> data,
  ) = _Success;
  const factory VerifyCodeState.error(String error) = _Error;
}

@freezed
class VerifyCodeEvent with _$VerifyCodeEvent {
  const factory VerifyCodeEvent.submit(
    String authId,
    String code,
    OnLoginSuccess onSuccess,
  ) = _Submit;
}

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  VerifyCodeBloc() : super(const _Initial()) {
    on<VerifyCodeEvent>((event, emit) async {
      await event.when(
        submit: (authId, code, onSuccess) async {
          emit(const _Loading());
          try {
            final accessToken =
                await AuthenticationRepositoryApi.instance.verifyCode(
              authId: authId,
              code: code,
            );

            final user = extractPayloadFromJwt(accessToken);
            final data = await onSuccess(accessToken, user);

            final roles =
                await AuthenticationRepositoryApi.instance.employeeRoleFetch(
              accessToken: accessToken,
              employeeId: user['id'].toString(),
            );

            final permissions = <String>[];
            for (final role in roles) {
              final rolePermissions = await AuthenticationRepositoryApi.instance
                  .rolePermissionFetch(
                accessToken: accessToken,
                role: role,
              );
              for (final rolePermission in rolePermissions) {
                if (!permissions.contains(rolePermission)) {
                  permissions.add(rolePermission);
                }
              }
            }

            emit(_Success(accessToken, permissions, data));
          } on ApiException catch (error) {
            emit(_Error(error.message));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
