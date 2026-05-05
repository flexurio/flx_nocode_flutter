import 'workflow_action.dart';

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
