import 'dart:convert';
import 'workflow_action.dart';

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
      actions: parseActions(map['actions']),
      onSuccess: parseActions(map['on_success'] ?? map['onSuccess']),
      onError: parseActions(map['on_error'] ?? map['onError']),
    );
  }

  factory SubmitWorkflow.fromJson(String source) =>
      SubmitWorkflow.fromMap(json.decode(source));

  static List<WorkflowAction> parseActions(dynamic raw) {
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
