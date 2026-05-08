import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval_flutter_js.dart';

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

class FakeHttpRequestConfig extends Fake implements HttpRequestConfig {}

void main() {
  late MockHttpRequestExecutor mockExecutor;

  setUpAll(() {
    registerFallbackValue(FakeHttpRequestConfig());
  });

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
    mockExecutor = MockHttpRequestExecutor();
    Get.put<HttpRequestExecutor>(mockExecutor);
  });

  tearDown(() {
    Get.reset();
    disposeJsRuntime();
  });

  testWidgets('ComponentTable should interpolate cell text using row data',
      (tester) async {
    // 1. Mock response with data
    when(() => mockExecutor.execute(any())).thenAnswer(
        (_) async => HttpRequestResult.success(statusCode: 200, data: {
              "data": [
                {"id": "1", "name": "Item A"},
                {"id": "2", "name": "Item B"},
              ]
            }));

    final component = ComponentTable(
      id: 'test_table',
      columns: [
        TColumn(header: 'Name', body: 'Hello {{ name }}'),
        TColumn(header: 'ID', body: 'ID: {{ data.id }}'),
      ],
      width: 800,
      http: HttpData(
          method: 'GET', url: 'http://api.com/items', headers: {}, body: {}),
    );

    // 2. Render
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: component.toWidget(data: {}),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // 3. Verify interpolation results
    expect(find.text('Hello Item A'), findsOneWidget);
    expect(find.text('Hello Item B'), findsOneWidget);
    expect(find.text('ID: 1'), findsOneWidget);
    expect(find.text('ID: 2'), findsOneWidget);
  });
}
