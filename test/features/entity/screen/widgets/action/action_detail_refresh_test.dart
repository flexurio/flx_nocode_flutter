import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/pages/enitity_view_page.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_execution_extension.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_handler_extension.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/src/app/model/backend.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

class _FakeHttpRequestExecutor implements HttpRequestExecutor {
  _FakeHttpRequestExecutor(this.handler);

  final Future<HttpRequestResult> Function(HttpRequestConfig config) handler;
  final List<HttpRequestConfig> requests = [];

  @override
  Future<HttpRequestResult> execute(HttpRequestConfig config) async {
    requests.add(config);
    return handler(config);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
    UserRepositoryAppNocode.instance = UserRepositoryAppNocode();
    UserRepositoryAppNocode.instance.token = 'test_token';
  });

  tearDown(() {
    Get.reset();
  });

  group('Detail & Table Refresh Behavior', () {
    testWidgets(
        'ActionType.refresh reloads CreatePageController from backend.read and updates initialData & formVersion',
        (tester) async {
      const layoutId = 'detail_page';
      var fetchCount = 0;

      final fakeExecutor = _FakeHttpRequestExecutor((config) async {
        fetchCount++;
        return HttpRequestResult.success(
          statusCode: 200,
          data: {
            'data': {
              'id': 'CC-001',
              'status': 'APPROVE QA SPV',
              'is_review_gm': 0,
            },
          },
        );
      });

      final form = LayoutForm.fromMap({
        'id': layoutId,
        'label': 'Detail',
        'components': [
          {
            'id': 'status',
            'type': 'text_field',
            'label': 'Status',
            'initialValue': '{{data.status}}',
          },
        ],
      });

      final entity = EntityCustom.empty().copyWith(
        id: 'change_controls',
        layoutForm: [form],
        backend: Backend(
          others: const [],
          read: BackendEndpoint(
            method: 'GET',
            url: 'https://example.com/cc_change_control_headers/{id}',
          ),
        ),
      );

      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {
            'id': 'CC-001',
            'status': 'INPUT',
            'is_review_gm': 1,
          },
          parentData: const [],
          httpRequestExecutor: fakeExecutor,
        ),
        tag: 'create_page_$layoutId',
      );

      var subTableReloaded = false;
      controller.tableReloadListeners['notes_table'] = () {
        subTableReloaded = true;
      };

      final action = ActionD(
        id: 'confirm_gm',
        type: ActionType.workflow,
        name: 'Confirm GM',
        isMultiple: false,
        onSuccess: const ['refresh'],
        onFailure: const ['toast'],
      );

      final beforeVersion = controller.formVersion.value;

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  await action.handleOnSuccessSingle(
                    entity: entity,
                    context: context,
                    responseData: null,
                    data: {'layoutFormId': layoutId},
                  );
                },
                child: const Text('Refresh Detail'),
              ),
            ),
          ),
        ),
      );

      await tester.runAsync(() async {
        await tester.tap(find.text('Refresh Detail'));
        await tester.pump();
      });

      expect(fetchCount, 1);
      expect(fakeExecutor.requests.single.url,
          'https://example.com/cc_change_control_headers/CC-001');
      expect(controller.initialData['status'], 'APPROVE QA SPV');
      expect(controller.initialData['is_review_gm'], 0);
      expect(controller.controllers['status']?.text, 'APPROVE QA SPV');
      expect(subTableReloaded, isTrue);
      expect(controller.formVersion.value, beforeVersion + 1);
    });

    testWidgets(
        'executeAndRefreshOnClose calls onRefresh when open_page closes without form submit callback',
        (tester) async {
      final form = LayoutForm.fromMap({
        'id': 'detail_page',
        'label': 'Detail',
        'show_submit_button': false,
        'components': [
          {'id': 'note', 'type': 'text', 'value': 'Detail View'},
        ],
      });

      final entity = EntityCustom.empty().copyWith(
        id: 'review_qas',
        layoutForm: [form],
      );

      final action = ActionD(
        id: 'view_detail',
        type: ActionType.openPage,
        name: 'View',
        layoutFormId: 'detail_page',
        showSubmitButton: false,
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
      );

      var refreshCalls = 0;

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () async {
                  await action.executeAndRefreshOnClose(
                    entity: entity,
                    context: context,
                    data: {'id': jsonEncode('CC-1')},
                    parentData: const [],
                    onRefresh: () {
                      refreshCalls++;
                    },
                  );
                },
                child: const Text('Open Detail'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Detail'));
      await tester.pumpAndSettle();

      // Still inside detail page — parent table refresh should not have fired yet.
      expect(refreshCalls, 0);

      // Simulate pressing Back / navigate_back from detail page.
      Get.back();
      await tester.pumpAndSettle();

      expect(refreshCalls, 1);
    });

    testWidgets(
        'reloadData ignores re-entrant calls while an in-flight reload is still running',
        (tester) async {
      const layoutId = 'detail_page';
      var fetchCount = 0;
      final firstResponse = Completer<HttpRequestResult>();

      final fakeExecutor = _FakeHttpRequestExecutor((config) {
        fetchCount++;
        return firstResponse.future;
      });

      final form = LayoutForm.fromMap({
        'id': layoutId,
        'label': 'Detail',
        'components': [
          {'id': 'status', 'type': 'text_field', 'label': 'Status'},
        ],
      });

      final entity = EntityCustom.empty().copyWith(
        id: 'change_controls',
        layoutForm: [form],
        backend: Backend(
          others: const [],
          read: BackendEndpoint(
            method: 'GET',
            url: 'https://example.com/headers/{id}',
          ),
        ),
      );

      final controller = Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: layoutId,
          initialDataInput: {'id': 'CC-001', 'status': 'INPUT'},
          parentData: const [],
          httpRequestExecutor: fakeExecutor,
        ),
        tag: 'create_page_$layoutId',
      );

      await tester.runAsync(() async {
        final first = controller.reloadData();
        final second = controller.reloadData();
        firstResponse.complete(
          HttpRequestResult.success(
            statusCode: 200,
            data: {'id': 'CC-001', 'status': 'APPROVED'},
          ),
        );
        await Future.wait([first, second]);
      });

      expect(fetchCount, 1);
      expect(controller.initialData['status'], 'APPROVED');
    });

    testWidgets(
        'EntityViewPage injects entity and layoutFormId so actions inside view page resolve controller tag',
        (tester) async {
      const viewLayoutId = 'detail_page';
      var reloaded = false;

      final fakeExecutor = _FakeHttpRequestExecutor((config) async {
        reloaded = true;
        return HttpRequestResult.success(
          statusCode: 200,
          data: {'id': 'CC-001', 'status': 'UPDATED'},
        );
      });

      final viewForm = LayoutForm.fromMap({
        'id': viewLayoutId,
        'label': 'Detail',
        'components': [
          {
            'id': 'btn_refresh',
            'type': 'button',
            'text': 'Reload',
            'color': '#2196F3',
            'on_click': {
              'id': 'refresh_act',
              'type': 'set_variable',
              'name': 'Refresh',
              'target_variable': 'status',
              'value': 'LOCAL_UPDATED',
              'on_success': ['refresh'],
            },
          },
        ],
      });

      final entity = EntityCustom.empty().copyWith(
        id: 'change_controls',
        layoutForm: [viewForm],
        backend: Backend(
          others: const [],
          read: BackendEndpoint(
            method: 'GET',
            url: 'https://example.com/headers/{id}',
          ),
        ),
      );

      Get.put(
        CreatePageController(
          entity: entity,
          layoutFormId: viewLayoutId,
          initialDataInput: {'id': 'CC-001', 'status': 'INITIAL'},
          parentData: const [],
          httpRequestExecutor: fakeExecutor,
        ),
        tag: 'create_page_$viewLayoutId',
      );

      await tester.pumpWidget(
        GetMaterialApp(
          home: EntityViewPage.prepare(
            entity: entity,
            data: {'id': 'CC-001', 'status': 'INITIAL'},
            embedded: true,
            dummy: true,
            parentData: const [],
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.runAsync(() async {
        await tester.tap(find.text('Reload'));
        await tester.pump();
      });

      expect(reloaded, isTrue);
    });
  });
}
