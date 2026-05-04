import 'validate_action.dart';
import 'http_action.dart';
import 'var_actions.dart';
import 'ui_actions.dart';
import 'logic_actions.dart';
import 'export_action.dart';

/// Abstract base for all workflow actions.
abstract class WorkflowAction {
  final String type;

  WorkflowAction(this.type);

  factory WorkflowAction.fromMap(Map<String, dynamic> map) {
    final type = map['type']?.toString();
    switch (type) {
      case 'validate':
        return ValidateAction.fromMap(map);
      case 'http':
        return HttpAction.fromMap(map);
      case 'set_var':
        return SetVarAction.fromMap(map);
      case 'append_var':
        return AppendVarAction.fromMap(map);
      case 'toast':
        return ToastAction.fromMap(map);
      case 'close_modal':
        return CloseModalAction();
      case 'refresh':
        return RefreshAction.fromMap(map);
      case 'condition':
        return ConditionAction.fromMap(map);
      case 'loop':
        return LoopAction.fromMap(map);
      case 'try_catch':
        return TryCatchAction.fromMap(map);
      case 'stop_workflow':
        return StopWorkflowAction();
      case 'export':
        return ExportAction.fromMap(map);
      default:
        throw FormatException('Unknown workflow action type: $type');
    }
  }

  Map<String, dynamic> toMap();
}
