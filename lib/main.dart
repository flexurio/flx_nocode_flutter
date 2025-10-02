import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/landing_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

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
          noHeader: true,
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
        initialState: () async {
          final p = configuration.preload;
          for (final preload in p) {
            try {
              final e = await EntityCustom.getEntity(preload);
              EntityCustomRepository.instance.fetch(
                accessToken: UserRepositoryApp.instance.token ?? '',
                pageOptions: PageOptions.emptyNoLimit(),
                method: e!.backend.readAll!.method,
                path: e.backend.readAll!.urlWithValues,
                filterMap: {},
                cachedDurationSeconds: e.backend.readAll!.cacheDurationSeconds,
              );
            } catch (e) {
              print('Error preload $preload $e');
            }
          }
        },
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
