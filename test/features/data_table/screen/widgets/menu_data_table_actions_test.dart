import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/menu_data_table_actions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class MockEntityCustom extends Mock implements EntityCustom {}

void main() {
  setUpAll(() {
    registerFallbackValue(Filter(reference: '', value: ''));
  });

  testWidgets('MenuDataTableActions filters home actions based on rules',
      (WidgetTester tester) async {
    final entity = MockEntityCustom();

    // Create an action with no rule, should be visible
    final action1 = ActionD(
      id: 'action1',
      name: 'Action 1',
      type: ActionType.toast,
      isMultiple: false,
      onSuccess: 'toast',
      onFailure: 'toast',
    );

    // Create an action with a rule that checks for status = 'approved'
    final action2 = ActionD(
      id: 'action2',
      name: 'Action 2',
      type: ActionType.toast,
      isMultiple: false,
      onSuccess: 'toast',
      onFailure: 'toast',
      rule: Rule(
        all: [
          Condition(field: 'status', op: '=', value: 'approved'),
        ],
      ),
    );

    when(() => entity.actionsHome).thenReturn([action1, action2]);
    when(() => entity.exports).thenReturn([]);
    when(() => entity.fields).thenReturn([]);
    when(() => entity.filters).thenReturn([]);
    when(() => entity.layoutForm)
        .thenReturn([LayoutForm(id: 'main', label: 'Main', components: [])]);
    when(() => entity.bypassAllPermissions).thenReturn(false);

    // Case 1: parentData has status = 'pending'
    // Expected: Only action1 is visible
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MenuDataTableActions(
          entity: entity,
          parentData: const [
            {'status': 'pending'}
          ],
          embedded: false,
          bypassPermission: true,
          filters: const [],
          refreshButton: const SizedBox(),
          onFilterChanged: (_) {},
          onRefresh: () {},
        ),
      ),
    ));

    expect(find.text('Action 1'), findsOneWidget);
    expect(find.text('Action 2'), findsNothing);

    // Case 2: parentData has status = 'approved'
    // Expected: Both action1 and action2 are visible
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MenuDataTableActions(
          entity: entity,
          parentData: const [
            {'status': 'approved'}
          ],
          embedded: false,
          bypassPermission: true,
          filters: const [],
          refreshButton: const SizedBox(),
          onFilterChanged: (_) {},
          onRefresh: () {},
        ),
      ),
    ));

    expect(find.text('Action 1'), findsOneWidget);
    expect(find.text('Action 2'), findsOneWidget);

    // Case 3: filters contain status = 'approved'
    // Expected: Both action1 and action2 are visible
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MenuDataTableActions(
          entity: entity,
          parentData: const [], // empty parent data
          embedded: false,
          bypassPermission: true,
          filters: [Filter(reference: 'status', value: 'approved')],
          refreshButton: const SizedBox(),
          onFilterChanged: (_) {},
          onRefresh: () {},
        ),
      ),
    ));

    expect(find.text('Action 1'), findsOneWidget);
    expect(find.text('Action 2'), findsOneWidget);
  });
}
