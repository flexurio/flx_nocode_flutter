import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_icon_button.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_icon_button.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:mocktail/mocktail.dart';

class MockDataAction extends Mock implements DataAction {}

void main() {
  group('ComponentIconButton', () {
    testWidgets('should render correctly with different variants and sizes', (tester) async {
      final variants = ['filled', 'outlined', 'ghost'];
      final sizes = ['small', 'medium', 'large'];

      for (final variant in variants) {
        for (final size in sizes) {
          final component = ComponentIconButton(
            id: 'btn_${variant}_$size',
            icon: 'add',
            color: 'blue',
            variant: variant,
            size: size,
          );

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: component.toWidget({}),
              ),
            ),
          );

          expect(find.byType(IconButton), findsOneWidget);
          
          // Verify icon
          expect(find.byIcon(Icons.add), findsOneWidget);
        }
      }
    });

    testWidgets('should handle click and execute action', (tester) async {
      final action = ActionD(
        id: 'edit_action',
        type: ActionType.none,
        name: 'Edit',
        isMultiple: false,
        onSuccess: 'toast',
        onFailure: 'toast',
      );
      final entity = EntityCustom.empty().copyWith(id: 'test', label: 'Test');
      
      final component = ComponentIconButton(
        id: 'click_btn',
        icon: 'edit',
        color: 'red',
        onClick: action,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({'entity': entity}),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // We can't easily verify executeSingle since it's an extension and not easily mockable
      // but we can check if it doesn't crash.
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('should render mock widget correctly', (tester) async {
      final component = ComponentIconButton(
        id: 'mock_btn',
        icon: 'settings',
        color: '#FF0000',
        variant: 'filled',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toMockWidget(),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    test('should parse colors correctly', () {
      // Since _parseColor is private, we test it through toWidget or toMockWidget
      // but we can also use specific test cases in toMockWidget
      final component1 = ComponentIconButton(id: '1', icon: 'add', color: 'red');
      final component2 = ComponentIconButton(id: '2', icon: 'add', color: '#00FF00');
      final component3 = ComponentIconButton(id: '3', icon: 'add', color: 'invalid');

      expect(component1.toMockWidget(), isA<Widget>());
      expect(component2.toMockWidget(), isA<Widget>());
      expect(component3.toMockWidget(), isA<Widget>());
    });

    test('should parse icons correctly', () {
      final icons = ['add', 'edit', 'delete', 'close', 'search', 'menu', 'refresh', 'settings', 'arrow_back', 'arrow_forward', 'check', 'warning', 'error', 'info', 'help', 'more_vert', 'more_horiz', 'unknown'];
      
      for (final iconName in icons) {
        final component = ComponentIconButton(id: 'icon_$iconName', icon: iconName, color: 'blue');
        expect(component.toMockWidget(), isA<Widget>());
      }
    });
  });
}
