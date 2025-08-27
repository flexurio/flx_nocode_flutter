import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/landing_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';

import 'src/app/view/page/entity_create/entity_create_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Configuration.load();
  final configuration = Configuration.instance;
  MenuBloc.instance = MenuBloc(
    logoNamedUrl: configuration.logoNamedUrl,
    logoUrl: configuration.logoUrl,
  );
  Widget Function({required VoidCallback onSuccess}) signUpPage =
      ({required VoidCallback onSuccess}) => Container();
  final entityRegistration = configuration.entityRegistration;
  if (entityRegistration != null) {
    final entity = await EntityCustom.getEntity(entityRegistration);
    if (entity != null) {
      signUpPage = ({required VoidCallback onSuccess}) {
        return EntityCreatePage.prepare(
          entity: entity,
          embedded: true,
          filters: {},
          onSuccess: onSuccess,
          autoBackWhenSuccess: false,
        );
      };
    }
  }

  final signInPage = LoginPage.prepare(
    logoNamedUrl: configuration.logoNamedUrl,
    logoUrl: configuration.logoUrl,
    // signUpPage: signUpPage,
    urlAuthApi: configuration.authUrl,
    withTwoFactor: false,
    onLoginSuccess: (accessToken, userPayload) async {
      return userPayload;
    },
  );
  final home = AuthenticationBuilder(
    authenticated: () {
      final user = UserRepositoryApp.instance.userApp!;
      final name = user.name;
      final permissions = UserRepositoryApp.instance.permissions;
      return MenuPage.prepare(
        logoNamed: configuration.logoNamedUrl,
        logoUrl: configuration.logoUrl,
        appName: configuration.appName,
        menu: configuration.menu(),
        accountSubtitle: '${user.id} - ${user.role}',
        onChangePassword: (context) {},
        searchData: (context, query) => [],
        accountPermissions: permissions,
        accountName: name,
        onLogout: () => AuthenticationBloc.instance.add(
          const AuthenticationEvent.logout(),
        ),
      );
    },
    unAuthenticated: signInPage,
  );

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MaterialApp(
          title: 'TechSolutions - Landing Page',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LandingPage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
      GoRoute(
        path: '/sign-in',
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
