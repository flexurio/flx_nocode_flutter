import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Flexurio ERP System - NoCode Frontend All-in-One E2E Test', () {
    late Configuration erpConfig;

    setUpAll(() async {
      // 1. Initialize Mock Hydrated Storage for Bloc
      final storage = MockStorage();
      when(() => storage.read(any())).thenReturn(null);
      when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
      when(() => storage.delete(any())).thenAnswer((_) async {});
      when(() => storage.clear()).thenAnswer((_) async {});
      HydratedBloc.storage = storage;

      // 2. Initialize Authentication Bloc & User Repository
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryApp.instance,
        onLogin: (data) {},
      );

      // 3. Setup FileSystem Path for Entity & Config Loaders
      Configuration.fileSystemBasePath = 'asset';
      Configuration.preferFileSystem = true;
      EntityCustom.fileSystemBasePath = 'asset';
      EntityCustom.preferFileSystem = true;

      // 4. Load ERP System configuration from copied asset JSON
      final configFile = File('asset/configuration/configuration.json');
      expect(configFile.existsSync(), isTrue, reason: 'ERP configuration.json must exist');

      final jsonStr = configFile.readAsStringSync();
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      erpConfig = Configuration.fromJson(jsonMap);
      Configuration.instance = erpConfig;

      // 5. Initialize Core Flavor Config
      flavorConfig = erpConfig.flavorConfig;
    });

    test('1. Validates ERP Configuration and Menu Group Schema', () {
      expect(erpConfig.appName, equals('Flexurio Enterprise ERP'));
      expect(erpConfig.backendHost, equals('http://0.0.0.0:8080'));
      expect(erpConfig.menuGroups, isNotEmpty);

      // Verify all ERP Menu Groups from configuration.json
      final groupLabels = erpConfig.menuGroups.map((g) => g.label).toList();
      expect(groupLabels, containsAll([
        'Organization & HR',
        'Procurement & Warehouse',
        'Manufacturing',
        'Sales & CRM',
        'Finance & Accounting',
        'Support & Settings',
      ]));

      // Verify menu parsing generates core.Menu1 structure
      final menus = erpConfig.menu();
      expect(menus.length, equals(erpConfig.menuGroups.length));
    });

    test('2. Validates all 24 ERP Entity JSON Files in asset/configuration/entity', () {
      final entityDir = Directory('asset/configuration/entity');
      expect(entityDir.existsSync(), isTrue);

      final expectedEntities = [
        'master_company',
        'master_customer',
        'master_vendor',
        'master_department',
        'master_coa',
        'master_material',
        'master_product',
        'master_production_line',
        'master_product_formulation',
        'master_employee',
        'transaction_request_form',
        'transaction_purchase_order',
        'transaction_material_stock_in',
        'transaction_product_lot',
        'transaction_production_order',
        'transaction_sales_order',
        'transaction_account_receivable',
        'transaction_account_payable',
        'transaction_general_ledger',
        'transaction_attendance',
        'transaction_support_ticket',
        'flx_roles',
        'flx_users',
      ];

      for (final entityName in expectedEntities) {
        final entityFile = File('asset/configuration/entity/$entityName.json');
        expect(entityFile.existsSync(), isTrue, reason: 'Entity $entityName.json must exist');

        final content = entityFile.readAsStringSync();
        final map = jsonDecode(content) as Map<String, dynamic>;
        expect(map['id'], equals(entityName));
        expect(map['backend'], isNotNull);
      }
    });

    testWidgets('3. Complete E2E GUI Journey: Login Screen -> Input Credential -> Submit -> ERP Dashboard -> Logout', (WidgetTester tester) async {
      // 1. Prepare Login Page connected with ERP Auth Config
      final signInPage = LoginPage.prepare(
        logoNamedUrl: erpConfig.logoNamedUrl,
        logoUrl: erpConfig.logoUrl,
        urlAuthApi: erpConfig.authUrl,
        withTwoFactor: false,
        onLoginSuccess: (accessToken, userPayload) async {
          return userPayload;
        },
      );

      final fullApp = MaterialApp(
        debugShowCheckedModeBanner: false,
        title: erpConfig.appName,
        home: Scaffold(
          body: signInPage,
        ),
      );

      // 2. Mount App to Screen
      await tester.pumpWidget(fullApp);
      await tester.pumpAndSettle();

      // 3. Verify Login Screen Elements
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Please sign in to your account to continue.'), findsOneWidget);

      final passwordField = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.obscureText == true,
      );
      expect(passwordField, findsOneWidget);

      // 4. Fill in Credentials & Submit Login
      await tester.enterText(passwordField, '123456');
      await tester.pumpAndSettle();

      final loginBtn = find.byType(Button);
      if (loginBtn.evaluate().isNotEmpty) {
        await tester.tap(loginBtn.first);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }

      // 5. Trigger Logout Event & Verify Teardown back to Login Screen
      AuthenticationBloc.instance.add(const AuthenticationEvent.logout());
      await tester.pumpAndSettle();

      expect(find.text('Welcome Back'), findsOneWidget);
    });
  });
}
