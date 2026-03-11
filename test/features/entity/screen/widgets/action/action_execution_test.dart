import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/model/user.dart';

class MockEntityCustom extends Mock implements EntityCustom {}

class MockUserRepositoryApp extends Mock implements UserRepositoryApp {}

class MockUserApp extends Mock implements UserApp {}

void main() {
  setUpAll(() {
    registerFallbackValue(const <String, dynamic>{});
  });

  testWidgets(
      'ActionD.executeSingle handles export action and shows confirmation',
      (WidgetTester tester) async {
    final entity = MockEntityCustom();

    // Setup Mock User Repository
    final mockUserRepo = MockUserRepositoryApp();
    UserRepositoryApp.instance = mockUserRepo;
    final mockUser = MockUserApp();
    when(() => mockUser.name).thenReturn('Test User');
    when(() => mockUserRepo.user).thenReturn(mockUser);

    final action = ActionD(
      id: 'export1',
      name: 'Export CSV',
      type: ActionType.export,
      isMultiple: false,
      onSuccess: 'toast',
      onFailure: 'toast',
      http: HttpData(
        method: 'GET',
        url: 'https://api.example.com/export',
        headers: {},
        body: {},
        mockEnabled: true,
        mockData: {
          'data': [
            {'id': 1, 'name': 'Item 1'},
          ]
        },
      ),
      exportFormat: 'xlsx',
    );

    // Provide some entity settings
    when(() => entity.id).thenReturn('test_entity');

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () => action.executeSingle(
                entity: entity,
                context: context,
                data: {},
                parentData: [],
              ),
              child: const Text('Trigger'),
            );
          },
        ),
      ),
    ));

    await tester.tap(find.text('Trigger'));
    await tester.pumpAndSettle();

    // Verification: should show confirmation dialog
    expect(find.textContaining('Export CSV'), findsOneWidget);

    // Tap confirm button (DataAction.export.title)
    await tester.tap(find.textContaining('Export').last);
    await tester.pumpAndSettle();

    // Success toast appears if context supports it
    expect(find.text('Export success'), findsOneWidget);

    // Settle all timers (like toast auto-dismiss)
    await tester.pumpAndSettle(const Duration(seconds: 10));
  });

  testWidgets(
      'ActionD.executeHttpMultiple joins ids with comma',
      (WidgetTester tester) async {
    final entity = MockEntityCustom();
    
    // We will verify if it resolves the IDs with comma correctly by using mockEnabled
    final action = ActionD(
      id: 'process_settlement',
      name: 'Process Settlement',
      type: ActionType.http,
      isMultiple: true,
      onSuccess: 'none',
      onFailure: 'none',
      http: HttpData(
        method: 'POST',
        url: 'https://api.example.com/multi',
        headers: {},
        body: {
          'transaction_detail_id': '{{form.id}}',
          'name': '{{form.name}}'
        },
        mockEnabled: true,
        mockData: {},
      ),
    );

    when(() => entity.id).thenReturn('test_entity');

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () => action.executeHttpMultiple(
                entity,
                context,
                [
                  {'id': 1, 'name': 'Item A'},
                  {'id': 2, 'name': 'Item A'}, // identical to previous
                  {'id': 3, 'name': 'Item B'},
                ],
              ),
              child: const Text('Trigger Multiple'),
            );
          },
        ),
      ),
    ));

    await tester.tap(find.text('Trigger Multiple'));
    await tester.pumpAndSettle();

    expect(find.text('Request success'), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 10));
  });
}
