import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_row.dart';

void main() {
  group('ComponentRow Widget Tests', () {
    testWidgets('scales children using flex values even if not explicitly fill', (tester) async {
      final rowComponent = ComponentRow(
        id: 'row_1',
        xAlign: 'left',
        yAlign: 'top',
        horizontalGap: 10,
        widthMode: ComponentSizeMode.fill,
        children: [
          ComponentFieldDisplay(
            id: 'f1_id',
            label: 'F1',
            value: 'V1',
            flex: 2,
          ),
          ComponentFieldDisplay(
            id: 'f2_id',
            label: 'F2',
            value: 'V2',
            flex: 3,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 500,
                child: rowComponent.toWidget({}),
              ),
            ),
          ),
        ),
      );

      // Find children by their labels since ValueKey is missing
      final f1Finder = find.text('F1');
      final f2Finder = find.text('F2');

      // We need to find the parent Expanded or the container that has the width
      // Since TileDataVertical is used, we'll look for the Column that contains the text
      final f1Parent = find.ancestor(of: f1Finder, matching: find.byType(Expanded)).first;
      final f2Parent = find.ancestor(of: f2Finder, matching: find.byType(Expanded)).first;

      final f1Size = tester.getSize(f1Parent);
      final f2Size = tester.getSize(f2Parent);

      // Total gap is 10. Remaining width is 490.
      // F1 should have 2/5 * 490 = 196.
      // F2 should have 3/5 * 490 = 294.
      expect(f1Size.width, moreOrLessEquals(196.0, epsilon: 0.01));
      expect(f2Size.width, moreOrLessEquals(294.0, epsilon: 0.01));
    });

    testWidgets('respects between alignment', (tester) async {
      final rowComponent = ComponentRow(
        id: 'row_2',
        xAlign: 'between',
        yAlign: 'top',
        horizontalGap: 0,
        widthMode: ComponentSizeMode.fill,
        children: [
          ComponentButton(
            id: 'b1',
            text: 'B1',
            color: '#2196F3',
            widthMode: ComponentSizeMode.fixed,
            width: 100,
          ),
          ComponentButton(
            id: 'b2',
            text: 'B2',
            color: '#2196F3',
            widthMode: ComponentSizeMode.fixed,
            width: 100,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 500,
                child: rowComponent.toWidget({}),
              ),
            ),
          ),
        ),
      );

      final b1Finder = find.text('B1');
      final b2Finder = find.text('B2');

      // Find the SizedBox/Container that has the 100 width
      final b1Widget = find.ancestor(of: b1Finder, matching: find.byType(SizedBox)).first;
      final b2Widget = find.ancestor(of: b2Finder, matching: find.byType(SizedBox)).first;

      final b1Pos = tester.getTopLeft(b1Widget);
      final b2Pos = tester.getTopLeft(b2Widget);

      // It's centered in a Scaffold, but let's check relative position
      // Row starts at 500 centered. Screen width default is 800.
      // Left edge of 500 wide box in 800 screen is (800-500)/2 = 150.
      expect(b1Pos.dx, 150.0);
      // 150 + 400 (distance between starts) = 550.
      expect(b2Pos.dx, 550.0);
    });  
  });
}
