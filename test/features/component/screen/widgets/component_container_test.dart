import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_container.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_container.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

void main() {
  group('ComponentContainer', () {
    testWidgets('should render with correct padding and decoration', (tester) async {
      final component = ComponentContainer(
        id: 'container',
        child: ComponentText(id: 't', value: 'In Container'),
        padding: 10,
        margin: 5,
        color: '#FF0000',
        borderRadius: 8,
        borderWidth: 1,
        borderColor: '#000000',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget(data: {}),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.text('In Container'), findsOneWidget);

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color(0xFFFF0000));
      expect(decoration.borderRadius, BorderRadius.circular(8));
      expect(container.padding, const EdgeInsets.all(10));
      expect(container.margin, const EdgeInsets.all(5));
    });

    testWidgets('should handle widthMode and heightMode', (tester) async {
      final component = ComponentContainer(
        id: 'container',
        widthMode: ComponentSizeMode.fill,
        heightMode: ComponentSizeMode.hug,
      );

      await tester.pumpWidget(MaterialApp(home: component.toWidget(data: {})));
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, double.infinity);
      expect(container.constraints?.maxHeight, double.infinity); // hug means null height/unconstrained in this implementation
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentContainer(
        id: 'mock',
        child: ComponentText(id: 't', value: 'Mock'),
      );
      await tester.pumpWidget(MaterialApp(home: component.toMockWidget()));
      expect(find.text('Mock'), findsOneWidget);
    });
  });
}
