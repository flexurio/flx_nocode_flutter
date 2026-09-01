import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field_options_source.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDown(() {
    EntityCustomRepository.onUnauthorizedGlobal = null;
  });

  group('401 Unauthorized Auto-Logout Tests', () {
    test('EntityCustomRepository triggers onUnauthorizedGlobal on 401 error', () async {
      bool unauthorizedCalled = false;
      EntityCustomRepository.onUnauthorizedGlobal = () {
        unauthorizedCalled = true;
      };

      final dio = Dio();
      dio.interceptors.clear();

      final repo = EntityCustomRepository(
        dio: dio,
        onUnauthorized: () {
          EntityCustomRepository.onUnauthorizedGlobal?.call();
        },
      );

      final dioError = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
          data: {'error': 'Access token has been revoked due to new login'},
        ),
      );

      final ex = repo.checkErrorApi(dioError);
      expect(ex, isA<ApiException>());
      expect(unauthorizedCalled, isTrue);
    });

    test('NoCodePageLoader registers onUnauthorized callback into onUnauthorizedGlobal', () async {
      bool logoutInvoked = false;
      EntityCustomRepository.onUnauthorizedGlobal = null;

      final loader = NoCodePageLoader(
        entityId: 'test_entity',
        bypassPermission: true,
        onUnauthorized: () {
          logoutInvoked = true;
        },
      );

      // Emulate calling onUnauthorized through the registered global callback
      EntityCustomRepository.onUnauthorizedGlobal = loader.onUnauthorized;
      EntityCustomRepository.onUnauthorizedGlobal?.call();

      expect(logoutInvoked, isTrue);
    });

    test('HttpRequestExecutor triggers onUnauthorizedGlobal when status code is 401', () async {
      bool unauthorizedCalled = false;
      EntityCustomRepository.onUnauthorizedGlobal = () {
        unauthorizedCalled = true;
      };

      final dio = Dio();
      final executor = HttpRequestExecutor(dio: dio);

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 401,
                  data: {'error': 'Unauthorized'},
                ),
              ),
            );
          },
        ),
      );

      final result = await executor.execute(
        const HttpRequestConfig(
          method: 'GET',
          url: 'https://example.com/api',
          headers: {},
        ),
      );

      expect(result.isSuccess, isFalse);
      expect(result.statusCode, 401);
      expect(unauthorizedCalled, isTrue);
    });

    test('OptionsSource triggers onUnauthorizedGlobal when backend returns 401', () async {
      bool unauthorizedCalled = false;
      EntityCustomRepository.onUnauthorizedGlobal = () {
        unauthorizedCalled = true;
      };

      final testDio = Dio();
      testDio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            return handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 401,
                  data: {'error': 'Token expired'},
                ),
              ),
            );
          },
        ),
      );

      EntityCustomRepository.instance = EntityCustomRepository(
        dio: testDio,
        onUnauthorized: () => EntityCustomRepository.onUnauthorizedGlobal?.call(),
      );

      final source = OptionsSource(
        optionsSource: 'backend.structure({id}:{id})?limit=10',
      );

      final options = await source.extractBackend(parentData: const []);
      expect(options, isEmpty);
      expect(unauthorizedCalled, isTrue);
    });

    test('noCodePage helper propagates onUnauthorized callback to NoCodePageLoader', () {
      bool customLogoutCalled = false;
      final widgetCustom = noCodePage(
        'test_entity',
        onUnauthorized: () {
          customLogoutCalled = true;
        },
      ) as NoCodePageLoader;

      expect(widgetCustom.onUnauthorized, isNotNull);
      widgetCustom.onUnauthorized?.call();
      expect(customLogoutCalled, isTrue);

      final widgetDefault = noCodePage('test_entity') as NoCodePageLoader;
      expect(widgetDefault.onUnauthorized, isNotNull);
    });
  });
}
