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

/// Navigates to another entity/page.
class NavigateAction extends WorkflowAction {
  final String entityId;
  final Map<String, dynamic> params;

  NavigateAction({required this.entityId, required this.params})
      : super('navigate');

  factory NavigateAction.fromMap(Map<String, dynamic> map) {
    final rawParams = map['params'];
    final params = rawParams is Map<String, dynamic>
        ? rawParams
        : rawParams is Map
            ? Map<String, dynamic>.from(rawParams)
            : <String, dynamic>{};
    return NavigateAction(
      entityId: (map['entity_id'] ?? '').toString(),
      params: params,
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'navigate',
        'entity_id': entityId,
        'params': params,
      };
}
