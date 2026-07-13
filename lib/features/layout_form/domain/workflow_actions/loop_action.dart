import 'dart:convert';

import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

/// An action that iterates over a list of items and executes a sequence of actions for each.
///
/// Example JSON:
/// ```json
/// {
///   "type": "loop",
///   "items": "{{ form.data_list }}",
///   "item_var": "row",
///   "actions": [ ... ]
/// }
/// ```
class LoopAction implements WorkflowAction {
  /// The list of items to iterate over.
  /// Can be a literal list, a template string (e.g., "{{ items }}"), or a resolved List.
  final dynamic items;

  /// The variable name used to store the current item in the workflow context's `vars`.
  /// Defaults to "item" if not provided in JSON.
  final String itemVar;

  /// Optional variable name used to store the current iteration index (0-based) in `vars`.
  final String? indexVar;

  /// The list of actions to execute for each iteration of the loop.
  final List<WorkflowAction> actions;

  const LoopAction({
    required this.items,
    required this.itemVar,
    this.indexVar,
    required this.actions,
  });

  factory LoopAction.fromJson(Map<String, dynamic> json) {
    final itemVar =
        (json['item_var'] ?? json['itemVar'] ?? 'item').toString().trim();
    if (itemVar.isEmpty) {
      throw const WorkflowConfigurationException(
          '"loop" action requires "item_var".');
    }

    final actions = ActionFactory.coerceActions(
      json['actions'],
      'actions',
      allowNull: false,
    );
    return LoopAction(
      items: json['items'],
      itemVar: itemVar,
      indexVar: (json['index_var'] ?? json['indexVar'])?.toString(),
      actions: actions,
    );
  }

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    print('[LoopAction] Resolving items: $items');
    var resolved = Template.resolve(items, ctx);
    print('[LoopAction] Resolved value: $resolved');
    print('[LoopAction] Resolved type: ${resolved.runtimeType}');

    if (resolved == null) {
      print('[LoopAction] Items resolved to null, skipping loop.');
      return;
    }

    if (resolved is String && resolved.trim().isEmpty) {
      print('[LoopAction] Items resolved to empty string, skipping loop.');
      return;
    }

    if (resolved is String) {
      try {
        final decoded = jsonDecode(resolved);
        if (decoded is List) {
          resolved = decoded;
        }
      } catch (e) {
        // Not a JSON list, fall through to error
      }
    }

    if (resolved is! List) {
      throw WorkflowExecutionException(
        'Loop items must resolve to a list, got ${resolved.runtimeType}. Value: $resolved',
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
