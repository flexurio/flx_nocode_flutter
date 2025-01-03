import 'package:appointment/src/app/resource/company_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:appointment/src/app/view/widget/search_data/petty_cash.dart';
import 'package:appointment/src/app/view/widget/search_data/purchase_order.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

Future<void> runChiron(
    String appName, FlavorConfig config, List<Menu1> menu) async {
  final home = AuthenticationBuilder(
    authenticated: () {
      final user = UserRepositoryApp.instance.userApp;
      var department = UserRepositoryApp.instance.department?.name ?? '';
      if (UserRepositoryApp.instance.departments.length > 1) {
        department +=
            ' (+${UserRepositoryApp.instance.departments.length - 1})';
      }
      final nip = user?.nip;
      final name = user?.name;
      return MenuPage.prepare(
        appName: appName,
        menu: menu,
        accountPermissions: UserRepositoryApp.instance.permissions,
        accountName: name ?? '-',
        accountSubtitle: '$nip -  $department',
        onLogout: () =>
            AuthenticationBloc.instance.add(const AuthenticationEvent.logout()),
        onChangePassword: (context) {},
        searchData: (context, query) => [
          searchPettyCash(context, query),
          searchPurchaseOrder(context, query),
        ],
      );
    },
    unAuthenticated: LoginPage.prepare(
      onLoginSuccess: (accessToken, userPayload) async {
        final department = await CompanyRepository.instance.userDepartment(
          accessToken: accessToken,
          userId: userPayload['id'].toString(),
        );
        return UserRepositoryApp.dataAdapterFromInstance(department);
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
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage.prepare(
          onLoginSuccess: (accessToken, userPayload) async {
            final department = await CompanyRepository.instance.userDepartment(
              accessToken: accessToken,
              userId: userPayload['id'].toString(),
            );
            return UserRepositoryApp.dataAdapterFromInstance(department);
          },
        ),
      )
    ],
  );
  final app = App(routerConfig: router);
  await run(
    config: config,
    app: app,
    initialized: () {
      Hive.registerAdapter(EmployeeImplAdapter());
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryApp.instance,
        onLogin: (data) {
          EmployeeRepository.initialize();
          UserRepositoryApp.instance.dataAdapterSetup(data);
        },
      );
    },
  );
}
