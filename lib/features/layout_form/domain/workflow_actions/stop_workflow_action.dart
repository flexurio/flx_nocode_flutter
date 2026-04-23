import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class StopWorkflowAction implements WorkflowAction {
  const StopWorkflowAction();
  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    ctx.stopped = true;
  }
}
