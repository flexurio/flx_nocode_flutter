import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class LoopAction implements WorkflowAction {
  final dynamic items; // list literal OR string with {{ }} OR already List
  final String itemVar;
  final String? indexVar;
  final List<WorkflowAction> actions;

  const LoopAction({
    required this.items,
    required this.itemVar,
    this.indexVar,
    required this.actions,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    final resolved = Template.resolve(items, ctx);
    print('[LoopAction] Resolving items...');
    if (resolved == null) {
      print('[LoopAction] Items resolved to null, skipping loop.');
      return;
    }
    if (resolved is! List) {
      throw WorkflowExecutionException(
        'Loop items must resolve to a list, got ${resolved.runtimeType}.',
      );
    }

    print('[LoopAction] Starting loop with ${resolved.length} items.');
    for (var i = 0; i < resolved.length; i++) {
      if (ctx.stopped) {
        print('[LoopAction] Loop stopped at index $i');
        return;
      }
      print('[LoopAction] Iteration $i / ${resolved.length}');
      ctx.vars[itemVar] = resolved[i];
      if (indexVar != null) ctx.vars[indexVar!] = i;

      for (final a in actions) {
        if (ctx.stopped) return;
        await a.execute(ctx, ui);
      }
    }
    print('[LoopAction] Loop completed.');
  }
}
