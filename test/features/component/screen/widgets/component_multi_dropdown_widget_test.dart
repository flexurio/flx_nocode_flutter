import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component_multi_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_multi_dropdown_widget.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_multi_dropdown_controller.dart';

void main() {
  group('ComponentMultiDropdownWidget Tests', () {
    late ComponentMultiDropdown component;
    late Map<String, dynamic> data;
    late Map<String, TextEditingController> controllers;

    setUp(() {
      component = ComponentMultiDropdown(
        id: 'test_multi_dropdown',
        label: 'Select Items',
        options: ['Item 1', 'Item 2', 'Item 3'],
        initialValues: ['Item 1'],
        required: true,
      );

      controllers = {
        'test_multi_dropdown': TextEditingController(),
      };

      data = {
        'data': {},
        'allControllers': controllers,
      };
    });

    tearDown(() {
      Get.reset();
    });

    testWidgets('renders initial values correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ComponentMultiDropdownWidget(
              component: component,
              data: data,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check if the label is visible
      expect(find.text('Select Items'), findsOneWidget);
      
      // Check if the initial value is visible in the dropdown builder
      expect(find.text('Item 1'), findsOneWidget);
    });

    testWidgets('shows validation error when empty and required', (tester) async {
      // Clear initial values
      component = ComponentMultiDropdown(
        id: 'test_multi_dropdown',
        label: 'Select Items',
        options: ['Item 1', 'Item 2'],
        initialValues: [],
        required: true,
      );

      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: ComponentMultiDropdownWidget(
                component: component,
                data: data,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      formKey.currentState!.validate();
      await tester.pumpAndSettle();

      expect(find.text('Select Items is required'), findsOneWidget);
    });
  });
}
