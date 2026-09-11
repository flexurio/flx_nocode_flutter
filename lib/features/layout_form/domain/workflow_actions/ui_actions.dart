import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class ToastAction implements WorkflowAction {
  final String variant;
  final dynamic message;
  const ToastAction({required this.variant, required this.message});

  factory ToastAction.fromJson(Map<String, dynamic> json) {
    return ToastAction(
      variant: (json['variant'] ?? 'info').toString(),
      message: json['message'] ?? '',
    );
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final msg = Template.resolve(message, ctx)?.toString() ?? '';
    await ui.toast(variant, msg);
  }
}

class CloseModalAction implements WorkflowAction {
  const CloseModalAction();

  factory CloseModalAction.fromJson(Map<String, dynamic> json) =>
      const CloseModalAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    await ui.closeModal();
  }
}

class RefreshAction implements WorkflowAction {
  final String target;
  const RefreshAction({required this.target});

  factory RefreshAction.fromJson(Map<String, dynamic> json) {
    return RefreshAction(target: (json['target'] ?? '').toString());
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final t = Template.resolve(target, ctx)?.toString() ?? target;
    await ui.refresh(t);
  }
}

/// Navigates to another entity/page after a successful workflow.
///
/// JSON schema:
/// ```json
/// {
///   "type": "navigate",
///   "entity_id": "lbb_expense_transaction_details",
///   "params": {
///     "id": "{{ http.request.data.id }}",
///     "period": "{{ form.period }}"
///   }
/// }
/// ```
class NavigateAction implements WorkflowAction {
  /// The entity ID to navigate to (e.g. `lbb_expense_transaction_details`).
  final String entityId;

  /// Optional parameters to pass to the destination page as `parentData`.
  /// Supports template expressions (e.g. `{{ http.request.data.id }}`).
  final Map<String, dynamic> params;

  const NavigateAction({required this.entityId, required this.params});

  factory NavigateAction.fromJson(Map<String, dynamic> json) {
    final rawParams = json['params'];
    final params = rawParams is Map<String, dynamic>
        ? rawParams
        : rawParams is Map
            ? Map<String, dynamic>.from(rawParams)
            : <String, dynamic>{};
    return NavigateAction(
      entityId: (json['entity_id'] ?? '').toString(),
      params: params,
    );
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final resolvedEntityId =
        Template.resolve(entityId, ctx)?.toString() ?? entityId;
    final resolvedParams = Template.resolve(params, ctx);
    final paramsMap = resolvedParams is Map<String, dynamic>
        ? resolvedParams
        : resolvedParams is Map
            ? Map<String, dynamic>.from(resolvedParams)
            : <String, dynamic>{};
    await ui.navigate(resolvedEntityId, paramsMap);
  }
}
