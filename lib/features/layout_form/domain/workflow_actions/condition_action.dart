import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class ConditionAction implements WorkflowAction {
  final String ifExpr;
  final List<WorkflowAction> thenActions;
  final List<WorkflowAction> elseActions;

  const ConditionAction({
    required this.ifExpr,
    required this.thenActions,
    required this.elseActions,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    try {
      final ok = Expr.evalCondition(ifExpr, ctx);
      print('[ConditionAction] if "$ifExpr" => $ok');
      final branch = ok ? thenActions : elseActions;

      print(
          '[ConditionAction] Executing ${branch.length} actions in ${ok ? "THEN" : "ELSE"} branch');
      for (final a in branch) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    } catch (e, st) {
      if (e is WorkflowException) rethrow;
      throw WorkflowExecutionException(
        'Condition "$ifExpr" failed: $e',
        cause: e,
        stackTrace: st,
      );
    }
  }
}
