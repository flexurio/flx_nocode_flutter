import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_tooltip.dart';
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

  testWidgets(
      'ComponentTable renders cell text wrapped with EntityFieldTooltip',
      (tester) async {
    when(() => mockExecutor.execute(any())).thenAnswer(
        (_) async => HttpRequestResult.success(statusCode: 200, data: {
              "data": [
                {"name": "MacBook Pro M3"},
              ]
            }));

    final component = ComponentTable(
      id: 'test_table_tooltip',
      columns: [
        TColumn(header: 'Product', body: 'name'),
      ],
      width: 500,
      http: HttpData(
          method: 'GET', url: 'http://api.com/products', headers: {}, body: {}),
    );

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: component.toWidget(data: {}),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify cell text is present
    expect(find.text('MacBook Pro M3'), findsOneWidget);

    // Verify cell text is wrapped inside EntityFieldTooltip
    final tooltipFinder = find.byType(EntityFieldTooltip);
    expect(tooltipFinder, findsOneWidget);

    final tooltipWidget = tester.widget<EntityFieldTooltip>(tooltipFinder);
    expect(tooltipWidget.message, 'MacBook Pro M3');
  });
}
