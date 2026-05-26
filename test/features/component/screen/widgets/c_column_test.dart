import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:gap/gap.dart';

void main() {
  group('ComponentColumn', () {
    testWidgets('should render children with gaps and alignments',
        (tester) async {
      final component = ComponentColumn(
        id: 'col',
        children: [
          ComponentText(id: 't1', value: 'Text 1'),
          ComponentText(id: 't2', value: 'Text 2'),
        ],
        gap: 10.0,
        xAlign: 'center',
        yAlign: 'between',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      expect(find.text('Text 1'), findsOneWidget);
      expect(find.text('Text 2'), findsOneWidget);
      expect(find.byType(Gap), findsOneWidget);

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.spaceBetween);
      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('should not add gaps for hidden children', (tester) async {
      final component = ComponentColumn(
        id: 'col',
        children: [
          ComponentText(id: 't1', value: 'Text 1'),
          ComponentText(
            id: 'hidden',
            value: 'Hidden',
            visibilityCondition: 'false',
          ),
          ComponentText(id: 't2', value: 'Text 2'),
        ],
        gap: 10.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Text 1'), findsOneWidget);
      expect(find.text('Hidden'), findsNothing);
      expect(find.text('Text 2'), findsOneWidget);
      expect(find.byType(Gap), findsOneWidget);
    });

    testWidgets('should not render gaps when only one child is visible',
        (tester) async {
      final component = ComponentColumn(
        id: 'col',
        children: [
          ComponentText(
            id: 'hidden_1',
            value: 'Hidden 1',
            visibilityCondition: 'false',
          ),
          ComponentText(id: 'visible', value: 'Visible'),
          ComponentText(
            id: 'hidden_2',
            value: 'Hidden 2',
            visibilityCondition: 'false',
          ),
        ],
        gap: 10.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.text('Visible'), findsOneWidget);
      expect(find.byType(Gap), findsNothing);
    });

    testWidgets('should handle different alignments', (tester) async {
      final yAligns = [
        'top',
        'center',
        'bottom',
        'between',
        'around',
        'evenly'
      ];
      final xAligns = ['left', 'center', 'right', 'stretch'];

      for (final y in yAligns) {
        for (final x in xAligns) {
          final component = ComponentColumn(
            id: 'col',
            children: [ComponentText(id: 't', value: 'T')],
            xAlign: x,
            yAlign: y,
          );
          await tester.pumpWidget(MaterialApp(home: component.toWidget({})));
          // Verification of alignment mapping
        }
      }
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentColumn(
        id: 'col',
        children: [
          ComponentText(id: 't1', value: 'T1'),
          ComponentText(id: 't2', value: 'T2'),
        ],
        gap: 5,
      );

      await tester.pumpWidget(MaterialApp(home: component.toMockWidget()));
      expect(find.byType(Column), findsOneWidget);
    });
  });
}
