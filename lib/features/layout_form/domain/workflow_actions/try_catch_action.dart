import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class TryCatchAction implements WorkflowAction {
  final List<WorkflowAction> tryActions;
  final List<WorkflowAction> catchActions;

  const TryCatchAction({required this.tryActions, required this.catchActions});

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    try {
      print('[TryCatchAction] Entering TRY block');
      for (final a in tryActions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
      print('[TryCatchAction] TRY block completed successfully');
    } catch (e, st) {
      print('[TryCatchAction] Caught error: $e');
      ctx.vars['last_error'] = e is WorkflowException ? e.message : '$e';
      ctx.vars['last_error_stacktrace'] = st.toString();

      print('[TryCatchAction] Entering CATCH block');
      for (final a in catchActions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
      print('[TryCatchAction] CATCH block completed');
    }
  }
}
