import 'package:flexurio_erp_authentication/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'authentication_bloc.freezed.dart';

typedef AuthenticationRepository = AuthenticationBloc;

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.authenticated(
    String accessToken,
    List<String> permission,
    Map<String, dynamic> data,
  ) = _Authenticated;
}

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.login(
    String accessToken,
    List<String> permission,
    Map<String, dynamic> data,
  ) = _Login;
  const factory AuthenticationEvent.logout() = _Logout;
}

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc._({
    required this.userRepository,
    required this.onLogin,
  }) : super(const _Unauthenticated()) {
    on<AuthenticationEvent>((event, emit) async {
      event.when(
        login: (accessToken, permission, data) {
          userRepository.setUserFromJwt(accessToken, permission);
          onLogin(data);
          emit(_Authenticated(accessToken, permission, data));
        },
        logout: () {
          userRepository.unset();
          emit(const _Unauthenticated());
        },
      );
    });
  }
  final UserRepository userRepository;
  final void Function(Map<String, dynamic> data) onLogin;

  static void initialize({
    required UserRepository userRepository,
    required void Function(Map<String, dynamic> data) onLogin,
  }) {
    AuthenticationBloc.instance = AuthenticationBloc._(
      onLogin: onLogin,
      userRepository: userRepository,
    );
  }

  static void logout() {
    AuthenticationBloc.instance.add(const AuthenticationEvent.logout());
  }

  static late AuthenticationBloc instance;

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    try {
      final accessToken = json['accessToken'] as String;
      final data = json['data'] as Map<String, dynamic>;
      final permission = json['permission'] as List<String>;
      userRepository.setUserFromJwt(accessToken, permission);
      onLogin(data);
      return _Authenticated(accessToken, permission, data);
    } catch (e) {
      return const _Unauthenticated();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return state.maybeWhen(
      authenticated: (accessToken, permission, data) {
        return {
          'accessToken': accessToken,
          'permission': Permission.toListString(permission),
          'data': data,
        };
      },
      orElse: () => {},
    );
  }
}
