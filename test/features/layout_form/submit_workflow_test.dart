import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/submit_workflow.dart';

void main() {
  group('SubmitWorkflow Parsing Tests', () {
    test('should parse basic SubmitWorkflow correctly', () {
      final json = {
        'lock_ui_while_submitting': false,
        'submit_label': 'Proceed',
        'show_submit_button': true,
        'actions': [
          {'type': 'validate', 'scope': 'current_step'}
        ],
        'on_success': [
          {'type': 'toast', 'message': 'Success!', 'variant': 'success'}
        ],
        'on_error': [
          {'type': 'toast', 'message': 'Failed!', 'variant': 'error'}
        ],
      };

      final workflow = SubmitWorkflow.fromMap(json);

      expect(workflow.lockUiWhileSubmitting, isFalse);
      expect(workflow.submitLabel, 'Proceed');
      expect(workflow.showSubmitButton, isTrue);
      expect(workflow.actions, hasLength(1));
      expect(workflow.actions[0], isA<ValidateAction>());
      expect((workflow.actions[0] as ValidateAction).scope, 'current_step');

      expect(workflow.onSuccess, hasLength(1));
      expect(workflow.onSuccess[0], isA<ToastAction>());
      expect((workflow.onSuccess[0] as ToastAction).message, 'Success!');

      expect(workflow.onError, hasLength(1));
      expect(workflow.onError[0], isA<ToastAction>());
      expect((workflow.onError[0] as ToastAction).message, 'Failed!');
    });

    test('should parse HttpAction correctly', () {
      final json = {
        'actions': [
          {
            'type': 'http',
            'name': 'fetchData',
            'save_result_to': 'result',
            'http': {
              'method': 'POST',
              'url': 'https://api.example.com',
              'headers': {'Authorization': 'Bearer 123'},
              'body': {'id': 1},
              'use_form_data': true,
              'mock_enabled': true,
              'mock_data': {'status': 'ok'}
            },
            'retry': {'max': 3, 'delay_ms': 1000}
          }
        ]
      };

      final workflow = SubmitWorkflow.fromMap(json);
      final action = workflow.actions[0] as HttpAction;

      expect(action.name, 'fetchData');
      expect(action.saveResultTo, 'result');
      expect(action.http.method, 'POST');
      expect(action.http.url, 'https://api.example.com');
      expect(action.http.headers['Authorization'], 'Bearer 123');
      expect(action.http.body['id'], 1);
      expect(action.http.useFormData, isTrue);
      expect(action.http.mockEnabled, isTrue);
      expect((action.http.mockData as Map)['status'], 'ok');
      expect(action.retry?.max, 3);
      expect(action.retry?.delayMs, 1000);
    });

    test('should parse ConditionAction with nested actions correctly', () {
      final json = {
        'actions': [
          {
            'type': 'condition',
            'if': 'status == 200',
            'then_actions': [
              {'type': 'refresh', 'target': 'list'}
            ],
            'else_actions': [
              {'type': 'stop_workflow'}
            ]
          }
        ]
      };

      final workflow = SubmitWorkflow.fromMap(json);
      final action = workflow.actions[0] as ConditionAction;

      expect(action.condition, 'status == 200');
      expect(action.thenActions, hasLength(1));
      expect(action.thenActions[0], isA<RefreshAction>());
      expect((action.thenActions[0] as RefreshAction).target, 'list');

      expect(action.elseActions, hasLength(1));
      expect(action.elseActions[0], isA<StopWorkflowAction>());
    });

    test('should parse LoopAction with nested actions correctly', () {
      final json = {
        'actions': [
          {
            'type': 'loop',
            'items': '{{ form.list }}',
            'item_var': 'item',
            'index_var': 'i',
            'actions': [
              {'type': 'set_var', 'key': 'temp', 'value': '{{ item.id }}'}
            ]
          }
        ]
      };

      final workflow = SubmitWorkflow.fromMap(json);
      final action = workflow.actions[0] as LoopAction;

      expect(action.items, '{{ form.list }}');
      expect(action.itemVar, 'item');
      expect(action.indexVar, 'i');
      expect(action.actions, hasLength(1));
      expect(action.actions[0], isA<SetVarAction>());
    });

    test('should parse TryCatchAction correctly', () {
      final json = {
        'actions': [
          {
            'type': 'try_catch',
            'try_actions': [
              {
                'type': 'http',
                'name': 'req',
                'http': {
                  'method': 'GET',
                  'url': 'api.com',
                  'headers': {},
                  'body': {}
                }
              }
            ],
            'catch_actions': [
              {'type': 'append_var', 'key': 'errors', 'value': 'caught'}
            ]
          }
        ]
      };

      final workflow = SubmitWorkflow.fromMap(json);
      final action = workflow.actions[0] as TryCatchAction;

      expect(action.tryActions, hasLength(1));
      expect(action.tryActions[0], isA<HttpAction>());
      expect(action.catchActions, hasLength(1));
      expect(action.catchActions[0], isA<AppendVarAction>());
    });

    test('should parse Miscellaneous actions correctly', () {
      final json = {
        'actions': [
          {'type': 'close_modal'},
          {'type': 'stop_workflow'}
        ]
      };

      final workflow = SubmitWorkflow.fromMap(json);

      expect(workflow.actions[0], isA<CloseModalAction>());
      expect(workflow.actions[1], isA<StopWorkflowAction>());
    });

    test('toMap() should be consistent with fromMap() (Roundtrip)', () {
      final originalMap = {
        'type': 'workflow',
        'lock_ui_while_submitting': true,
        'submit_label': 'Send',
        'show_submit_button': false,
        'actions': [
          {'type': 'validate', 'scope': 'all'}
        ],
        'on_success': [
          {'type': 'close_modal'}
        ],
        'on_error': [
          {'type': 'toast', 'variant': 'error', 'message': 'Oops'}
        ],
      };

      final workflow = SubmitWorkflow.fromMap(originalMap);
      final roundtripMap = workflow.toMap();

      expect(roundtripMap['lock_ui_while_submitting'],
          originalMap['lock_ui_while_submitting']);
      expect(roundtripMap['submit_label'], originalMap['submit_label']);
      expect(roundtripMap['show_submit_button'],
          originalMap['show_submit_button']);
      expect(roundtripMap['actions'], hasLength(1));
      expect(roundtripMap['on_success'], hasLength(1));
      expect(roundtripMap['on_error'], hasLength(1));
      expect(roundtripMap['actions'][0]['type'], 'validate');
    });

    test('fromJson() and toJson() should work with strings', () {
      const jsonString =
          '{"type":"workflow","lock_ui_while_submitting":true,"actions":[{"type":"validate","scope":"all"}]}';

      final workflow = SubmitWorkflow.fromJson(jsonString);
      expect(workflow.lockUiWhileSubmitting, isTrue);
      expect(workflow.actions, hasLength(1));

      final output = workflow.toJson();
      expect(output, contains('"type":"workflow"'));
      expect(output, contains('"lock_ui_while_submitting":true'));
    });

    test('should throw Exception for unknown action type', () {
      final json = {
        'actions': [
          {'type': 'invalid_action_type'}
        ]
      };

      expect(() => SubmitWorkflow.fromMap(json), throwsFormatException);
    });
  });
}
