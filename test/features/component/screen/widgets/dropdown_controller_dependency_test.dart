import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown_controller.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/core/utils/js/js_eval_flutter_js.dart';
import 'package:get/get.dart';

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
      dependsOn: ['parent_id'],
    );
    data = {
      'controller': targetCtrl,
      'allControllers': <String, TextEditingController>{
        'test_dropdown': targetCtrl,
        'parent_id': TextEditingController(text: '1'),
      },
      'data': {'parent_id': '1'},
    };
  });

  tearDown(() {
    disposeJsRuntime();
  });

  group('ComponentDropdownController Dependency Tests', () {
    test('updateData should trigger refresh when dependency changes', () {
      final controller = ComponentDropdownController(component: component, data: data);
      
      controller.selectedValue.value = 'A';
      
      final newData = {
        ...data,
        'data': {'parent_id': '2'}, // Changed
      };
      
      controller.updateData(newData);
      
      // _onDependencyChanged clears selectedValue
      expect(controller.selectedValue.value, isNull);
    });

    test('updateData should NOT trigger refresh when unrelated data changes', () {
      final controller = ComponentDropdownController(component: component, data: data);
      controller.selectedValue.value = 'A';
      
      final newData = {
        ...data,
        'data': {'parent_id': '1', 'other': 'value'}, // parent_id same
      };
      
      controller.updateData(newData);
      
      expect(controller.selectedValue.value, 'A');
    });
  });
}
