import 'dart:convert';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';

/// Represents a sequence of actions to be executed upon form submission.
class SubmitWorkflow {
  final bool lockUiWhileSubmitting;
  final String? submitLabel;
  final bool? showSubmitButton;
  final List<WorkflowAction> actions;
  final List<WorkflowAction> onSuccess;
  final List<WorkflowAction> onError;

  SubmitWorkflow({
    this.lockUiWhileSubmitting = true,
    this.submitLabel,
    this.showSubmitButton,
    required this.actions,
    this.onSuccess = const [],
    this.onError = const [],
  });

  factory SubmitWorkflow.fromMap(Map<String, dynamic> map) {
    return SubmitWorkflow(
      lockUiWhileSubmitting: map['lock_ui_while_submitting'] ??
          map['lockUIWhileSubmitting'] ??
          true,
      submitLabel:
          map['submit_label']?.toString() ?? map['submitLabel']?.toString(),
      showSubmitButton: map['show_submit_button'] ?? map['showSubmitButton'],
      actions: _parseActions(map['actions']),
      onSuccess: _parseActions(map['on_success'] ?? map['onSuccess']),
      onError: _parseActions(map['on_error'] ?? map['onError']),
    );
  }

  factory SubmitWorkflow.fromJson(String source) =>
      SubmitWorkflow.fromMap(json.decode(source));

