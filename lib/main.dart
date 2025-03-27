import 'package:flexurio_no_code/src/app/model/configuration.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/resource/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Configuration.load();
  final configuration = Configuration.instance;

  final home = AuthenticationBuilder(
    authenticated: () {
      final user = UserRepositoryApp.instance.userApp;
      final name = user?.name;
      return MenuPage.prepare(
        logoNamed: configuration.logoNamedUrl,
        logoUrl: configuration.logoUrl,
        appName: configuration.appName,
        menu: configuration.menu,
        accountSubtitle: '${user?.id}',
        onChangePassword: (context) {},
        searchData: (context, query) => [],
        accountPermissions: UserRepositoryApp.instance.permissions,
        accountName: name ?? '-',
        onLogout: () =>
            AuthenticationBloc.instance.add(const AuthenticationEvent.logout()),
      );
    },
    unAuthenticated: LoginPage.prepare(
      logoNamedUrl: configuration.logoNamedUrl,
      logoUrl: configuration.logoUrl,
      withTwoFactor: false,
      onLoginSuccess: (accessToken, userPayload) async {
        return userPayload;
      },
    ),
  );

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => home,
      ),
    ],
  );
  final app = App(routerConfig: router);
  await run(
    config: configuration.flavorConfig,
    app: app,
    initialized: () {
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryApp.instance,
        onLogin: (data) {},
      );
    },
  );
}
