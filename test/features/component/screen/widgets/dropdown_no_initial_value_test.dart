import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval_flutter_js.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ComponentDropdown component;
  late Map<String, dynamic> data;
  late TextEditingController targetCtrl;

  setUp(() {
    Configuration.instance = Configuration.empty();
    targetCtrl = TextEditingController();
    component = ComponentDropdown(
      id: 'test_dropdown',
      label: 'Test Dropdown',
      options: ['A', 'B', 'C'],
      initialValue: '', // No initial value
    );
    data = {
      'controller': targetCtrl,
      'allControllers': <String, TextEditingController>{
        'test_dropdown': targetCtrl
      },
      'data': {'test_dropdown': ''},
    };
  });

  tearDown(() {
    disposeJsRuntime();
  });

  group('ComponentDropdownController No Initial Value Tests', () {
    testWidgets(
        'Should NOT automatically select first option when initialValue is empty',
        (tester) async {
      final controller =
          ComponentDropdownController(component: component, data: data);

      // Trigger initialization
      controller.onInit();

      // Expectation: selectedValue should be null because initialValue is empty
      // BUT CURRENT BEHAVIOR (BUG): it selects 'A'
      expect(controller.selectedValue.value, isNull,
          reason:
              'Dropdown should not have a selected value if initialValue is empty');
      expect(controller.displayedValue.value, isNull);

      // Process post-frame callback
      await tester.pump();
      await tester.pump(Duration.zero);
      expect(targetCtrl.text, '',
          reason: 'Target controller should be empty if no value is selected');

      disposeJsRuntime();
    });
  });
}
