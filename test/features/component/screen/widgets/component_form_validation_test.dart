import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_form.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  group('ComponentForm Model Tests', () {
    test('Should serialize and deserialize correctly', () {
      final form = ComponentForm(
        id: 'f1',
        children: [
          ComponentTextField(id: 't1', label: 'L1'),
        ],
      );

      final map = form.toMap();
      expect(map['id'], 'f1');
      expect(map['type'], 'form');
      expect(map['children'], isList);
      expect(map['children'][0]['id'], 't1');

      final fromMap = ComponentForm.fromMap(map);
      expect(fromMap.id, 'f1');
      expect(fromMap.children.length, 1);
      expect(fromMap.children[0].id, 't1');
    });
  });

  group('ComponentForm Widget & Action Validation Tests', () {
    testWidgets(
        'Action with validate: true should not execute if form is invalid',
        (tester) async {
      // 1. Create a form with a required text field and a button
      final textField = ComponentTextField(
        id: 'name',
        label: 'Name',
        required: true,
      );

      final action = ActionD(
        id: 'test_action',
        name: 'Submit',
        type: ActionType.setVariable,
        validate: true,
        targetVariable: 'test_var',
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        isMultiple: false,
      );

      final submitButton = ComponentButton(
        id: 'btn',
        text: 'Submit',
        color: 'blue',
        onClick: action,
      );

      final formComponent = ComponentForm(
        id: 'test_form',
        children: [textField, submitButton],
      );

      final entity = EntityCustom.empty();
      final data = <String, dynamic>{
        'entity': entity,
        'allControllers': <String, TextEditingController>{
          'name': TextEditingController(),
        },
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: formComponent.toWidget(data: data),
          ),
        ),
      );

      // 2. Try to submit empty form
      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();

      // Validation message should appear
      expect(find.text('Name is required'), findsOneWidget);
    });

    testWidgets(
        'Action with validate: false should execute even if form is invalid',
        (tester) async {
      final textField = ComponentTextField(
        id: 'name',
        label: 'Name',
        required: true,
      );

      final action = ActionD(
        id: 'test_action',
        name: 'Submit',
        type: ActionType.setVariable,
        validate: false,
        targetVariable: 'test_var',
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        isMultiple: false,
      );

      final submitButton = ComponentButton(
        id: 'btn',
        text: 'Submit',
        color: 'blue',
        onClick: action,
      );

      final formComponent = ComponentForm(
        id: 'test_form',
        children: [textField, submitButton],
      );

      final entity = EntityCustom.empty();
      final data = <String, dynamic>{
        'entity': entity,
        'allControllers': <String, TextEditingController>{
          'name': TextEditingController(),
        },
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: formComponent.toWidget(data: data),
          ),
        ),
      );

      await tester.tap(find.text('Submit'));
      await tester.pumpAndSettle();

      // Validation message should NOT be shown
      expect(find.text('Name is required'), findsNothing);
    });
  });
}
