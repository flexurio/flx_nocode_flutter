import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';

void main() {
  testWidgets('ComponentRow should respect x_align: right even with single child', (tester) async {
    // 1. Setup a Row with x_align: right and only one child
    final component = ComponentRow(
      id: 'test_row',
      xAlign: 'right',
      children: [
        ComponentButton(
          id: 'test_btn',
          text: 'Right Aligned',
          color: '#2196F3',
        ),
      ],
    );

    // 2. Render the widget
    // We pass an empty map as context data
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: component.toWidget({}),
        ),
      ),
    );

    // 3. Verify that a Row widget is rendered (not just the button directly)
    final rowFinder = find.byType(Row);
    expect(rowFinder, findsOneWidget, reason: 'Row should be rendered even for single child to preserve alignment');

    // 4. Verify that MainAxisAlignment is correctly mapped to end (right)
    final rowWidget = tester.widget<Row>(rowFinder);
    expect(rowWidget.mainAxisAlignment, MainAxisAlignment.end);
    
    // 5. Verify the child is present
    expect(find.text('Right Aligned'), findsOneWidget);
  });

  testWidgets('ComponentRow should respect x_align: center with single child', (tester) async {
    final component = ComponentRow(
      id: 'center_row',
      xAlign: 'center',
      children: [
        ComponentButton(
          id: 'btn',
          text: 'Centered',
          color: '#000000',
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: component.toWidget({}),
        ),
      ),
    );

    final rowWidget = tester.widget<Row>(find.byType(Row));
    expect(rowWidget.mainAxisAlignment, MainAxisAlignment.center);
  });
}
