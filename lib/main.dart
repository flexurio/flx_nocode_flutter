import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flx_nocode_flutter/features/configuration/screen/pages/configuration_error_page.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/page/landing/landing_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flx_nocode_flutter/shared/services/studio_network_log_interceptor.dart';

const _cliConfigurationFileSystemBasePath =
    String.fromEnvironment('CONFIGURATION_FS_BASE_PATH', defaultValue: '');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final runtimeConfigurationFsBasePath = kIsWeb
      ? ''
      : (Platform.environment['CONFIGURATION_FS_BASE_PATH'] ?? '').trim();
  final resolvedConfigurationFsBasePath =
      runtimeConfigurationFsBasePath.isNotEmpty
          ? runtimeConfigurationFsBasePath
          : _cliConfigurationFileSystemBasePath;

  if (resolvedConfigurationFsBasePath.isNotEmpty) {
    Configuration.fileSystemBasePath = resolvedConfigurationFsBasePath;
    Configuration.preferFileSystem = true;
    EntityCustom.fileSystemBasePath = resolvedConfigurationFsBasePath;
    EntityCustom.preferFileSystem = true;
    print(
        '[main] CONFIGURATION_FS_BASE_PATH set, using filesystem configuration at "$resolvedConfigurationFsBasePath"');
  }

  try {
    print('[main] loading configuration');
    await Configuration.load();
  } catch (e) {
    print('[main] error loading configuration: $e');
    runApp(
      MaterialApp(
        home: ConfigurationErrorPage(error: e),
      ),
    );
    return;
  }

  final configuration = Configuration.instance;
  MenuBloc.instance = MenuBloc(
    logoNamedUrl: configuration.logoNamedUrl,
    logoUrl: configuration.logoUrl,
  );
  final entityRegistration = configuration.entityRegistration;
  if (entityRegistration != null) {
    try {
      final entity = await EntityCustom.getEntity(entityRegistration);
      if (entity != null) {
        // Pre-loaded registration entity if any
      }
    } catch (e) {
      print(
          '[main] error loading entity registration "$entityRegistration": $e');
      runApp(
        MaterialApp(
          home: ConfigurationErrorPage(error: e),
        ),
      );
      return;
    }
  } else {
    print('[main] entityRegistration is null');
  }

  print('[main] configuration.authUrl: ${configuration.authUrl}');
  final signInPage = LoginPage.prepare(
    logoNamedUrl: configuration.logoNamedUrl,
    logoUrl: configuration.logoUrl,
    // signUpPage: signUpPage,
    urlAuthApi: configuration.authUrl,
    withTwoFactor: false,
    onLoginSuccess: (accessToken, userPayload) async {
      await CapabilitiesService.instance.syncFromBackend(
        config: configuration.accessControl,
        accessToken: accessToken,
      );
      return userPayload;
    },
  );
  final home = AuthenticationBuilder(
    authenticated: () => _AuthenticatedMenuShell(configuration: configuration),
    unAuthenticated: signInPage,
  );

  final router = GoRouter(
    initialLocation: configuration.showLandingPage ? '/' : '/sign-in',
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
      Api.dio.interceptors.add(StudioNetworkLogInterceptor());
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryAppNocode.instance,
        onLogin: (data) {},
      );
    },
  );
}

/// Ensures server-driven capabilities (`AccessControlConfig.capabilitiesEndpoint`)
/// are synchronized BEFORE constructing [MenuPage] on both fresh login and
/// cold-start session restore, eliminating fail-open race conditions.
class _AuthenticatedMenuShell extends StatefulWidget {
  const _AuthenticatedMenuShell({required this.configuration});

  final Configuration configuration;

  @override
  State<_AuthenticatedMenuShell> createState() =>
      _AuthenticatedMenuShellState();
}

class _AuthenticatedMenuShellState extends State<_AuthenticatedMenuShell> {
  late Future<void> _capabilitiesReady;

  @override
  void initState() {
    super.initState();
    _capabilitiesReady = _ensureCapabilitiesLoaded();
  }

  Future<void> _ensureCapabilitiesLoaded() async {
    final accessControl = widget.configuration.accessControl;
    if (accessControl.bypassAllPermissions) return;
    if (accessControl.capabilitiesEndpoint != null &&
        !UserRepositoryAppNocode.instance.hasCapabilitiesLoaded) {
      await CapabilitiesService.instance.syncFromBackend(
        config: accessControl,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _capabilitiesReady,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = UserRepositoryAppNocode.instance.userApp!;
        final name = user.name;
        final effectivePermissions =
            UserRepositoryAppNocode.instance.effectiveCapabilities;
        final bypassAll = widget.configuration.accessControl.bypassAllPermissions;

        return MenuPage.prepare(
          bypassPermission: bypassAll,
          initialState: () async {
            final p = widget.configuration.preload;
            for (final preload in p) {
              try {
                final e = await EntityCustom.getEntity(preload);
                EntityCustomRepository.instance.fetch(
                  accessToken: UserRepositoryAppNocode.instance.token ?? '',
                  pageOptions: PageOptions.emptyNoLimit(),
                  method: e!.backend.readAll!.method,
                  path: e.backend.readAll!.urlWithValues,
                  filterMap: {},
                  cachedDurationSeconds:
                      e.backend.readAll!.cacheDurationSeconds,
                );
              } catch (e) {
                debugPrint('Error preload $preload $e');
              }
            }
          },
          logoNamed: widget.configuration.logoNamedUrl,
          logoUrl: widget.configuration.logoUrl,
          appName: widget.configuration.appName,
          menu: widget.configuration.menu(bypassPermission: bypassAll),
          accountSubtitle: '${user.id} - ${user.role}',
          onChangePassword: (context) {},
          searchData: (context, query) => [],
          accountPermissions: effectivePermissions,
          accountName: name,
          onLogout: () => AuthenticationBloc.instance.add(
            const AuthenticationEvent.logout(),
          ),
        );
      },
    );
  }
}
