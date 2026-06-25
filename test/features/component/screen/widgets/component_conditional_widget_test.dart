import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_conditional.dart';

void main() {
  group('ComponentConditionalWidget Tests', () {
    testWidgets('renders "then" branch when condition is true', (tester) async {
      final component = ComponentConditional(
        id: 'cond_1',
        condition: '1 == 1',
        then: ComponentText(id: 't1', value: 'Branch True'),
        otherwise: ComponentText(id: 't2', value: 'Branch False'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Branch True'), findsOneWidget);
      expect(find.text('Branch False'), findsNothing);
    });

    testWidgets('renders "otherwise" branch when condition is false', (tester) async {
      final component = ComponentConditional(
        id: 'cond_1',
        condition: '1 == 2',
        then: ComponentText(id: 't1', value: 'Branch True'),
        otherwise: ComponentText(id: 't2', value: 'Branch False'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Branch True'), findsNothing);
      expect(find.text('Branch False'), findsOneWidget);
    });

    testWidgets('renders nothing when condition is false and "otherwise" is null', (tester) async {
      final component = ComponentConditional(
        id: 'cond_1',
        condition: 'false',
        then: ComponentText(id: 't1', value: 'Branch True'),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Branch True'), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('uses KeyedSubtree with unique keys for then and otherwise branch widgets', (tester) async {
      final component = ComponentConditional(
        id: 'cond_1',
        condition: 'form.val === "A"',
        then: ComponentText(id: 't1', value: 'Branch True'),
        otherwise: ComponentText(id: 't2', value: 'Branch False'),
      );

      final dataA = {
        'form': {'val': 'A'},
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget(dataA),
          ),
        ),
      );

      final keyedSubtreeThen = tester.widget<KeyedSubtree>(
        find.ancestor(
          of: find.text('Branch True'),
          matching: find.byType(KeyedSubtree),
        ).first,
      );
      expect(keyedSubtreeThen.key, const ValueKey('cond_1_then_t1'));

      final dataB = {
        'form': {'val': 'B'},
      };

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget(dataB),
          ),
        ),
      );

      final keyedSubtreeElse = tester.widget<KeyedSubtree>(
        find.ancestor(
          of: find.text('Branch False'),
          matching: find.byType(KeyedSubtree),
        ).first,
      );
      expect(keyedSubtreeElse.key, const ValueKey('cond_1_else_t2'));
    });

    testWidgets('syncs TextEditingController values for active branch components', (tester) async {
      final component = ComponentConditional(
        id: 'cond_1',
        condition: 'form.val === "A"',
        then: ComponentTextField(id: 'tf_field', label: 'Field A', initialValue: 'Value A'),
        otherwise: ComponentTextField(id: 'tf_field', label: 'Field B', initialValue: 'Value B'),
      );

      final controller = TextEditingController(text: 'Initial Text');
      final controllers = <String, TextEditingController>{
        'tf_field': controller,
      };

      final dataA = {
        'form': {'val': 'A'},
        'allControllers': controllers,
      };

      // When condition is true, controller text should be synchronized to 'Value A'
      component.toWidget(dataA);
      expect(controller.text, 'Value A');

      final dataB = {
        'form': {'val': 'B'},
        'allControllers': controllers,
      };

      // When condition is false, controller text should be synchronized to 'Value B'
      component.toWidget(dataB);
      expect(controller.text, 'Value B');
    });
  });
}
