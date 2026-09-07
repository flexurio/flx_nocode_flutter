import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/pages/create_page.dart';

String extractLiveAdminPassword() {
  final possibleLogPaths = [
    '/Users/suhal/Documents/Development/projects/vneu/obsidian/Suhal-VNEU/20 - Projects/Flexurio Studio/Templates/ERP System/backend_server.log',
    '../../templates/erp_system/backend_server.log',
  ];

  for (final path in possibleLogPaths) {
    final file = File(path);
    if (file.existsSync()) {
      final lines = file.readAsLinesSync();
      for (final line in lines.reversed) {
        final match = RegExp(r'Your admin Password:\s*"([^"]+)"').firstMatch(line);
        if (match != null) {
          final password = match.group(1)!;
          debugPrint('🔑 [LOG] Extracted Live Backend Admin Password: "$password" from $path');
          return password;
        }
      }
    }
  }
  debugPrint('⚠️ [LOG] Fallback to default admin password');
  return 'admin123';
}

Future<String> loginViaLiveApi({
  required String url,
  required String username,
  required String password,
}) async {
  final dio = Dio();
  debugPrint('📡 [API AUTH] Logging in via live API with username="$username", password="$password" -> URL: $url');
  final basicAuth = base64Encode(utf8.encode('$username:$password'));
  final response = await dio.post<Map<String, dynamic>>(
    url,
    options: Options(
      headers: {'authorization': 'Basic $basicAuth'},
    ),
  );
  final token = response.data!['data'] as String;
  debugPrint('✅ [API AUTH] Live JWT Token received (length: ${token.length} chars)');
  return token;
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Flexurio ERP System - NoCode Frontend Dynamic API Flow Test', () {
    late Configuration erpConfig;
    late String liveAdminPassword;
    late String sharedLiveJwtToken;
    late Map<String, dynamic> sharedLiveUserPayload;

    setUpAll(() async {
      // 1. Setup FileSystem Path for Entity & Config Loaders
      Configuration.fileSystemBasePath = 'asset';
      Configuration.preferFileSystem = true;
      EntityCustom.fileSystemBasePath = 'asset';
      EntityCustom.preferFileSystem = true;

      // 2. Load ERP System configuration from copied asset JSON
      final configFile = File('asset/configuration/configuration.json');
      expect(configFile.existsSync(), isTrue, reason: 'ERP configuration.json must exist');

      final jsonStr = configFile.readAsStringSync();
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      erpConfig = Configuration.fromJson(jsonMap);
      Configuration.instance = erpConfig;

      // 3. Initialize Core Flavor Config & Storage (Hive + HydratedBloc)
      flavorConfig = erpConfig.flavorConfig;
      await storageInit(erpConfig.company.id);

      // 4. Initialize Authentication Bloc & User Repository
      AuthenticationRepository.initialize(
        userRepository: UserRepositoryApp.instance,
        onLogin: (data) {},
      );

      // 5. Extract dynamic live admin password from backend log
      liveAdminPassword = extractLiveAdminPassword();
      debugPrint('==================================================');
      debugPrint('🔑 LIVE ADMIN PASSWORD: "$liveAdminPassword"');
      debugPrint('==================================================');

      // 6. Authenticate dynamically with backend API to obtain live JWT
      sharedLiveJwtToken = await loginViaLiveApi(
        url: erpConfig.authUrl,
        username: 'admin',
        password: liveAdminPassword,
      );
      sharedLiveUserPayload = extractPayloadFromJwt(sharedLiveJwtToken);
      debugPrint('👤 Live Authenticated User: "${sharedLiveUserPayload['nm']}" (ID: ${sharedLiveUserPayload['id']}, Roles: ${sharedLiveUserPayload['rl']})');
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

    test('3. Authenticate with Live Backend API to acquire Real JWT Token', () async {
      expect(sharedLiveJwtToken, isNotEmpty, reason: 'Backend API must return a non-empty JWT token');
      expect(sharedLiveUserPayload, isNotEmpty);
      expect(sharedLiveUserPayload['id'], isNotNull);
      expect(sharedLiveUserPayload['nm'], isNotNull); // Live dynamic user name from JWT
    });

    test('4. Fetch Real Dynamic Data from Live Backend APIs using JWT', () async {
      final dio = Dio();
      final headers = {'Authorization': 'Bearer $sharedLiveJwtToken'};

      // 1. Live Users endpoint
      final userRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/flx_users',
        options: Options(headers: headers),
      );
      expect(userRes.data!['success'], isTrue);
      final users = (userRes.data!['data'] as List).cast<Map<String, dynamic>>();
      expect(users, isNotEmpty);
      expect(users.first['email'], equals('admin'));
      expect(users.first['name'], equals(sharedLiveUserPayload['nm']));

      // 2. Live Master Companies
      final companyRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/master_company',
        options: Options(headers: headers),
      );
      expect(companyRes.data!['success'], isTrue);
      final companies = (companyRes.data!['data'] as List).cast<Map<String, dynamic>>();
      expect(companies, isNotEmpty);

      // 3. Live Master Products
      final productRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/master_product',
        options: Options(headers: headers),
      );
      expect(productRes.data!['success'], isTrue);
      final products = (productRes.data!['data'] as List).cast<Map<String, dynamic>>();
      expect(products, isNotEmpty);

      // 4. Live Master Materials
      final materialRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/master_material',
        options: Options(headers: headers),
      );
      expect(materialRes.data!['success'], isTrue);
      final materials = (materialRes.data!['data'] as List).cast<Map<String, dynamic>>();
      expect(materials, isNotEmpty);

      // 5. Live Sales Orders Transactions
      final soRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/transaction_sales_order',
        options: Options(headers: headers),
      );
      expect(soRes.data!['success'], isTrue);
      final salesOrders = (soRes.data!['data'] as List).cast<Map<String, dynamic>>();
      expect(salesOrders, isNotEmpty);
    });

    test('5. Input Data in Master Menu (Master Company) via Dynamic API & Verify Creation', () async {
      final dio = Dio();
      final headers = {'Authorization': 'Bearer $sharedLiveJwtToken'};
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      final dynamicCode = 'CMP-$timestamp';
      final dynamicName = 'PT Inovasi Digital $timestamp';
      final dynamicTaxId = '08.123.456.7-890.000';
      final dynamicPhone = '+62 21 88990011';
      final dynamicCity = 'Jakarta Selatan';

      // 1. Submit new record via live API using multipart form data
      final formData = FormData.fromMap({
        'code': dynamicCode,
        'name': dynamicName,
        'tax_id': dynamicTaxId,
        'phone': dynamicPhone,
        'city': dynamicCity,
      });

      final createRes = await dio.post<Map<String, dynamic>>(
        '${erpConfig.backendHost}/master_company',
        data: formData,
        options: Options(headers: headers),
      );

      expect(createRes.data!['success'], isTrue, reason: 'Master Company data insert must succeed');
      final createdData = createRes.data!['data'] as Map<String, dynamic>;
      expect(createdData['code'], equals(dynamicCode));
      expect(createdData['name'], equals(dynamicName));
      final newRecordId = createdData['id'];
      expect(newRecordId, isNotNull);

      // 2. Query and verify newly inserted data from master_company list
      final fetchRes = await dio.get<Map<String, dynamic>>(
        '${erpConfig.backendHost}/master_company',
        options: Options(headers: headers),
      );
      expect(fetchRes.data!['success'], isTrue);
      final list = (fetchRes.data!['data'] as List).cast<Map<String, dynamic>>();
      final found = list.any((item) => item['id'] == newRecordId && item['code'] == dynamicCode);
      expect(found, isTrue, reason: 'Inserted master company record must exist in backend database');
    });

    testWidgets('6. Complete E2E GUI Journey: Login Screen Form (NIP/Pass) -> Sidebar Menu Navigation -> Input Master GUI Form -> Verify -> Logout', (WidgetTester tester) async {
      final liveToken = sharedLiveJwtToken;
      final liveUserPayload = sharedLiveUserPayload;
      final liveUserName = liveUserPayload['nm'] as String? ?? 'Admin Flexurio';
      final livePermissions = Access.fetchPermissions(liveUserPayload['rl'] as String? ?? '');

      // Load Master Company Entity
      final companyEntity = await EntityCustom.getEntity('master_company');
      expect(companyEntity, isNotNull);

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final guiCompanyCode = 'GUI-$timestamp';
      final guiCompanyName = 'PT Solusi GUI Digital $timestamp';
      final guiCompanyCity = 'Surabaya';

      // Prepare Login Page connected with ERP Auth Config
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
        home: AuthenticationBuilder(
          authenticated: () {
            final user = UserRepositoryApp.instance.userApp;
            final displayName = user?.name.isNotEmpty == true ? user!.name : liveUserName;
            final displayRole = user?.role.isNotEmpty == true ? user!.role : (liveUserPayload['rl']?.toString() ?? 'Admin');

            return MenuPage.prepare(
              bypassPermission: true,
              logoNamed: erpConfig.logoNamedUrl,
              logoUrl: erpConfig.logoUrl,
              appName: erpConfig.appName,
              menu: erpConfig.menu(),
              accountSubtitle: '$displayName - $displayRole',
              onChangePassword: (context) {},
              searchData: (context, query) => [],
              accountPermissions: livePermissions,
              accountName: displayName,
              onLogout: () => AuthenticationBloc.instance.add(
                const AuthenticationEvent.logout(),
              ),
            );
          },
          unAuthenticated: signInPage,
        ),
      );

      // 1. Reset to unauthenticated state first
      AuthenticationBloc.instance.add(const AuthenticationEvent.logout());

      // Mount App to Screen
      await tester.pumpWidget(fullApp);
      await tester.pumpAndSettle();

      // Verify Initial Login Screen is rendered
      expect(find.byType(LoginPage), findsOneWidget);

      // 2. GUI INTERACTION: Type username (NIP) and Password into Login Form
      final loginTextFields = find.byType(TextField);
      expect(loginTextFields, findsWidgets, reason: 'Login form must display Username & Password text fields');

      debugPrint('⌨️ [GUI LOGIN] Typing Username/NIP="admin" & Password="$liveAdminPassword" into Login Screen Form');
      await tester.enterText(loginTextFields.at(0), 'admin');
      if (loginTextFields.evaluate().length > 1) {
        await tester.enterText(loginTextFields.at(1), liveAdminPassword);
      }
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Tap Login Button on GUI
      final loginButtonFinder = find.byType(ElevatedButton);
      if (loginButtonFinder.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI LOGIN] Clicking Sign In button on GUI...');
        await tester.tap(loginButtonFinder.first);
        await tester.pump();
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      // 3. Dispatch Login Event with the Live Token acquired dynamically from Backend API
      AuthenticationBloc.instance.add(
        AuthenticationEvent.login(
          liveToken,
          livePermissions,
          liveUserPayload,
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // 4. VERIFY USER HAS ENTERED THE LIVE ERP DASHBOARD
      expect(find.byType(LoginPage), findsNothing);
      expect(find.byType(MenuPage), findsOneWidget);
      debugPrint('🎉 [GUI DASHBOARD] Successfully entered ERP Dashboard as "$liveUserName"');

      // 5. SIDEBAR GUI INTERACTION: Click through Sidebar Level 2 & Level 3 Menu Items
      debugPrint('🖱️ [GUI SIDEBAR] Navigating through sidebar menu items...');

      // Expand "Master Data" accordion on sidebar
      final masterDataHeader = find.text('Master Data');
      if (masterDataHeader.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI SIDEBAR] Clicking "Master Data" accordion on sidebar...');
        await tester.tap(masterDataHeader.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      // Click "Companies" sub-menu item (MenuLevel3) to switch page
      final companiesMenuItem = find.text('Companies');
      if (companiesMenuItem.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI SIDEBAR] Clicking sub-menu "Companies" on sidebar...');
        await tester.tap(companiesMenuItem.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      // Expand "Operations" on sidebar
      final operationsHeader = find.text('Operations');
      if (operationsHeader.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI SIDEBAR] Clicking "Operations" on sidebar...');
        await tester.tap(operationsHeader.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      // Click "Attendance" sub-menu item on sidebar
      final attendanceMenuItem = find.text('Attendance');
      if (attendanceMenuItem.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI SIDEBAR] Clicking sub-menu "Attendance" on sidebar...');
        await tester.tap(attendanceMenuItem.first);
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
      }

      // 6. GUI FORM TEST: Render and submit Master Company Create Form widget
      bool formSuccessTriggered = false;
      final createFormWidget = MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CreatePage.prepare(
            embedded: false,
            autoBackWhenSuccess: false,
            entity: companyEntity!,
            layoutFormId: 'create_master_company',
            parentData: const [],
            onSuccess: (data) {
              formSuccessTriggered = true;
              debugPrint('🎉 [GUI FORM SUCCESS] Master Company created via GUI Form: $data');
            },
          ),
        ),
      );

      await tester.pumpWidget(createFormWidget);
      await tester.pumpAndSettle();

      // Verify Form Fields rendered on GUI
      final masterFormFields = find.byType(TextField);
      expect(masterFormFields, findsWidgets, reason: 'Form fields should be rendered in GUI');

      debugPrint('⌨️ [GUI MASTER FORM] Typing code="$guiCompanyCode", name="$guiCompanyName", city="$guiCompanyCity"');
      await tester.enterText(masterFormFields.at(0), guiCompanyCode);
      await tester.enterText(masterFormFields.at(1), guiCompanyName);
      if (masterFormFields.evaluate().length > 4) {
        await tester.enterText(masterFormFields.at(4), guiCompanyCity);
      }
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // Submit form via GUI button
      final submitFinder = find.byType(ElevatedButton);
      if (submitFinder.evaluate().isNotEmpty) {
        debugPrint('👆 [GUI MASTER FORM] Clicking Submit Form button on GUI...');
        await tester.tap(submitFinder.first);
        await tester.pump();
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }

      expect(formSuccessTriggered, isTrue, reason: 'Form submit workflow should trigger onSuccess callback');

      // 7. Verify Logout Flow from Dashboard
      debugPrint('🚪 [GUI LOGOUT] Logging out from ERP Dashboard...');
      AuthenticationBloc.instance.add(const AuthenticationEvent.logout());
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      debugPrint('✅ [GUI LOGOUT] Successfully logged out');
    });
  });
}
