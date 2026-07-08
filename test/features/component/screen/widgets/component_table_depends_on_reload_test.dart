// Tests for the bug fix in component_table.dart:
//
// BUG: When a ComponentTable has both `reference_id` and `dependsOn`, the table
// only fetches data from HTTP on the FIRST dependsOn change.  On subsequent
// changes the table early-returns from loadData() using the stale JSON that
// notifyChanged() had previously written into the referenceId controller.
//
// FIX: When a `dependsOn` field change is detected, `_clearReferenceIdController()`
// is called before `loadData()`, resetting the referenceId controller to "" so
// that loadData() cannot early-return and is forced to make an HTTP request.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';

class MockHttpRequestExecutor extends Mock implements HttpRequestExecutor {}

class FakeHttpRequestConfig extends Fake implements HttpRequestConfig {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

ComponentTable _buildTable({
  String id = 'param_table',
  String referenceId = 'parameter_list',
  String dependsOn = 'product_id',
}) {
  return ComponentTable(
    id: id,
    columns: [
      TColumn(header: 'Tahap', body: 'stage_name'),
      TColumn(header: 'Parameter', body: 'param_name'),
    ],
    http: HttpData(
      method: 'GET',
      url: 'http://api.example.com/params?product_id.eq={{form.product_id}}',
      headers: {'Authorization': 'Bearer test'},
      body: {},
    ),
    referenceId: referenceId,
    dependsOn: [dependsOn],
    width: 800,
  );
}

class _TableHost extends StatefulWidget {
  final ComponentTable component;
  final Map<String, dynamic> initialData;

  const _TableHost({
    super.key,
    required this.component,
    required this.initialData,
  });

