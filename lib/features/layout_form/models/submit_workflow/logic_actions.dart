import 'submit_workflow.dart';
import 'workflow_action.dart';

/// Conditional branching logic.
class ConditionAction extends WorkflowAction {
  final String condition; // "if" expression
  final List<WorkflowAction> thenActions;
  final List<WorkflowAction> elseActions;

  ConditionAction({
    required this.condition,
    required this.thenActions,
    this.elseActions = const [],
  }) : super('condition');

  factory ConditionAction.fromMap(Map<String, dynamic> map) {
    return ConditionAction(
      condition: map['if'] ?? '',
      thenActions:
          SubmitWorkflow.parseActions(map['then_actions'] ?? map['then']),
      elseActions:
          SubmitWorkflow.parseActions(map['else_actions'] ?? map['else']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'condition',
        'if': condition,
        'then_actions': thenActions.map((e) => e.toMap()).toList(),
        if (elseActions.isNotEmpty)
          'else_actions': elseActions.map((e) => e.toMap()).toList(),
      };
}

/// Iterates over a list of items.
class LoopAction extends WorkflowAction {
  final dynamic items; // Path to items, e.g. "{{ form.items }}"
  final String itemVar;
  final String? indexVar;
  final List<WorkflowAction> actions;

  LoopAction({
    required this.items,
    this.itemVar = 'item',
    this.indexVar,
    required this.actions,
  }) : super('loop');

  factory LoopAction.fromMap(Map<String, dynamic> map) {
    return LoopAction(
      items: map['items'],
      itemVar: map['item_var'] ?? map['itemVar'] ?? 'item',
      indexVar: map['index_var'] ?? map['indexVar'],
      actions: SubmitWorkflow.parseActions(map['actions']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'loop',
        'items': items,
        'item_var': itemVar,
        if (indexVar != null) 'index_var': indexVar,
        'actions': actions.map((e) => e.toMap()).toList(),
      };
}

/// Error handling block.
class TryCatchAction extends WorkflowAction {
  final List<WorkflowAction> tryActions;
  final List<WorkflowAction> catchActions;

  TryCatchAction({required this.tryActions, required this.catchActions})
      : super('try_catch');

  factory TryCatchAction.fromMap(Map<String, dynamic> map) {
    return TryCatchAction(
      tryActions:
          SubmitWorkflow.parseActions(map['try_actions'] ?? map['try']),
      catchActions:
          SubmitWorkflow.parseActions(map['catch_actions'] ?? map['catch']),
    );
  }

  @override
  Map<String, dynamic> toMap() => {
        'type': 'try_catch',
        'try_actions': tryActions.map((e) => e.toMap()).toList(),
        'catch_actions': catchActions.map((e) => e.toMap()).toList(),
      };
}

/// Stops the workflow execution immediately.
class StopWorkflowAction extends WorkflowAction {
  StopWorkflowAction() : super('stop_workflow');

  @override
  Map<String, dynamic> toMap() => {'type': 'stop_workflow'};
}
