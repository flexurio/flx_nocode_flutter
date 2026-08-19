import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/utils/pdf_data_utils.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

void main() {
  setUpAll(() {
    registerFallbackValue(const HttpRequestConfig(
      method: 'GET',
      url: '',
      headers: {},
    ));
    Configuration.instance = Configuration.empty().copyWith(
      backendHost: 'http://localhost:8080',
    );
    UserRepositoryAppNocode.instance = UserRepositoryAppNocode();
    UserRepositoryAppNocode.instance.userApp = UserAppNocode(id: 1, name: 'Test', role: 'admin');
    UserRepositoryAppNocode.instance.token = 'test_token';
  });

  group('PdfDataUtils Tests', () {
    test('fetchAllHttpData should recursively fetch and merge data', () async {
      final mockExecutor = MockHttpRequestExecutor();
      final contextData = <String, dynamic>{};
      
      final json = {
        'section1': {
          'http_data': {
            'method': 'GET',
            'url': 'api/users',
          },
        },
        'section2': {
          'http_data': {
            'method': 'GET',
            'url': 'api/settings',
          },
        }
      };

      when(() => mockExecutor.execute(any())).thenAnswer((invocation) async {
        final config = invocation.positionalArguments[0] as HttpRequestConfig;
        if (config.url.contains('users')) {
          return HttpRequestResult.success(statusCode: 200, data: {'user_list': ['A', 'B']});
        }
        return HttpRequestResult.success(statusCode: 200, data: {'theme': 'dark'});
      });

      await PdfDataUtils.fetchAllHttpData(json, contextData, executor: mockExecutor);

      expect(contextData['user_list'], equals(['A', 'B']));
      expect(contextData['theme'], 'dark');
      verify(() => mockExecutor.execute(any())).called(2);
    });

    test('extractImageUrls should find all image urls in JSON', () {
      final json = {
        'a': {'type': 'image', 'url': 'url1'},
        'b': [
          {'type': 'image', 'url': 'url2'}
        ]
      };
      final urls = <String>{};
      PdfDataUtils.extractImageUrls(json, urls);
      expect(urls, containsAll(['url1', 'url2']));
    });
  });
}