  @override
  _TableHostState createState() => _TableHostState();
}

class _TableHostState extends State<_TableHost> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.of(widget.initialData);
  }

  void push(Map<String, dynamic> newData) => setState(() => data = newData);

  @override
  Widget build(BuildContext context) => widget.component.toWidget(data);
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late MockHttpRequestExecutor mockExecutor;
  late TextEditingController productCtrl;
  late TextEditingController paramListCtrl;

  setUpAll(() {
    registerFallbackValue(FakeHttpRequestConfig());
  });

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();

    productCtrl = TextEditingController(text: '');
    paramListCtrl = TextEditingController(text: '');

    mockExecutor = MockHttpRequestExecutor();
    Get.put<HttpRequestExecutor>(mockExecutor);

    when(() => mockExecutor.execute(any())).thenAnswer(
      (_) async => HttpRequestResult.success(
        statusCode: 200,
        data: {
          'data': [
            {'stage_name': 'Stage A', 'param_name': 'pH'},
            {'stage_name': 'Stage A', 'param_name': 'Viscosity'},
          ]
        },
      ),
    );
  });

  tearDown(() {
    productCtrl.dispose();
    paramListCtrl.dispose();
    Get.reset();
  });

  // -------------------------------------------------------------------------
  // Core regression test
  // -------------------------------------------------------------------------
  group('dependsOn reload with referenceId — regression for stale-local-data bug',
      () {
    testWidgets(
        'table hits HTTP on EVERY product_id change, not just the first one',
        (WidgetTester tester) async {
      final component = _buildTable();
      final allCtrls = <String, dynamic>{
        'product_id': productCtrl,
        'parameter_list': paramListCtrl,
      };

      final hostKey = GlobalKey<_TableHostState>();
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: _TableHost(
              key: hostKey,
              component: component,
              initialData: {
                'product_id': '',
                'parameter_list': '',
                'form': {'product_id': ''},
                'allControllers': allCtrls,
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // ── First selection: product-A ────────────────────────────────────────
      productCtrl.text = 'product-A';
      hostKey.currentState?.push({
        'product_id': 'product-A',
        'parameter_list': '',
        'form': {'product_id': 'product-A'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      final callsAfterFirst = verify(() => mockExecutor.execute(any())).callCount;
      expect(callsAfterFirst, greaterThanOrEqualTo(1),
          reason: 'HTTP must be called when product_id is first selected');

      // Simulate notifyChanged writing rows into paramListCtrl
      paramListCtrl.text = '[{"stage_name":"Stage A","param_name":"pH"}]';

      // ── Second selection: product-B (was broken before fix) ───────────────
      productCtrl.text = 'product-B';
      hostKey.currentState?.push({
        'product_id': 'product-B',
        'parameter_list': paramListCtrl.text, // stale JSON still in controller
        'form': {'product_id': 'product-B'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      final callsAfterSecond =
          verify(() => mockExecutor.execute(any())).callCount;
      expect(
        callsAfterSecond,
        greaterThanOrEqualTo(1),
        reason:
            'HTTP MUST be called again on second product_id change. '
            'If this fails, loadData() early-returned from stale referenceId data.',
      );

      // ── Third selection: product-C ─────────────────────────────────────────
      paramListCtrl.text =
          '[{"stage_name":"Stage B","param_name":"Viscosity"}]';
      productCtrl.text = 'product-C';
      hostKey.currentState?.push({
        'product_id': 'product-C',
        'parameter_list': paramListCtrl.text,
        'form': {'product_id': 'product-C'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      final callsAfterThird =
          verify(() => mockExecutor.execute(any())).callCount;
      expect(callsAfterThird, greaterThanOrEqualTo(1),
          reason: 'HTTP must be called on every subsequent product_id change');
    });

    testWidgets(
        'referenceId controller is cleared to "" before HTTP fetch on dependsOn change',
        (WidgetTester tester) async {
      final component = _buildTable();
      final allCtrls = <String, dynamic>{
        'product_id': productCtrl,
        'parameter_list': paramListCtrl,
      };

      // Prime with stale JSON (simulates state after first load)
      paramListCtrl.text = '[{"stage_name":"Old","param_name":"Old Param"}]';
      productCtrl.text = 'product-A';

      final hostKey = GlobalKey<_TableHostState>();
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: _TableHost(
              key: hostKey,
              component: component,
              initialData: {
                'product_id': 'product-A',
                'parameter_list': paramListCtrl.text,
                'form': {'product_id': 'product-A'},
                'allControllers': allCtrls,
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      clearInteractions(mockExecutor);

      // Change product_id → fix should clear paramListCtrl before loadData
      productCtrl.text = 'product-B';
      hostKey.currentState?.push({
        'product_id': 'product-B',
        'parameter_list': paramListCtrl.text, // still has old JSON
        'form': {'product_id': 'product-B'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      // After the fix, HTTP should have been called
      verify(() => mockExecutor.execute(any())).called(greaterThanOrEqualTo(1));

      // paramListCtrl should NOT still contain the old product-A data
      final text = paramListCtrl.text;
      expect(
        text.contains('"Old Param"'),
        isFalse,
        reason:
            'paramListCtrl must NOT still contain stale data from product-A '
            'after switching to product-B',
      );
    });
  });

  // -------------------------------------------------------------------------
  // Table WITHOUT reference_id (comp_table after JSON fix)
  // -------------------------------------------------------------------------
  group('table without reference_id (comp_table after JSON fix)', () {
    testWidgets('always hits HTTP on every dependsOn change',
        (WidgetTester tester) async {
      final component = ComponentTable(
        id: 'comp_table',
        columns: [
          TColumn(header: 'Zat Aktif', body: 'active_substance_name')
        ],
        http: HttpData(
          method: 'GET',
          url:
              'http://api.example.com/compositions?product_id.eq={{form.product_id}}',
          headers: {},
          body: {},
        ),
        dependsOn: ['product_id'],
        width: 800,
      );

      productCtrl.text = 'product-A';
      final allCtrls = <String, dynamic>{'product_id': productCtrl};

      final hostKey = GlobalKey<_TableHostState>();
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: _TableHost(
              key: hostKey,
              component: component,
              initialData: {
                'product_id': 'product-A',
                'form': {'product_id': 'product-A'},
                'allControllers': allCtrls,
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      clearInteractions(mockExecutor);

      for (final productId in ['product-B', 'product-C', 'product-D']) {
        productCtrl.text = productId;
        hostKey.currentState?.push({
          'product_id': productId,
          'form': {'product_id': productId},
          'allControllers': allCtrls,
        });
        await tester.pump();
        await tester.pumpAndSettle();

        verify(() => mockExecutor.execute(any())).called(greaterThanOrEqualTo(1));
        clearInteractions(mockExecutor);
      }
    });
  });

  // -------------------------------------------------------------------------
  // Ensure referenceId-only changes (append_variable) do NOT force HTTP
  // -------------------------------------------------------------------------
  group('referenceId-only change (append_variable) does NOT force HTTP fetch',
      () {
    testWidgets(
        'row appended to parameter_list refreshes table from local data, not HTTP',
        (WidgetTester tester) async {
      final component = _buildTable();
      productCtrl.text = 'product-A';

      final allCtrls = <String, dynamic>{
        'product_id': productCtrl,
        'parameter_list': paramListCtrl,
      };

      final hostKey = GlobalKey<_TableHostState>();
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: _TableHost(
              key: hostKey,
              component: component,
              initialData: {
                'product_id': 'product-A',
                'parameter_list': '',
                'form': {'product_id': 'product-A'},
                'allControllers': allCtrls,
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      clearInteractions(mockExecutor);

      // Simulate append_variable: only parameter_list changes
      hostKey.currentState?.push({
        'product_id': 'product-A', // UNCHANGED
        'parameter_list': '[{"stage_name":"X","param_name":"New Row"}]',
        'form': {'product_id': 'product-A'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      // product_id did not change → dependsOn not triggered → no HTTP call
      verifyNever(() => mockExecutor.execute(any()));
    });
  });

  // -------------------------------------------------------------------------
  // URL interpolation sanity check
  // -------------------------------------------------------------------------
  group('URL interpolation uses latest product_id value', () {
    testWidgets('HTTP request URL contains new product_id after change',
        (WidgetTester tester) async {
      final capturedConfigs = <HttpRequestConfig>[];
      when(() => mockExecutor.execute(any())).thenAnswer((inv) async {
        capturedConfigs
            .add(inv.positionalArguments.first as HttpRequestConfig);
        return HttpRequestResult.success(
          statusCode: 200,
          data: {'data': []},
        );
      });

      final component = _buildTable();
      productCtrl.text = 'product-111';

      final allCtrls = <String, dynamic>{
        'product_id': productCtrl,
        'parameter_list': paramListCtrl,
      };

      final hostKey = GlobalKey<_TableHostState>();
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: _TableHost(
              key: hostKey,
              component: component,
              initialData: {
                'product_id': 'product-111',
                'parameter_list': '',
                'form': {'product_id': 'product-111'},
                'allControllers': allCtrls,
              },
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Simulate stale local data from previous load
      paramListCtrl.text = '[{"stage_name":"Old","param_name":"Old"}]';

      capturedConfigs.clear();

      // Change to product-222
      productCtrl.text = 'product-222';
      hostKey.currentState?.push({
        'product_id': 'product-222',
        'parameter_list': paramListCtrl.text,
        'form': {'product_id': 'product-222'},
        'allControllers': allCtrls,
      });
      await tester.pump();
      await tester.pumpAndSettle();

      expect(capturedConfigs, isNotEmpty,
          reason: 'HTTP must be called after product_id change');

      final lastUrl = capturedConfigs.last.url;
      expect(
        lastUrl,
        contains('product-222'),
        reason:
            'HTTP URL must be interpolated with the NEW product_id value, '
            'not the stale one',
      );
      expect(
        lastUrl,
        isNot(contains('product-111')),
        reason: 'Old product_id must not appear in the new request URL',
      );
    });
  });
}
