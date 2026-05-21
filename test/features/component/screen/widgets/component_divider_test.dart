import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_divider.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_divider.dart';

void main() {
  group('ComponentDivider', () {
    testWidgets('should render correctly', (tester) async {
      final component = ComponentDivider(
        id: 'divider',
        thickness: 2.0,
        indent: 10.0,
        endIndent: 10.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.thickness, 2.0);
      expect(divider.indent, 10.0);
      expect(divider.endIndent, 10.0);
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentDivider(id: 'mock');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );
      expect(find.byType(Divider), findsOneWidget);
    });
  });
}
