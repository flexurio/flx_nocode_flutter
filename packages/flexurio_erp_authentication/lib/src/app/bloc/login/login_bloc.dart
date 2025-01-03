import 'package:flexurio_erp_authentication/src/app/resource/authentication_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(String authId) = _Success;
  const factory LoginState.error({
    String? nip,
    String? password,
    String? other,
  }) = _Error;
}

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.submit(String nip, String password) = _Submit;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        submit: (nip, password) async {
          emit(const _Loading());
          try {
            final authId = await AuthenticationRepositoryApi.instance.login(
              nip: nip,
              password: password,
            );
            emit(_Success(authId));
          } on ApiException catch (error) {
            emit(_Error(nip: error.message));
          } catch (error) {
            emit(const _Error(other: errorSomethingWentWrong));
          }
        },
      );
    });
  }
}
