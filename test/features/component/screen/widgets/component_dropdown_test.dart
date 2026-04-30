import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown_widget.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval_flutter_js.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
    disposeJsRuntime();
  });

  group('ComponentDropdown Extension Tests', () {
    testWidgets('toWidget should return ComponentDropdownWidget',
        (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'Test Label',
        options: ['A', 'B'],
        initialValue: '',
      );
      final data = <String, dynamic>{};

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(data),
          ),
        ),
      );

      expect(find.byType(ComponentDropdownWidget), findsOneWidget);
    });

    testWidgets('toMockWidget should render mock UI', (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'Mock Label',
        options: ['A', 'B'],
        widthMode: 'fixed',
        width: 200,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );

      expect(find.text('Mock Label'), findsOneWidget);
      expect(find.text('Select Mock Label...'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    });

    testWidgets('toMockWidget should handle widthMode hug', (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'Hug Label',
        options: ['A', 'B'],
        widthMode: 'hug',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: component.toMockWidget()),
          ),
        ),
      );

      expect(find.text('Select Hug Label...'), findsOneWidget);
      // Verify it doesn't take full width (harder to test directly, but we check it renders)
    });
  });

  group('ComponentDropdownWidget Tests', () {
    testWidgets('should display label and initial value', (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'City',
        options: ['New York', 'London'],
        initialValue: 'London',
      );
      final data = <String, dynamic>{};

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: ComponentDropdownWidget(
              component: component,
              data: data,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('City'), findsOneWidget);
      expect(find.text('London'), findsOneWidget);
    });

    testWidgets('should render small version when isSmall is true',
        (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'City',
        options: ['New York', 'London'],
      );
      final data = <String, dynamic>{};

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: ComponentDropdownWidget(
              component: component,
              data: data,
              isSmall: true,
            ),
          ),
        ),
      );

      expect(find.byType(FDropDownSearchSmall<Map<String, dynamic>>),
          findsOneWidget);
    });

    testWidgets('should show required validation error', (tester) async {
      final component = ComponentDropdown(
        id: 'test_id',
        label: 'Required Field',
        options: ['A', 'B'],
        required: true,
      );
      final data = <String, dynamic>{};

      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: ComponentDropdownWidget(
                component: component,
                data: data,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Trigger validation
      formKey.currentState!.validate();
      await tester.pumpAndSettle();

      expect(find.text('Required Field is required'), findsOneWidget);
    });
  });
}
