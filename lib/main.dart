import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Configuration.load();
  final configuration = Configuration.instance;
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MenuPage.prepare(
          logoNamed: configuration.logoNamedUrl,
          logoUrl: configuration.logoUrl,
          appName: configuration.appName,
          menu: configuration.menu,
          accountPermissions: [],
          accountName: 'John Doe',
          accountSubtitle: 'Administrator',
          onLogout: () {},
          onChangePassword: (context) {},
          searchData: (context, query) => [],
        ),
      ),
    ],
  );
  final app = App(routerConfig: router);
  await run(
    config: configuration.flavorConfig,
    app: app,
    initialized: () {},
  );
}
