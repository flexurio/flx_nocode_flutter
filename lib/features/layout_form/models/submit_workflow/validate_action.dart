import 'workflow_action.dart';

/// Validates form data.
class ValidateAction extends WorkflowAction {
  final String scope; // "all" | "current_step"

  ValidateAction({this.scope = 'all'}) : super('validate');

  factory ValidateAction.fromMap(Map<String, dynamic> map) =>
      ValidateAction(scope: map['scope'] ?? 'all');

  @override
  Map<String, dynamic> toMap() => {'type': 'validate', 'scope': scope};
}
