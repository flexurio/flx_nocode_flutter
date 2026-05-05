import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

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

    // Mock successful response
    when(() => mockExecutor.execute(any())).thenAnswer((_) async =>
        HttpRequestResult.success(statusCode: 200, data: {"data": []}));
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('ComponentTable should only reload when dependsOn fields change',
      (WidgetTester tester) async {
    // 1. Define component with dependency
    final component = ComponentTable(
      id: 'test_table',
      columns: [TColumn(header: 'Name', body: 'name')],
      http: HttpData(
        method: 'GET',
        url: 'http://api.com/items?dep={{form.dep_field}}',
        headers: {},
        body: {},
      ),
      width: 800,
      dependsOn: ['dep_field'],
    );

    // 2. Initial state
    final initialData = {
      'dep_field': 'v1',
      'other_field': 'x1',
    };

    final key = GlobalKey<_TestWrapperState>();

    // 3. Render
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: TestWrapper(
            key: key,
            component: component,
            initialData: initialData,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify initial load
    verify(() => mockExecutor.execute(any())).called(1);

    // 4. Update with UNRELATED field change
    key.currentState?.updateData({
      'dep_field': 'v1', // same
      'other_field': 'x2', // changed
    });

    await tester.pump(); // Trigger build

    // Verify NO additional load
    verifyNever(() => mockExecutor.execute(any()));

    // 5. Update with DEPENDENT field change
    key.currentState?.updateData({
      'dep_field': 'v2', // changed
      'other_field': 'x2',
    });

    await tester.pump(); // Trigger build

    // Verify load WAS called
    verify(() => mockExecutor.execute(any())).called(1);
  });
}

class TestWrapper extends StatefulWidget {
  final ComponentTable component;
  final Map<String, dynamic> initialData;

  const TestWrapper({
    super.key,
    required this.component,
    required this.initialData,
  });

  @override
  _TestWrapperState createState() => _TestWrapperState();
}

class _TestWrapperState extends State<TestWrapper> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = widget.initialData;
  }

  void updateData(Map<String, dynamic> newData) {
    setState(() {
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.component.toWidget(data);
  }
}
