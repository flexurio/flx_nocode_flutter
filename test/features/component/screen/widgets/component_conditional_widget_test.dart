import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
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
  });
}
