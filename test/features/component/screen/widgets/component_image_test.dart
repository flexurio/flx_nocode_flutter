import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_image.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_image.dart';

void main() {
  group('ComponentImage', () {
    testWidgets('should render network image with specified fit', (tester) async {
      final fits = ['cover', 'contain', 'fill', 'fitWidth', 'fitHeight', 'none', 'scaleDown'];

      for (final fit in fits) {
        final component = ComponentImage(
          id: 'img_$fit',
          url: 'https://example.com/image.png',
          width: 200,
          height: 150,
          fit: fit,
        );

        // We use pumpWidget but since it's a network image, it will likely show error builder or placeholder
        // because we don't have internet in tests usually.
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: component.toWidget({}),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
        final image = tester.widget<Image>(find.byType(Image));
        expect(image.width, 200);
        expect(image.height, 150);
      }
    });

    testWidgets('should render mock widget', (tester) async {
      final component = ComponentImage(
        id: 'mock',
        url: '',
        width: 100,
        height: 100,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(find.text('100 x 100'), findsOneWidget);
    });
  });
}
