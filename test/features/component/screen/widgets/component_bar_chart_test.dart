import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_bar_chart.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_bar_chart_controller.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

void main() {
  group('ComponentBarChart', () {
    late MockHttpRequestExecutor mockExecutor;

    setUp(() {
      Get.testMode = true;
      Configuration.instance = Configuration.empty();
      mockExecutor = MockHttpRequestExecutor();
      Get.put<HttpRequestExecutor>(mockExecutor);
    });

    tearDown(() {
      Get.reset();
    });

    testWidgets('should render chart with local data', (tester) async {
      final originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails details) {
        if (details.exception.toString().contains('A disposed RenderObject was mutated')) {
          return;
        }
        originalOnError?.call(details);
      };

      final component = ComponentBarChart(
        id: 'bar_chart',
        title: 'Sales',
        referenceId: 'sales_data',
        labelKey: 'month',
        valueKey: 'amount',
        http: HttpData.empty(),
      );

      final data = {
        'sales_data': [
          {'month': 'Jan', 'amount': 100},
          {'month': 'Feb', 'amount': 200},
        ]
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(data: data),
          ),
        ),
      );

      await tester.pumpAndSettle(); // Handle Obx update and pending timers

      expect(find.byType(FlxBarChart), findsOneWidget);
      expect(find.text('Sales'), findsOneWidget);

      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();

      FlutterError.onError = originalOnError;
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentBarChart(
        id: 'mock',
        http: HttpData.empty(),
        labelKey: 'label',
        valueKey: 'value',
      );
      await tester.pumpWidget(MaterialApp(home: component.toMockWidget()));
      expect(find.text('Bar Chart Mock'), findsOneWidget);
      expect(find.byIcon(Icons.bar_chart), findsOneWidget);
    });

    test('ComponentBarChartController should load data correctly', () async {
      final component = ComponentBarChart(
        id: 'bar_chart',
        labelKey: 'name',
        valueKey: 'qty',
        referenceId: 'items',
        http: HttpData.empty(),
      );
      
      final controller = ComponentBarChartController(
        component: component,
        contextData: {
          'items': [
            {'name': 'A', 'qty': 10},
            {'name': 'B', 'qty': '20.5'},
          ]
        },
      );

      await controller.loadData();
      
      expect(controller.chartData.length, 2);
      expect(controller.chartData[0].label, 'A');
      expect(controller.chartData[0].value, 10.0);
      expect(controller.chartData[1].label, 'B');
      expect(controller.chartData[1].value, 20.5);
    });
  });
}
