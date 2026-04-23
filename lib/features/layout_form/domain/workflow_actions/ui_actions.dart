import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class ToastAction implements WorkflowAction {
  final String variant;
  final dynamic message;
  const ToastAction({required this.variant, required this.message});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final msg = Template.resolve(message, ctx)?.toString() ?? '';
    await ui.toast(variant, msg);
  }
}

class CloseModalAction implements WorkflowAction {
  const CloseModalAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    await ui.closeModal();
  }
}

class RefreshAction implements WorkflowAction {
  final String target;
  const RefreshAction({required this.target});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final t = Template.resolve(target, ctx)?.toString() ?? target;
    await ui.refresh(t);
  }
}
