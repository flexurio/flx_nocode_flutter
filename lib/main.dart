import 'package:appointment/src/app/model/configuration.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final configuration = await Configuration.load();
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MenuPage.prepare(
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
