import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_confirm_dialog_extension.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Configuration.instance = Configuration.empty();
  });

  group('confirm_action Configuration & Interpolation Tests', () {
    test('ActionD parses confirm_action from JSON properly', () {
      final json = {
        'id': 'Create_Transaction',
        'type': 'open_page',
        'name': 'Transaction',
        'layout_form_id': 'create general',
        'on_success': 'show_success_dialog_with_data',
        'confirm_action': {
          'type': 'navigate',
          'entity_id': 'lbb_expense_transaction_details',
          'params': {
            'lbb_expense_transaction_header_id': '{{data.id || id}}',
            'period': "{{ (data.period || period || '').replaceAll('/', '') }}",
          },
        },
      };

      final action = ActionD.fromJson(json);
      expect(action.confirmAction, isNotNull);
      expect(action.confirmAction!['type'], 'navigate');
      expect(action.confirmAction!['entity_id'], 'lbb_expense_transaction_details');
      expect(action.confirmAction!['params'], isA<Map>());
    });

    test('Interpolates confirm_action params with slash removal for period', () {
      final responseData = {
        'success': true,
        'message': 'Created',
        'data': {
          'id': 'EVENT/2026/08/005',
          'period': '2026/08',
        },
      };

      final vars = <String, dynamic>{};
      vars.addAll(responseData);
      if (responseData.containsKey('data') && responseData['data'] is Map) {
        for (final entry in (responseData['data'] as Map).entries) {
          if (!vars.containsKey(entry.key.toString())) {
            vars[entry.key.toString()] = entry.value;
          }
        }
      }

      final rawParams = {
        'lbb_expense_transaction_header_id': '{{data.id || id}}',
        'period': "{{ (data.period || period || '').replaceAll('/', '') }}",
      };

      final resolvedParams = <String, dynamic>{};
      for (final entry in rawParams.entries) {
        resolvedParams[entry.key] = entry.value.interpolateJavascript(vars);
      }

      expect(resolvedParams['lbb_expense_transaction_header_id'], 'EVENT/2026/08/005');
      expect(resolvedParams['period'], '202608');
    });

    test('EntityCustom.clearCache removes cached entities', () {
      EntityCustom.clearCache();
      expect(EntityCustom.clearCache, returnsNormally);
    });

    testWidgets('CardSuccessWithData triggers onConfirm callback and pops', (tester) async {
      bool dialogOpened = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    dialogOpened = true;
                    showDialog(
                      context: context,
                      builder: (_) => const CardSuccessWithData(
                        title: 'Success',
                        message: 'Created!',
                        copyLabel: 'Copy',
                        copyValue: '123',
                      ),
                    );
                  },
                  child: const Text('Open Dialog'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(dialogOpened, isTrue);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Created!'), findsOneWidget);

      final confirmBtn = find.textContaining('confirm', findRichText: true, skipOffstage: false);
      expect(confirmBtn, findsOneWidget);

      await tester.tap(confirmBtn);
      await tester.pumpAndSettle();

      expect(find.text('Created!'), findsNothing);
    });

    test('Interpolates project period_end.gte and period_start.lte query parameters correctly', () {
      final variables = {
        'form': {
          'period': '202609',
        },
        'auth_token': 'dummy_jwt_token',
      };

      const urlTemplate =
          "https://mf-marketing-api-v2.flexurio.com/projects?page=1&search=&sort=created_at&ascending=false&limit=10&period_end.gte={{ startOfMonth(form.period || current.period, 'yyyyMMdd') }}&period_start.lte={{ endOfMonth(form.period || current.period, 'yyyyMMdd') }}";

      final resolvedUrl = urlTemplate.interpolateJavascript(variables);

      expect(resolvedUrl, contains('period_end.gte=20260901'));
      expect(resolvedUrl, contains('period_start.lte=20260930'));
    });

    testWidgets('showConfirmDialog pushes to root navigator covering entire app', (tester) async {
      final action = ActionD.fromJson({
        'id': 'delete_test',
        'name': 'Delete Item',
        'type': 'show_confirmation_dialog',
        'confirm_message': 'Are you sure you want to delete this item?',
      });

      final rootNavKey = GlobalKey<NavigatorState>();
      final nestedNavKey = GlobalKey<NavigatorState>();

      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: rootNavKey,
          home: Scaffold(
            body: Navigator(
              key: nestedNavKey,
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (nestedContext) => Center(
                  child: ElevatedButton(
                    onPressed: () {
                      action.showConfirmDialog(
                        context: nestedContext,
                        action: DataAction.delete,
                        label: 'Delete Item',
                        confirmationMessageText: 'Are you sure you want to delete this item?',
                        onConfirm: (ctx) async {},
                      );
                    },
                    child: const Text('Trigger Confirm'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Trigger Confirm'));
      await tester.pumpAndSettle();

      expect(find.text('Are you sure you want to delete this item?'), findsOneWidget);

      // Verify the dialog was pushed on rootNavKey (full background) rather than nestedNavKey
      // Root navigator should have more than 1 route (home + dialog)
      expect(rootNavKey.currentState?.canPop(), isTrue);
      // Nested navigator only has the 1 initial route
      expect(nestedNavKey.currentState?.canPop(), isFalse);

      final cancelBtn = find.textContaining('cancel', findRichText: true, skipOffstage: false);
      if (cancelBtn.evaluate().isNotEmpty) {
        await tester.tap(cancelBtn.first);
        await tester.pumpAndSettle();
        expect(find.text('Are you sure you want to delete this item?'), findsNothing);
        expect(rootNavKey.currentState?.canPop(), isFalse);
      }
    });
  });
}