  static List<WorkflowAction> _parseActions(dynamic raw) {
    if (raw is! List) return const [];
    return raw
        .map((e) => WorkflowAction.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'type': 'workflow',
      'lock_ui_while_submitting': lockUiWhileSubmitting,
      if (submitLabel != null) 'submit_label': submitLabel,
      if (showSubmitButton != null) 'show_submit_button': showSubmitButton,
      'actions': actions.map((e) => e.toMap()).toList(),
      if (onSuccess.isNotEmpty)
        'on_success': onSuccess.map((e) => e.toMap()).toList(),
      if (onError.isNotEmpty)
        'on_error': onError.map((e) => e.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

/// Abstract base for all workflow actions.
abstract class WorkflowAction {
  final String type;

  WorkflowAction(this.type);

  factory WorkflowAction.fromMap(Map<String, dynamic> map) {
    final type = map['type']?.toString();
    switch (type) {
      case 'validate':
        return ValidateAction.fromMap(map);
      case 'http':
        return HttpAction.fromMap(map);
      case 'set_var':
        return SetVarAction.fromMap(map);
      case 'append_var':
        return AppendVarAction.fromMap(map);
      case 'toast':
        return ToastAction.fromMap(map);
      case 'close_modal':
        return CloseModalAction();
      case 'refresh':
        return RefreshAction.fromMap(map);
      case 'condition':
        return ConditionAction.fromMap(map);
      case 'loop':
        return LoopAction.fromMap(map);
      case 'try_catch':
        return TryCatchAction.fromMap(map);
      case 'stop_workflow':
        return StopWorkflowAction();
      default:
        throw FormatException('Unknown workflow action type: $type');
    }
  }

  Map<String, dynamic> toMap();
}

/// Validates form data.
class ValidateAction extends WorkflowAction {
  final String scope; // "all" | "current_step"

  ValidateAction({this.scope = 'all'}) : super('validate');

  factory ValidateAction.fromMap(Map<String, dynamic> map) =>
      ValidateAction(scope: map['scope'] ?? 'all');

  @override
  Map<String, dynamic> toMap() => {'type': 'validate', 'scope': scope};
}

/// Performs an HTTP request.
class HttpAction extends WorkflowAction {
  final String name;
  final HttpData http;
  final WorkflowRetryPolicy? retry;
  final String? saveResultTo;

  HttpAction({
    required this.name,
    required this.http,
    this.retry,
    this.saveResultTo,
  }) : super('http');

  factory HttpAction.fromMap(Map<String, dynamic> map) {
    return HttpAction(
      name: map['name'] ?? '',
      http: HttpData.fromJson(Map<String, dynamic>.from(map['http'])),
      retry: map['retry'] != null
          ? WorkflowRetryPolicy.fromMap(Map<String, dynamic>.from(map['retry']))
          : null,
      saveResultTo: map['save_result_to'] ?? map['saveResultTo'],
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'http',
        'name': name,
        'http': http.toJson(),
        if (retry != null) 'retry': retry!.toMap(),
        if (saveResultTo != null) 'save_result_to': saveResultTo,
      };
}

/// Sets a variable in the workflow context.
class SetVarAction extends WorkflowAction {
  final String key;
  final dynamic value;

  SetVarAction({required this.key, required this.value}) : super('set_var');

  factory SetVarAction.fromMap(Map<String, dynamic> map) =>
      SetVarAction(key: map['key'], value: map['value']);

  @override
  Map<String, dynamic> toMap() =>
      {'type': 'set_var', 'key': key, 'value': value};
}

/// Appends a value to a list variable.
class AppendVarAction extends WorkflowAction {
  final String key;
  final dynamic value;

  AppendVarAction({required this.key, required this.value})
      : super('append_var');

  factory AppendVarAction.fromMap(Map<String, dynamic> map) =>
      AppendVarAction(key: map['key'], value: map['value']);

  @override
  Map<String, dynamic> toMap() =>
      {'type': 'append_var', 'key': key, 'value': value};
}

/// Shows a notification message.
class ToastAction extends WorkflowAction {
  final String variant; // "success" | "error" | "info" | "warning"
  final String message;

  ToastAction({this.variant = 'info', required this.message}) : super('toast');

  factory ToastAction.fromMap(Map<String, dynamic> map) => ToastAction(
      variant: map['variant'] ?? 'info', message: map['message'] ?? '');

  @override
  Map<String, dynamic> toMap() =>
      {'type': 'toast', 'variant': variant, 'message': message};
}

/// Closes the current modal or form page.
class CloseModalAction extends WorkflowAction {
  CloseModalAction() : super('close_modal');

  @override
  Map<String, dynamic> toMap() => {'type': 'close_modal'};
}

/// Refreshes a target component or list.
class RefreshAction extends WorkflowAction {
  final String target;

  RefreshAction({required this.target}) : super('refresh');

  factory RefreshAction.fromMap(Map<String, dynamic> map) =>
      RefreshAction(target: map['target'] ?? '');

  @override
  Map<String, dynamic> toMap() => {'type': 'refresh', 'target': target};
}

/// Conditional branching logic.
class ConditionAction extends WorkflowAction {
  final String condition; // "if" expression
  final List<WorkflowAction> thenActions;
  final List<WorkflowAction> elseActions;

  ConditionAction({
    required this.condition,
    required this.thenActions,
    this.elseActions = const [],
  }) : super('condition');

  factory ConditionAction.fromMap(Map<String, dynamic> map) {
    return ConditionAction(
      condition: map['if'] ?? '',
      thenActions:
          SubmitWorkflow._parseActions(map['then_actions'] ?? map['then']),
      elseActions:
          SubmitWorkflow._parseActions(map['else_actions'] ?? map['else']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'condition',
        'if': condition,
        'then_actions': thenActions.map((e) => e.toMap()).toList(),
        if (elseActions.isNotEmpty)
          'else_actions': elseActions.map((e) => e.toMap()).toList(),
      };
}

/// Iterates over a list of items.
class LoopAction extends WorkflowAction {
  final dynamic items; // Path to items, e.g. "{{ form.items }}"
  final String itemVar;
  final String? indexVar;
  final List<WorkflowAction> actions;

  LoopAction({
    required this.items,
    this.itemVar = 'item',
    this.indexVar,
    required this.actions,
  }) : super('loop');

  factory LoopAction.fromMap(Map<String, dynamic> map) {
    return LoopAction(
      items: map['items'],
      itemVar: map['item_var'] ?? map['itemVar'] ?? 'item',
      indexVar: map['index_var'] ?? map['indexVar'],
      actions: SubmitWorkflow._parseActions(map['actions']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'loop',
        'items': items,
        'item_var': itemVar,
        if (indexVar != null) 'index_var': indexVar,
        'actions': actions.map((e) => e.toMap()).toList(),
      };
}

/// Error handling block.
class TryCatchAction extends WorkflowAction {
  final List<WorkflowAction> tryActions;
  final List<WorkflowAction> catchActions;

  TryCatchAction({required this.tryActions, required this.catchActions})
      : super('try_catch');

  factory TryCatchAction.fromMap(Map<String, dynamic> map) {
    return TryCatchAction(
      tryActions:
          SubmitWorkflow._parseActions(map['try_actions'] ?? map['try']),
      catchActions:
          SubmitWorkflow._parseActions(map['catch_actions'] ?? map['catch']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'try_catch',
        'try_actions': tryActions.map((e) => e.toMap()).toList(),
        'catch_actions': catchActions.map((e) => e.toMap()).toList(),
      };
}

/// Stops the workflow execution immediately.
class StopWorkflowAction extends WorkflowAction {
  StopWorkflowAction() : super('stop_workflow');

  @override
  Map<String, dynamic> toMap() => {'type': 'stop_workflow'};
}

/// Configures retry logic for HTTP actions.
class WorkflowRetryPolicy {
  final int max;
  final int delayMs;

  WorkflowRetryPolicy({required this.max, required this.delayMs});

  factory WorkflowRetryPolicy.fromMap(Map<String, dynamic> map) =>
      WorkflowRetryPolicy(
        max: map['max'] ?? 0,
        delayMs: map['delay_ms'] ?? map['delayMs'] ?? 0,
      );

  Map<String, dynamic> toMap() => {'max': max, 'delay_ms': delayMs};
}
